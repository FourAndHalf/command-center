import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/design_tokens.dart';
import '../../widgets/status_badge.dart';
import 'timeline_entry.dart';

const double _spineWidth = 24;
const double _dotY = 22;

Color _toneColor(ColorScheme scheme, BadgeTone tone) => switch (tone) {
      BadgeTone.tripwire => AppColors.tripwireAmber,
      BadgeTone.resolved => AppColors.resolvedEmerald,
      BadgeTone.calibration => scheme.primary,
      BadgeTone.critical => scheme.error,
      BadgeTone.neutral => scheme.onSurfaceVariant,
    };

String _formatDate(DateTime d) {
  const months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];
  return '${months[d.month - 1]} ${d.day}';
}

/// One row of the timeline: a card on its own side of the central spine,
/// with the spine (line, node dot, and a stub toward the card) in the middle.
class TimelineRow extends StatelessWidget {
  const TimelineRow({super.key, required this.entry});

  final TimelineEntry entry;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final onLeft = entry.side == TimelineSide.left;
    final card = _TimelineCard(entry: entry);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: onLeft ? card : const SizedBox.shrink()),
          SizedBox(
            width: _spineWidth,
            child: CustomPaint(
              painter: _SpinePainter(
                color: _toneColor(scheme, entry.tone),
                backgroundColor: scheme.surface,
                stub: onLeft ? TimelineSide.left : TimelineSide.right,
              ),
            ),
          ),
          Expanded(child: onLeft ? const SizedBox.shrink() : card),
        ],
      ),
    );
  }
}

class _SpinePainter extends CustomPainter {
  _SpinePainter({
    required this.color,
    required this.backgroundColor,
    required this.stub,
  });

  final Color color;
  final Color backgroundColor;
  final TimelineSide stub;

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final line = Paint()
      ..color = color.withValues(alpha: 0.35)
      ..strokeWidth = 1.5;
    canvas.drawLine(Offset(cx, 0), Offset(cx, size.height), line);
    canvas.drawLine(
      Offset(cx, _dotY),
      Offset(stub == TimelineSide.left ? 0 : size.width, _dotY),
      line,
    );
    canvas.drawCircle(Offset(cx, _dotY), 6, Paint()..color = backgroundColor);
    canvas.drawCircle(
      Offset(cx, _dotY),
      5,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  @override
  bool shouldRepaint(_SpinePainter old) =>
      old.color != color ||
      old.backgroundColor != backgroundColor ||
      old.stub != stub;
}

class _TimelineCard extends StatefulWidget {
  const _TimelineCard({required this.entry});

  final TimelineEntry entry;

  @override
  State<_TimelineCard> createState() => _TimelineCardState();
}

class _TimelineCardState extends State<_TimelineCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final entry = widget.entry;
    final scheme = Theme.of(context).colorScheme;
    // Anchors (decisions/reviews/goals) read stronger than the signals
    // around them, so the original decision stays the visual focus.
    final isAnchor = entry.side == TimelineSide.left;
    final route = entry.route;
    // Anchors open their detail screen; signals expand in place to show the
    // full entry (with a link through to the parent record, if any).
    final expanded = !isAnchor && _expanded;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        color: isAnchor
            ? scheme.surfaceContainerLow
            : scheme.surfaceContainerLow.withValues(alpha: 0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          side: BorderSide(
            color: isAnchor ? scheme.outline : scheme.outlineVariant,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: isAnchor
              ? (route == null ? null : () => context.push(route))
              : () => setState(() => _expanded = !_expanded),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.sm + 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _formatDate(entry.date),
                  style: AppTypography.monoMetric.copyWith(
                    fontSize: 12,
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerLeft,
                  child: StatusBadge(entry.badge, tone: entry.tone),
                ),
                const SizedBox(height: 6),
                Text(
                  entry.title,
                  maxLines: isAnchor ? 3 : (expanded ? null : 2),
                  overflow: expanded ? null : TextOverflow.ellipsis,
                  style: isAnchor
                      ? AppTypography.headlineMd.copyWith(fontSize: 15)
                      : AppTypography.bodySm,
                ),
                if (entry.subtitle != null && entry.subtitle!.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    entry.subtitle!,
                    maxLines: expanded ? null : 2,
                    overflow: expanded ? null : TextOverflow.ellipsis,
                    style: AppTypography.bodySm.copyWith(
                      fontSize: 12,
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ],
                if (entry.parent != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    '↳ ${entry.parent}',
                    maxLines: expanded ? null : 1,
                    overflow: expanded ? null : TextOverflow.ellipsis,
                    style: AppTypography.labelCaps.copyWith(
                      fontSize: 10,
                      color: scheme.outline,
                    ),
                  ),
                ],
                if (expanded && route != null) ...[
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: () => context.push(route),
                    child: Text(
                      'OPEN RECORD →',
                      style: AppTypography.labelCaps.copyWith(
                        fontSize: 10,
                        color: scheme.primary,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Month label centered over the spine.
class TimelineMonthHeader extends StatelessWidget {
  const TimelineMonthHeader({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June', 'July',
      'August', 'September', 'October', 'November', 'December',
    ];
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.md, bottom: AppSpacing.xs),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: scheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(AppRadius.full),
            border: Border.all(color: scheme.outlineVariant),
          ),
          child: Text(
            '${months[date.month - 1]} ${date.year}'.toUpperCase(),
            style: AppTypography.labelCaps
                .copyWith(color: scheme.onSurfaceVariant),
          ),
        ),
      ),
    );
  }
}
