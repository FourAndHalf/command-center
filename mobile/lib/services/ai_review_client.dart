import 'dart:convert';
import 'dart:io';

import 'package:uuid/uuid.dart';

/// Input contract for an external perspective. This is deliberately
/// provider-neutral so the review feature can later use another compatible
/// endpoint without changing its UI or stored data model.
class ReviewPerspectiveInput {
  const ReviewPerspectiveInput({
    required this.decisionTitle,
    this.decisionObjective,
    this.expectedOutcome,
    required this.entries,
  });

  final String decisionTitle;
  final String? decisionObjective;
  final String? expectedOutcome;
  final List<ReviewPerspectiveEntry> entries;
}

class ReviewPerspectiveEntry {
  const ReviewPerspectiveEntry({
    required this.kind,
    required this.recordedAt,
    this.occurredAt,
    this.focus,
    this.expectedEvidence,
    this.observedResult,
    this.blocker,
    this.lesson,
    this.nextStep,
  });

  final String kind;
  final DateTime recordedAt;
  final DateTime? occurredAt;
  final String? focus;
  final String? expectedEvidence;
  final String? observedResult;
  final String? blocker;
  final String? lesson;
  final String? nextStep;
}

/// Small, model-agnostic HTTP client for the Responses-compatible API shape.
/// The caller supplies the model and endpoint credentials at runtime.
class AiReviewClient {
  AiReviewClient({
    required this.apiKey,
    this.model = 'gpt-5-mini',
    this.baseUrl = 'https://api.openai.com/v1',
  });

  final String apiKey;
  final String model;
  final String baseUrl;

  Future<String> generatePerspective(ReviewPerspectiveInput input) async {
    if (apiKey.trim().isEmpty) {
      throw const AiReviewException(
        'Add an API key in Settings before requesting a perspective.',
      );
    }
    final client = HttpClient();
    try {
      final request = await client.postUrl(Uri.parse('$baseUrl/responses'));
      request.headers
        ..set(HttpHeaders.authorizationHeader, 'Bearer ${apiKey.trim()}')
        ..contentType = ContentType.json
        ..set('X-Client-Request-Id', const Uuid().v4());
      request.write(
        jsonEncode({
          'model': model,
          'input': [
            {
              'role': 'system',
              'content': [
                {
                  'type': 'input_text',
                  'text': '''You are an experienced, fair third-person reviewer helping a person learn from a decision.
Return an editable draft perspective, not a verdict or diagnosis. Separate recorded facts, the user's stated expectations, observations, and your inferences. Do not invent dates, motives, emotions, outcomes, or missing evidence. Name uncertainty. Do not score the person's worth or label the decision good or bad. Offer at most three concrete questions or next experiments. Keep the tone calm, specific, and concise.''',
                },
              ],
            },
            {
              'role': 'user',
              'content': [
                {'type': 'input_text', 'text': _prompt(input)},
              ],
            },
          ],
        }),
      );
      final response = await request.close();
      final body = await utf8.decoder.bind(response).join();
      final decoded = jsonDecode(body);
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw AiReviewException(
          'Perspective request failed (${response.statusCode}).',
        );
      }
      final text = _extractText(decoded);
      if (text == null || text.trim().isEmpty) {
        throw const AiReviewException(
          'The perspective response contained no text.',
        );
      }
      return text.trim();
    } on AiReviewException {
      rethrow;
    } on SocketException {
      throw const AiReviewException(
        'Could not reach the perspective service. Check connectivity and try again.',
      );
    } on FormatException {
      throw const AiReviewException(
        'The perspective service returned an unreadable response.',
      );
    } finally {
      client.close(force: true);
    }
  }

  String _prompt(ReviewPerspectiveInput input) {
    final buffer = StringBuffer()
      ..writeln('Decision: ${input.decisionTitle}')
      ..writeln('Objective: ${input.decisionObjective ?? 'Unknown'}')
      ..writeln('Expected outcome: ${input.expectedOutcome ?? 'Unknown'}')
      ..writeln(
        '\nProject records (user-provided; do not treat missing fields as facts):',
      );
    for (final entry in input.entries) {
      buffer
        ..writeln('\n- Kind: ${entry.kind}')
        ..writeln('  Recorded: ${entry.recordedAt.toIso8601String()}')
        ..writeln(
          '  Occurred: ${entry.occurredAt?.toIso8601String() ?? 'Unknown'}',
        )
        ..writeln('  Focus: ${entry.focus ?? 'Unknown'}')
        ..writeln('  Expected evidence: ${entry.expectedEvidence ?? 'Unknown'}')
        ..writeln('  Observed result: ${entry.observedResult ?? 'Unknown'}')
        ..writeln('  Blocker: ${entry.blocker ?? 'Unknown'}')
        ..writeln('  Lesson: ${entry.lesson ?? 'Unknown'}')
        ..writeln('  Next step: ${entry.nextStep ?? 'Unknown'}');
    }
    return buffer.toString();
  }

  String? _extractText(dynamic decoded) {
    if (decoded is! Map<String, dynamic>) return null;
    final direct = decoded['output_text'];
    if (direct is String) return direct;
    final output = decoded['output'];
    if (output is List) {
      for (final item in output) {
        if (item is! Map) {
          continue;
        }
        final content = item['content'];
        if (content is List) {
          for (final part in content) {
            if (part is Map && part['text'] is String) {
              return part['text'] as String;
            }
          }
        }
      }
    }
    return null;
  }
}

class AiReviewException implements Exception {
  const AiReviewException(this.message);

  final String message;

  @override
  String toString() => message;
}
