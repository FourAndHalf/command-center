// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DecisionsTable extends Decisions
    with TableInfo<$DecisionsTable, Decision> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DecisionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _decisionAtMeta = const VerificationMeta(
    'decisionAt',
  );
  @override
  late final GeneratedColumn<DateTime> decisionAt = GeneratedColumn<DateTime>(
    'decision_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contextMeta = const VerificationMeta(
    'context',
  );
  @override
  late final GeneratedColumn<String> context = GeneratedColumn<String>(
    'context',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _objectiveMeta = const VerificationMeta(
    'objective',
  );
  @override
  late final GeneratedColumn<String> objective = GeneratedColumn<String>(
    'objective',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rationaleMeta = const VerificationMeta(
    'rationale',
  );
  @override
  late final GeneratedColumn<String> rationale = GeneratedColumn<String>(
    'rationale',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _alternativesMeta = const VerificationMeta(
    'alternatives',
  );
  @override
  late final GeneratedColumn<String> alternatives = GeneratedColumn<String>(
    'alternatives',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _constraintsMeta = const VerificationMeta(
    'constraints',
  );
  @override
  late final GeneratedColumn<String> constraints = GeneratedColumn<String>(
    'constraints',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  emotionalContext =
      GeneratedColumn<String>(
        'emotional_context',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<Map<String, dynamic>?>(
        $DecisionsTable.$converteremotionalContextn,
      );
  static const VerificationMeta _expectedOutcomeMeta = const VerificationMeta(
    'expectedOutcome',
  );
  @override
  late final GeneratedColumn<String> expectedOutcome = GeneratedColumn<String>(
    'expected_outcome',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _successCriteriaMeta = const VerificationMeta(
    'successCriteria',
  );
  @override
  late final GeneratedColumn<String> successCriteria = GeneratedColumn<String>(
    'success_criteria',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _failureConditionsMeta = const VerificationMeta(
    'failureConditions',
  );
  @override
  late final GeneratedColumn<String> failureConditions =
      GeneratedColumn<String>(
        'failure_conditions',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<int> confidence = GeneratedColumn<int>(
    'confidence',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _importanceMeta = const VerificationMeta(
    'importance',
  );
  @override
  late final GeneratedColumn<int> importance = GeneratedColumn<int>(
    'importance',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reversibilityMeta = const VerificationMeta(
    'reversibility',
  );
  @override
  late final GeneratedColumn<int> reversibility = GeneratedColumn<int>(
    'reversibility',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _decideByMeta = const VerificationMeta(
    'decideBy',
  );
  @override
  late final GeneratedColumn<DateTime> decideBy = GeneratedColumn<DateTime>(
    'decide_by',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<dynamic>?, String>
  openQuestions = GeneratedColumn<String>(
    'open_questions',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<List<dynamic>?>($DecisionsTable.$converteropenQuestionsn);
  @override
  late final GeneratedColumnWithTypeConverter<List<dynamic>?, String> tags =
      GeneratedColumn<String>(
        'tags',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<dynamic>?>($DecisionsTable.$convertertagsn);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    type,
    status,
    decisionAt,
    context,
    objective,
    rationale,
    alternatives,
    constraints,
    emotionalContext,
    expectedOutcome,
    successCriteria,
    failureConditions,
    confidence,
    importance,
    reversibility,
    decideBy,
    openQuestions,
    tags,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'decisions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Decision> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('decision_at')) {
      context.handle(
        _decisionAtMeta,
        decisionAt.isAcceptableOrUnknown(data['decision_at']!, _decisionAtMeta),
      );
    }
    if (data.containsKey('context')) {
      context.handle(
        _contextMeta,
        this.context.isAcceptableOrUnknown(data['context']!, _contextMeta),
      );
    }
    if (data.containsKey('objective')) {
      context.handle(
        _objectiveMeta,
        objective.isAcceptableOrUnknown(data['objective']!, _objectiveMeta),
      );
    }
    if (data.containsKey('rationale')) {
      context.handle(
        _rationaleMeta,
        rationale.isAcceptableOrUnknown(data['rationale']!, _rationaleMeta),
      );
    }
    if (data.containsKey('alternatives')) {
      context.handle(
        _alternativesMeta,
        alternatives.isAcceptableOrUnknown(
          data['alternatives']!,
          _alternativesMeta,
        ),
      );
    }
    if (data.containsKey('constraints')) {
      context.handle(
        _constraintsMeta,
        constraints.isAcceptableOrUnknown(
          data['constraints']!,
          _constraintsMeta,
        ),
      );
    }
    if (data.containsKey('expected_outcome')) {
      context.handle(
        _expectedOutcomeMeta,
        expectedOutcome.isAcceptableOrUnknown(
          data['expected_outcome']!,
          _expectedOutcomeMeta,
        ),
      );
    }
    if (data.containsKey('success_criteria')) {
      context.handle(
        _successCriteriaMeta,
        successCriteria.isAcceptableOrUnknown(
          data['success_criteria']!,
          _successCriteriaMeta,
        ),
      );
    }
    if (data.containsKey('failure_conditions')) {
      context.handle(
        _failureConditionsMeta,
        failureConditions.isAcceptableOrUnknown(
          data['failure_conditions']!,
          _failureConditionsMeta,
        ),
      );
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    }
    if (data.containsKey('importance')) {
      context.handle(
        _importanceMeta,
        importance.isAcceptableOrUnknown(data['importance']!, _importanceMeta),
      );
    }
    if (data.containsKey('reversibility')) {
      context.handle(
        _reversibilityMeta,
        reversibility.isAcceptableOrUnknown(
          data['reversibility']!,
          _reversibilityMeta,
        ),
      );
    }
    if (data.containsKey('decide_by')) {
      context.handle(
        _decideByMeta,
        decideBy.isAcceptableOrUnknown(data['decide_by']!, _decideByMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Decision map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Decision(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      decisionAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}decision_at'],
      ),
      context: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}context'],
      ),
      objective: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}objective'],
      ),
      rationale: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rationale'],
      ),
      alternatives: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alternatives'],
      ),
      constraints: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}constraints'],
      ),
      emotionalContext: $DecisionsTable.$converteremotionalContextn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}emotional_context'],
        ),
      ),
      expectedOutcome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expected_outcome'],
      ),
      successCriteria: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}success_criteria'],
      ),
      failureConditions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}failure_conditions'],
      ),
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}confidence'],
      ),
      importance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}importance'],
      ),
      reversibility: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reversibility'],
      ),
      decideBy: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}decide_by'],
      ),
      openQuestions: $DecisionsTable.$converteropenQuestionsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}open_questions'],
        ),
      ),
      tags: $DecisionsTable.$convertertagsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}tags'],
        ),
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $DecisionsTable createAlias(String alias) {
    return $DecisionsTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String>
  $converteremotionalContext = const JsonMapConverter();
  static TypeConverter<Map<String, dynamic>?, String?>
  $converteremotionalContextn = NullAwareTypeConverter.wrap(
    $converteremotionalContext,
  );
  static TypeConverter<List<dynamic>, String> $converteropenQuestions =
      const JsonListConverter();
  static TypeConverter<List<dynamic>?, String?> $converteropenQuestionsn =
      NullAwareTypeConverter.wrap($converteropenQuestions);
  static TypeConverter<List<dynamic>, String> $convertertags =
      const JsonListConverter();
  static TypeConverter<List<dynamic>?, String?> $convertertagsn =
      NullAwareTypeConverter.wrap($convertertags);
}

class Decision extends DataClass implements Insertable<Decision> {
  final String id;
  final String title;
  final String type;
  final String status;
  final DateTime? decisionAt;
  final String? context;
  final String? objective;
  final String? rationale;
  final String? alternatives;
  final String? constraints;
  final Map<String, dynamic>? emotionalContext;
  final String? expectedOutcome;
  final String? successCriteria;
  final String? failureConditions;
  final int? confidence;
  final int? importance;
  final int? reversibility;
  final DateTime? decideBy;
  final List<dynamic>? openQuestions;
  final List<dynamic>? tags;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Decision({
    required this.id,
    required this.title,
    required this.type,
    required this.status,
    this.decisionAt,
    this.context,
    this.objective,
    this.rationale,
    this.alternatives,
    this.constraints,
    this.emotionalContext,
    this.expectedOutcome,
    this.successCriteria,
    this.failureConditions,
    this.confidence,
    this.importance,
    this.reversibility,
    this.decideBy,
    this.openQuestions,
    this.tags,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['type'] = Variable<String>(type);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || decisionAt != null) {
      map['decision_at'] = Variable<DateTime>(decisionAt);
    }
    if (!nullToAbsent || context != null) {
      map['context'] = Variable<String>(context);
    }
    if (!nullToAbsent || objective != null) {
      map['objective'] = Variable<String>(objective);
    }
    if (!nullToAbsent || rationale != null) {
      map['rationale'] = Variable<String>(rationale);
    }
    if (!nullToAbsent || alternatives != null) {
      map['alternatives'] = Variable<String>(alternatives);
    }
    if (!nullToAbsent || constraints != null) {
      map['constraints'] = Variable<String>(constraints);
    }
    if (!nullToAbsent || emotionalContext != null) {
      map['emotional_context'] = Variable<String>(
        $DecisionsTable.$converteremotionalContextn.toSql(emotionalContext),
      );
    }
    if (!nullToAbsent || expectedOutcome != null) {
      map['expected_outcome'] = Variable<String>(expectedOutcome);
    }
    if (!nullToAbsent || successCriteria != null) {
      map['success_criteria'] = Variable<String>(successCriteria);
    }
    if (!nullToAbsent || failureConditions != null) {
      map['failure_conditions'] = Variable<String>(failureConditions);
    }
    if (!nullToAbsent || confidence != null) {
      map['confidence'] = Variable<int>(confidence);
    }
    if (!nullToAbsent || importance != null) {
      map['importance'] = Variable<int>(importance);
    }
    if (!nullToAbsent || reversibility != null) {
      map['reversibility'] = Variable<int>(reversibility);
    }
    if (!nullToAbsent || decideBy != null) {
      map['decide_by'] = Variable<DateTime>(decideBy);
    }
    if (!nullToAbsent || openQuestions != null) {
      map['open_questions'] = Variable<String>(
        $DecisionsTable.$converteropenQuestionsn.toSql(openQuestions),
      );
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(
        $DecisionsTable.$convertertagsn.toSql(tags),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DecisionsCompanion toCompanion(bool nullToAbsent) {
    return DecisionsCompanion(
      id: Value(id),
      title: Value(title),
      type: Value(type),
      status: Value(status),
      decisionAt: decisionAt == null && nullToAbsent
          ? const Value.absent()
          : Value(decisionAt),
      context: context == null && nullToAbsent
          ? const Value.absent()
          : Value(context),
      objective: objective == null && nullToAbsent
          ? const Value.absent()
          : Value(objective),
      rationale: rationale == null && nullToAbsent
          ? const Value.absent()
          : Value(rationale),
      alternatives: alternatives == null && nullToAbsent
          ? const Value.absent()
          : Value(alternatives),
      constraints: constraints == null && nullToAbsent
          ? const Value.absent()
          : Value(constraints),
      emotionalContext: emotionalContext == null && nullToAbsent
          ? const Value.absent()
          : Value(emotionalContext),
      expectedOutcome: expectedOutcome == null && nullToAbsent
          ? const Value.absent()
          : Value(expectedOutcome),
      successCriteria: successCriteria == null && nullToAbsent
          ? const Value.absent()
          : Value(successCriteria),
      failureConditions: failureConditions == null && nullToAbsent
          ? const Value.absent()
          : Value(failureConditions),
      confidence: confidence == null && nullToAbsent
          ? const Value.absent()
          : Value(confidence),
      importance: importance == null && nullToAbsent
          ? const Value.absent()
          : Value(importance),
      reversibility: reversibility == null && nullToAbsent
          ? const Value.absent()
          : Value(reversibility),
      decideBy: decideBy == null && nullToAbsent
          ? const Value.absent()
          : Value(decideBy),
      openQuestions: openQuestions == null && nullToAbsent
          ? const Value.absent()
          : Value(openQuestions),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Decision.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Decision(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      type: serializer.fromJson<String>(json['type']),
      status: serializer.fromJson<String>(json['status']),
      decisionAt: serializer.fromJson<DateTime?>(json['decisionAt']),
      context: serializer.fromJson<String?>(json['context']),
      objective: serializer.fromJson<String?>(json['objective']),
      rationale: serializer.fromJson<String?>(json['rationale']),
      alternatives: serializer.fromJson<String?>(json['alternatives']),
      constraints: serializer.fromJson<String?>(json['constraints']),
      emotionalContext: serializer.fromJson<Map<String, dynamic>?>(
        json['emotionalContext'],
      ),
      expectedOutcome: serializer.fromJson<String?>(json['expectedOutcome']),
      successCriteria: serializer.fromJson<String?>(json['successCriteria']),
      failureConditions: serializer.fromJson<String?>(
        json['failureConditions'],
      ),
      confidence: serializer.fromJson<int?>(json['confidence']),
      importance: serializer.fromJson<int?>(json['importance']),
      reversibility: serializer.fromJson<int?>(json['reversibility']),
      decideBy: serializer.fromJson<DateTime?>(json['decideBy']),
      openQuestions: serializer.fromJson<List<dynamic>?>(json['openQuestions']),
      tags: serializer.fromJson<List<dynamic>?>(json['tags']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<String>(type),
      'status': serializer.toJson<String>(status),
      'decisionAt': serializer.toJson<DateTime?>(decisionAt),
      'context': serializer.toJson<String?>(context),
      'objective': serializer.toJson<String?>(objective),
      'rationale': serializer.toJson<String?>(rationale),
      'alternatives': serializer.toJson<String?>(alternatives),
      'constraints': serializer.toJson<String?>(constraints),
      'emotionalContext': serializer.toJson<Map<String, dynamic>?>(
        emotionalContext,
      ),
      'expectedOutcome': serializer.toJson<String?>(expectedOutcome),
      'successCriteria': serializer.toJson<String?>(successCriteria),
      'failureConditions': serializer.toJson<String?>(failureConditions),
      'confidence': serializer.toJson<int?>(confidence),
      'importance': serializer.toJson<int?>(importance),
      'reversibility': serializer.toJson<int?>(reversibility),
      'decideBy': serializer.toJson<DateTime?>(decideBy),
      'openQuestions': serializer.toJson<List<dynamic>?>(openQuestions),
      'tags': serializer.toJson<List<dynamic>?>(tags),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Decision copyWith({
    String? id,
    String? title,
    String? type,
    String? status,
    Value<DateTime?> decisionAt = const Value.absent(),
    Value<String?> context = const Value.absent(),
    Value<String?> objective = const Value.absent(),
    Value<String?> rationale = const Value.absent(),
    Value<String?> alternatives = const Value.absent(),
    Value<String?> constraints = const Value.absent(),
    Value<Map<String, dynamic>?> emotionalContext = const Value.absent(),
    Value<String?> expectedOutcome = const Value.absent(),
    Value<String?> successCriteria = const Value.absent(),
    Value<String?> failureConditions = const Value.absent(),
    Value<int?> confidence = const Value.absent(),
    Value<int?> importance = const Value.absent(),
    Value<int?> reversibility = const Value.absent(),
    Value<DateTime?> decideBy = const Value.absent(),
    Value<List<dynamic>?> openQuestions = const Value.absent(),
    Value<List<dynamic>?> tags = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Decision(
    id: id ?? this.id,
    title: title ?? this.title,
    type: type ?? this.type,
    status: status ?? this.status,
    decisionAt: decisionAt.present ? decisionAt.value : this.decisionAt,
    context: context.present ? context.value : this.context,
    objective: objective.present ? objective.value : this.objective,
    rationale: rationale.present ? rationale.value : this.rationale,
    alternatives: alternatives.present ? alternatives.value : this.alternatives,
    constraints: constraints.present ? constraints.value : this.constraints,
    emotionalContext: emotionalContext.present
        ? emotionalContext.value
        : this.emotionalContext,
    expectedOutcome: expectedOutcome.present
        ? expectedOutcome.value
        : this.expectedOutcome,
    successCriteria: successCriteria.present
        ? successCriteria.value
        : this.successCriteria,
    failureConditions: failureConditions.present
        ? failureConditions.value
        : this.failureConditions,
    confidence: confidence.present ? confidence.value : this.confidence,
    importance: importance.present ? importance.value : this.importance,
    reversibility: reversibility.present
        ? reversibility.value
        : this.reversibility,
    decideBy: decideBy.present ? decideBy.value : this.decideBy,
    openQuestions: openQuestions.present
        ? openQuestions.value
        : this.openQuestions,
    tags: tags.present ? tags.value : this.tags,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Decision copyWithCompanion(DecisionsCompanion data) {
    return Decision(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      type: data.type.present ? data.type.value : this.type,
      status: data.status.present ? data.status.value : this.status,
      decisionAt: data.decisionAt.present
          ? data.decisionAt.value
          : this.decisionAt,
      context: data.context.present ? data.context.value : this.context,
      objective: data.objective.present ? data.objective.value : this.objective,
      rationale: data.rationale.present ? data.rationale.value : this.rationale,
      alternatives: data.alternatives.present
          ? data.alternatives.value
          : this.alternatives,
      constraints: data.constraints.present
          ? data.constraints.value
          : this.constraints,
      emotionalContext: data.emotionalContext.present
          ? data.emotionalContext.value
          : this.emotionalContext,
      expectedOutcome: data.expectedOutcome.present
          ? data.expectedOutcome.value
          : this.expectedOutcome,
      successCriteria: data.successCriteria.present
          ? data.successCriteria.value
          : this.successCriteria,
      failureConditions: data.failureConditions.present
          ? data.failureConditions.value
          : this.failureConditions,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
      importance: data.importance.present
          ? data.importance.value
          : this.importance,
      reversibility: data.reversibility.present
          ? data.reversibility.value
          : this.reversibility,
      decideBy: data.decideBy.present ? data.decideBy.value : this.decideBy,
      openQuestions: data.openQuestions.present
          ? data.openQuestions.value
          : this.openQuestions,
      tags: data.tags.present ? data.tags.value : this.tags,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Decision(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('decisionAt: $decisionAt, ')
          ..write('context: $context, ')
          ..write('objective: $objective, ')
          ..write('rationale: $rationale, ')
          ..write('alternatives: $alternatives, ')
          ..write('constraints: $constraints, ')
          ..write('emotionalContext: $emotionalContext, ')
          ..write('expectedOutcome: $expectedOutcome, ')
          ..write('successCriteria: $successCriteria, ')
          ..write('failureConditions: $failureConditions, ')
          ..write('confidence: $confidence, ')
          ..write('importance: $importance, ')
          ..write('reversibility: $reversibility, ')
          ..write('decideBy: $decideBy, ')
          ..write('openQuestions: $openQuestions, ')
          ..write('tags: $tags, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    title,
    type,
    status,
    decisionAt,
    context,
    objective,
    rationale,
    alternatives,
    constraints,
    emotionalContext,
    expectedOutcome,
    successCriteria,
    failureConditions,
    confidence,
    importance,
    reversibility,
    decideBy,
    openQuestions,
    tags,
    createdAt,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Decision &&
          other.id == this.id &&
          other.title == this.title &&
          other.type == this.type &&
          other.status == this.status &&
          other.decisionAt == this.decisionAt &&
          other.context == this.context &&
          other.objective == this.objective &&
          other.rationale == this.rationale &&
          other.alternatives == this.alternatives &&
          other.constraints == this.constraints &&
          other.emotionalContext == this.emotionalContext &&
          other.expectedOutcome == this.expectedOutcome &&
          other.successCriteria == this.successCriteria &&
          other.failureConditions == this.failureConditions &&
          other.confidence == this.confidence &&
          other.importance == this.importance &&
          other.reversibility == this.reversibility &&
          other.decideBy == this.decideBy &&
          other.openQuestions == this.openQuestions &&
          other.tags == this.tags &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DecisionsCompanion extends UpdateCompanion<Decision> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> type;
  final Value<String> status;
  final Value<DateTime?> decisionAt;
  final Value<String?> context;
  final Value<String?> objective;
  final Value<String?> rationale;
  final Value<String?> alternatives;
  final Value<String?> constraints;
  final Value<Map<String, dynamic>?> emotionalContext;
  final Value<String?> expectedOutcome;
  final Value<String?> successCriteria;
  final Value<String?> failureConditions;
  final Value<int?> confidence;
  final Value<int?> importance;
  final Value<int?> reversibility;
  final Value<DateTime?> decideBy;
  final Value<List<dynamic>?> openQuestions;
  final Value<List<dynamic>?> tags;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const DecisionsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.decisionAt = const Value.absent(),
    this.context = const Value.absent(),
    this.objective = const Value.absent(),
    this.rationale = const Value.absent(),
    this.alternatives = const Value.absent(),
    this.constraints = const Value.absent(),
    this.emotionalContext = const Value.absent(),
    this.expectedOutcome = const Value.absent(),
    this.successCriteria = const Value.absent(),
    this.failureConditions = const Value.absent(),
    this.confidence = const Value.absent(),
    this.importance = const Value.absent(),
    this.reversibility = const Value.absent(),
    this.decideBy = const Value.absent(),
    this.openQuestions = const Value.absent(),
    this.tags = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DecisionsCompanion.insert({
    required String id,
    required String title,
    required String type,
    this.status = const Value.absent(),
    this.decisionAt = const Value.absent(),
    this.context = const Value.absent(),
    this.objective = const Value.absent(),
    this.rationale = const Value.absent(),
    this.alternatives = const Value.absent(),
    this.constraints = const Value.absent(),
    this.emotionalContext = const Value.absent(),
    this.expectedOutcome = const Value.absent(),
    this.successCriteria = const Value.absent(),
    this.failureConditions = const Value.absent(),
    this.confidence = const Value.absent(),
    this.importance = const Value.absent(),
    this.reversibility = const Value.absent(),
    this.decideBy = const Value.absent(),
    this.openQuestions = const Value.absent(),
    this.tags = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       type = Value(type);
  static Insertable<Decision> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? type,
    Expression<String>? status,
    Expression<DateTime>? decisionAt,
    Expression<String>? context,
    Expression<String>? objective,
    Expression<String>? rationale,
    Expression<String>? alternatives,
    Expression<String>? constraints,
    Expression<String>? emotionalContext,
    Expression<String>? expectedOutcome,
    Expression<String>? successCriteria,
    Expression<String>? failureConditions,
    Expression<int>? confidence,
    Expression<int>? importance,
    Expression<int>? reversibility,
    Expression<DateTime>? decideBy,
    Expression<String>? openQuestions,
    Expression<String>? tags,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (status != null) 'status': status,
      if (decisionAt != null) 'decision_at': decisionAt,
      if (context != null) 'context': context,
      if (objective != null) 'objective': objective,
      if (rationale != null) 'rationale': rationale,
      if (alternatives != null) 'alternatives': alternatives,
      if (constraints != null) 'constraints': constraints,
      if (emotionalContext != null) 'emotional_context': emotionalContext,
      if (expectedOutcome != null) 'expected_outcome': expectedOutcome,
      if (successCriteria != null) 'success_criteria': successCriteria,
      if (failureConditions != null) 'failure_conditions': failureConditions,
      if (confidence != null) 'confidence': confidence,
      if (importance != null) 'importance': importance,
      if (reversibility != null) 'reversibility': reversibility,
      if (decideBy != null) 'decide_by': decideBy,
      if (openQuestions != null) 'open_questions': openQuestions,
      if (tags != null) 'tags': tags,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DecisionsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? type,
    Value<String>? status,
    Value<DateTime?>? decisionAt,
    Value<String?>? context,
    Value<String?>? objective,
    Value<String?>? rationale,
    Value<String?>? alternatives,
    Value<String?>? constraints,
    Value<Map<String, dynamic>?>? emotionalContext,
    Value<String?>? expectedOutcome,
    Value<String?>? successCriteria,
    Value<String?>? failureConditions,
    Value<int?>? confidence,
    Value<int?>? importance,
    Value<int?>? reversibility,
    Value<DateTime?>? decideBy,
    Value<List<dynamic>?>? openQuestions,
    Value<List<dynamic>?>? tags,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return DecisionsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      status: status ?? this.status,
      decisionAt: decisionAt ?? this.decisionAt,
      context: context ?? this.context,
      objective: objective ?? this.objective,
      rationale: rationale ?? this.rationale,
      alternatives: alternatives ?? this.alternatives,
      constraints: constraints ?? this.constraints,
      emotionalContext: emotionalContext ?? this.emotionalContext,
      expectedOutcome: expectedOutcome ?? this.expectedOutcome,
      successCriteria: successCriteria ?? this.successCriteria,
      failureConditions: failureConditions ?? this.failureConditions,
      confidence: confidence ?? this.confidence,
      importance: importance ?? this.importance,
      reversibility: reversibility ?? this.reversibility,
      decideBy: decideBy ?? this.decideBy,
      openQuestions: openQuestions ?? this.openQuestions,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (decisionAt.present) {
      map['decision_at'] = Variable<DateTime>(decisionAt.value);
    }
    if (context.present) {
      map['context'] = Variable<String>(context.value);
    }
    if (objective.present) {
      map['objective'] = Variable<String>(objective.value);
    }
    if (rationale.present) {
      map['rationale'] = Variable<String>(rationale.value);
    }
    if (alternatives.present) {
      map['alternatives'] = Variable<String>(alternatives.value);
    }
    if (constraints.present) {
      map['constraints'] = Variable<String>(constraints.value);
    }
    if (emotionalContext.present) {
      map['emotional_context'] = Variable<String>(
        $DecisionsTable.$converteremotionalContextn.toSql(
          emotionalContext.value,
        ),
      );
    }
    if (expectedOutcome.present) {
      map['expected_outcome'] = Variable<String>(expectedOutcome.value);
    }
    if (successCriteria.present) {
      map['success_criteria'] = Variable<String>(successCriteria.value);
    }
    if (failureConditions.present) {
      map['failure_conditions'] = Variable<String>(failureConditions.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<int>(confidence.value);
    }
    if (importance.present) {
      map['importance'] = Variable<int>(importance.value);
    }
    if (reversibility.present) {
      map['reversibility'] = Variable<int>(reversibility.value);
    }
    if (decideBy.present) {
      map['decide_by'] = Variable<DateTime>(decideBy.value);
    }
    if (openQuestions.present) {
      map['open_questions'] = Variable<String>(
        $DecisionsTable.$converteropenQuestionsn.toSql(openQuestions.value),
      );
    }
    if (tags.present) {
      map['tags'] = Variable<String>(
        $DecisionsTable.$convertertagsn.toSql(tags.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DecisionsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('decisionAt: $decisionAt, ')
          ..write('context: $context, ')
          ..write('objective: $objective, ')
          ..write('rationale: $rationale, ')
          ..write('alternatives: $alternatives, ')
          ..write('constraints: $constraints, ')
          ..write('emotionalContext: $emotionalContext, ')
          ..write('expectedOutcome: $expectedOutcome, ')
          ..write('successCriteria: $successCriteria, ')
          ..write('failureConditions: $failureConditions, ')
          ..write('confidence: $confidence, ')
          ..write('importance: $importance, ')
          ..write('reversibility: $reversibility, ')
          ..write('decideBy: $decideBy, ')
          ..write('openQuestions: $openQuestions, ')
          ..write('tags: $tags, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DecisionVersionsTable extends DecisionVersions
    with TableInfo<$DecisionVersionsTable, DecisionVersion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DecisionVersionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _decisionIdMeta = const VerificationMeta(
    'decisionId',
  );
  @override
  late final GeneratedColumn<String> decisionId = GeneratedColumn<String>(
    'decision_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES decisions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _versionNoMeta = const VerificationMeta(
    'versionNo',
  );
  @override
  late final GeneratedColumn<int> versionNo = GeneratedColumn<int>(
    'version_no',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
  snapshot =
      GeneratedColumn<String>(
        'snapshot',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Map<String, dynamic>>(
        $DecisionVersionsTable.$convertersnapshot,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    decisionId,
    versionNo,
    snapshot,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'decision_versions';
  @override
  VerificationContext validateIntegrity(
    Insertable<DecisionVersion> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('decision_id')) {
      context.handle(
        _decisionIdMeta,
        decisionId.isAcceptableOrUnknown(data['decision_id']!, _decisionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_decisionIdMeta);
    }
    if (data.containsKey('version_no')) {
      context.handle(
        _versionNoMeta,
        versionNo.isAcceptableOrUnknown(data['version_no']!, _versionNoMeta),
      );
    } else if (isInserting) {
      context.missing(_versionNoMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DecisionVersion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DecisionVersion(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      decisionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}decision_id'],
      )!,
      versionNo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version_no'],
      )!,
      snapshot: $DecisionVersionsTable.$convertersnapshot.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}snapshot'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DecisionVersionsTable createAlias(String alias) {
    return $DecisionVersionsTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $convertersnapshot =
      const JsonMapConverter();
}

class DecisionVersion extends DataClass implements Insertable<DecisionVersion> {
  final String id;
  final String decisionId;
  final int versionNo;
  final Map<String, dynamic> snapshot;
  final DateTime createdAt;
  const DecisionVersion({
    required this.id,
    required this.decisionId,
    required this.versionNo,
    required this.snapshot,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['decision_id'] = Variable<String>(decisionId);
    map['version_no'] = Variable<int>(versionNo);
    {
      map['snapshot'] = Variable<String>(
        $DecisionVersionsTable.$convertersnapshot.toSql(snapshot),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DecisionVersionsCompanion toCompanion(bool nullToAbsent) {
    return DecisionVersionsCompanion(
      id: Value(id),
      decisionId: Value(decisionId),
      versionNo: Value(versionNo),
      snapshot: Value(snapshot),
      createdAt: Value(createdAt),
    );
  }

  factory DecisionVersion.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DecisionVersion(
      id: serializer.fromJson<String>(json['id']),
      decisionId: serializer.fromJson<String>(json['decisionId']),
      versionNo: serializer.fromJson<int>(json['versionNo']),
      snapshot: serializer.fromJson<Map<String, dynamic>>(json['snapshot']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'decisionId': serializer.toJson<String>(decisionId),
      'versionNo': serializer.toJson<int>(versionNo),
      'snapshot': serializer.toJson<Map<String, dynamic>>(snapshot),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DecisionVersion copyWith({
    String? id,
    String? decisionId,
    int? versionNo,
    Map<String, dynamic>? snapshot,
    DateTime? createdAt,
  }) => DecisionVersion(
    id: id ?? this.id,
    decisionId: decisionId ?? this.decisionId,
    versionNo: versionNo ?? this.versionNo,
    snapshot: snapshot ?? this.snapshot,
    createdAt: createdAt ?? this.createdAt,
  );
  DecisionVersion copyWithCompanion(DecisionVersionsCompanion data) {
    return DecisionVersion(
      id: data.id.present ? data.id.value : this.id,
      decisionId: data.decisionId.present
          ? data.decisionId.value
          : this.decisionId,
      versionNo: data.versionNo.present ? data.versionNo.value : this.versionNo,
      snapshot: data.snapshot.present ? data.snapshot.value : this.snapshot,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DecisionVersion(')
          ..write('id: $id, ')
          ..write('decisionId: $decisionId, ')
          ..write('versionNo: $versionNo, ')
          ..write('snapshot: $snapshot, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, decisionId, versionNo, snapshot, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DecisionVersion &&
          other.id == this.id &&
          other.decisionId == this.decisionId &&
          other.versionNo == this.versionNo &&
          other.snapshot == this.snapshot &&
          other.createdAt == this.createdAt);
}

class DecisionVersionsCompanion extends UpdateCompanion<DecisionVersion> {
  final Value<String> id;
  final Value<String> decisionId;
  final Value<int> versionNo;
  final Value<Map<String, dynamic>> snapshot;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const DecisionVersionsCompanion({
    this.id = const Value.absent(),
    this.decisionId = const Value.absent(),
    this.versionNo = const Value.absent(),
    this.snapshot = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DecisionVersionsCompanion.insert({
    required String id,
    required String decisionId,
    required int versionNo,
    required Map<String, dynamic> snapshot,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       decisionId = Value(decisionId),
       versionNo = Value(versionNo),
       snapshot = Value(snapshot);
  static Insertable<DecisionVersion> custom({
    Expression<String>? id,
    Expression<String>? decisionId,
    Expression<int>? versionNo,
    Expression<String>? snapshot,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (decisionId != null) 'decision_id': decisionId,
      if (versionNo != null) 'version_no': versionNo,
      if (snapshot != null) 'snapshot': snapshot,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DecisionVersionsCompanion copyWith({
    Value<String>? id,
    Value<String>? decisionId,
    Value<int>? versionNo,
    Value<Map<String, dynamic>>? snapshot,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return DecisionVersionsCompanion(
      id: id ?? this.id,
      decisionId: decisionId ?? this.decisionId,
      versionNo: versionNo ?? this.versionNo,
      snapshot: snapshot ?? this.snapshot,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (decisionId.present) {
      map['decision_id'] = Variable<String>(decisionId.value);
    }
    if (versionNo.present) {
      map['version_no'] = Variable<int>(versionNo.value);
    }
    if (snapshot.present) {
      map['snapshot'] = Variable<String>(
        $DecisionVersionsTable.$convertersnapshot.toSql(snapshot.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DecisionVersionsCompanion(')
          ..write('id: $id, ')
          ..write('decisionId: $decisionId, ')
          ..write('versionNo: $versionNo, ')
          ..write('snapshot: $snapshot, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AssumptionsTable extends Assumptions
    with TableInfo<$AssumptionsTable, Assumption> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssumptionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _decisionIdMeta = const VerificationMeta(
    'decisionId',
  );
  @override
  late final GeneratedColumn<String> decisionId = GeneratedColumn<String>(
    'decision_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES decisions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _statementMeta = const VerificationMeta(
    'statement',
  );
  @override
  late final GeneratedColumn<String> statement = GeneratedColumn<String>(
    'statement',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<int> confidence = GeneratedColumn<int>(
    'confidence',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _evidenceMeta = const VerificationMeta(
    'evidence',
  );
  @override
  late final GeneratedColumn<String> evidence = GeneratedColumn<String>(
    'evidence',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expectedValidationDateMeta =
      const VerificationMeta('expectedValidationDate');
  @override
  late final GeneratedColumn<DateTime> expectedValidationDate =
      GeneratedColumn<DateTime>(
        'expected_validation_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _validationStatusMeta = const VerificationMeta(
    'validationStatus',
  );
  @override
  late final GeneratedColumn<String> validationStatus = GeneratedColumn<String>(
    'validation_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('untested'),
  );
  static const VerificationMeta _actualResultMeta = const VerificationMeta(
    'actualResult',
  );
  @override
  late final GeneratedColumn<String> actualResult = GeneratedColumn<String>(
    'actual_result',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    decisionId,
    statement,
    confidence,
    evidence,
    expectedValidationDate,
    validationStatus,
    actualResult,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assumptions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Assumption> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('decision_id')) {
      context.handle(
        _decisionIdMeta,
        decisionId.isAcceptableOrUnknown(data['decision_id']!, _decisionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_decisionIdMeta);
    }
    if (data.containsKey('statement')) {
      context.handle(
        _statementMeta,
        statement.isAcceptableOrUnknown(data['statement']!, _statementMeta),
      );
    } else if (isInserting) {
      context.missing(_statementMeta);
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    }
    if (data.containsKey('evidence')) {
      context.handle(
        _evidenceMeta,
        evidence.isAcceptableOrUnknown(data['evidence']!, _evidenceMeta),
      );
    }
    if (data.containsKey('expected_validation_date')) {
      context.handle(
        _expectedValidationDateMeta,
        expectedValidationDate.isAcceptableOrUnknown(
          data['expected_validation_date']!,
          _expectedValidationDateMeta,
        ),
      );
    }
    if (data.containsKey('validation_status')) {
      context.handle(
        _validationStatusMeta,
        validationStatus.isAcceptableOrUnknown(
          data['validation_status']!,
          _validationStatusMeta,
        ),
      );
    }
    if (data.containsKey('actual_result')) {
      context.handle(
        _actualResultMeta,
        actualResult.isAcceptableOrUnknown(
          data['actual_result']!,
          _actualResultMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Assumption map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Assumption(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      decisionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}decision_id'],
      )!,
      statement: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}statement'],
      )!,
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}confidence'],
      ),
      evidence: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}evidence'],
      ),
      expectedValidationDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expected_validation_date'],
      ),
      validationStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}validation_status'],
      )!,
      actualResult: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}actual_result'],
      ),
    );
  }

  @override
  $AssumptionsTable createAlias(String alias) {
    return $AssumptionsTable(attachedDatabase, alias);
  }
}

class Assumption extends DataClass implements Insertable<Assumption> {
  final String id;
  final String decisionId;
  final String statement;
  final int? confidence;
  final String? evidence;
  final DateTime? expectedValidationDate;
  final String validationStatus;
  final String? actualResult;
  const Assumption({
    required this.id,
    required this.decisionId,
    required this.statement,
    this.confidence,
    this.evidence,
    this.expectedValidationDate,
    required this.validationStatus,
    this.actualResult,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['decision_id'] = Variable<String>(decisionId);
    map['statement'] = Variable<String>(statement);
    if (!nullToAbsent || confidence != null) {
      map['confidence'] = Variable<int>(confidence);
    }
    if (!nullToAbsent || evidence != null) {
      map['evidence'] = Variable<String>(evidence);
    }
    if (!nullToAbsent || expectedValidationDate != null) {
      map['expected_validation_date'] = Variable<DateTime>(
        expectedValidationDate,
      );
    }
    map['validation_status'] = Variable<String>(validationStatus);
    if (!nullToAbsent || actualResult != null) {
      map['actual_result'] = Variable<String>(actualResult);
    }
    return map;
  }

  AssumptionsCompanion toCompanion(bool nullToAbsent) {
    return AssumptionsCompanion(
      id: Value(id),
      decisionId: Value(decisionId),
      statement: Value(statement),
      confidence: confidence == null && nullToAbsent
          ? const Value.absent()
          : Value(confidence),
      evidence: evidence == null && nullToAbsent
          ? const Value.absent()
          : Value(evidence),
      expectedValidationDate: expectedValidationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expectedValidationDate),
      validationStatus: Value(validationStatus),
      actualResult: actualResult == null && nullToAbsent
          ? const Value.absent()
          : Value(actualResult),
    );
  }

  factory Assumption.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Assumption(
      id: serializer.fromJson<String>(json['id']),
      decisionId: serializer.fromJson<String>(json['decisionId']),
      statement: serializer.fromJson<String>(json['statement']),
      confidence: serializer.fromJson<int?>(json['confidence']),
      evidence: serializer.fromJson<String?>(json['evidence']),
      expectedValidationDate: serializer.fromJson<DateTime?>(
        json['expectedValidationDate'],
      ),
      validationStatus: serializer.fromJson<String>(json['validationStatus']),
      actualResult: serializer.fromJson<String?>(json['actualResult']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'decisionId': serializer.toJson<String>(decisionId),
      'statement': serializer.toJson<String>(statement),
      'confidence': serializer.toJson<int?>(confidence),
      'evidence': serializer.toJson<String?>(evidence),
      'expectedValidationDate': serializer.toJson<DateTime?>(
        expectedValidationDate,
      ),
      'validationStatus': serializer.toJson<String>(validationStatus),
      'actualResult': serializer.toJson<String?>(actualResult),
    };
  }

  Assumption copyWith({
    String? id,
    String? decisionId,
    String? statement,
    Value<int?> confidence = const Value.absent(),
    Value<String?> evidence = const Value.absent(),
    Value<DateTime?> expectedValidationDate = const Value.absent(),
    String? validationStatus,
    Value<String?> actualResult = const Value.absent(),
  }) => Assumption(
    id: id ?? this.id,
    decisionId: decisionId ?? this.decisionId,
    statement: statement ?? this.statement,
    confidence: confidence.present ? confidence.value : this.confidence,
    evidence: evidence.present ? evidence.value : this.evidence,
    expectedValidationDate: expectedValidationDate.present
        ? expectedValidationDate.value
        : this.expectedValidationDate,
    validationStatus: validationStatus ?? this.validationStatus,
    actualResult: actualResult.present ? actualResult.value : this.actualResult,
  );
  Assumption copyWithCompanion(AssumptionsCompanion data) {
    return Assumption(
      id: data.id.present ? data.id.value : this.id,
      decisionId: data.decisionId.present
          ? data.decisionId.value
          : this.decisionId,
      statement: data.statement.present ? data.statement.value : this.statement,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
      evidence: data.evidence.present ? data.evidence.value : this.evidence,
      expectedValidationDate: data.expectedValidationDate.present
          ? data.expectedValidationDate.value
          : this.expectedValidationDate,
      validationStatus: data.validationStatus.present
          ? data.validationStatus.value
          : this.validationStatus,
      actualResult: data.actualResult.present
          ? data.actualResult.value
          : this.actualResult,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Assumption(')
          ..write('id: $id, ')
          ..write('decisionId: $decisionId, ')
          ..write('statement: $statement, ')
          ..write('confidence: $confidence, ')
          ..write('evidence: $evidence, ')
          ..write('expectedValidationDate: $expectedValidationDate, ')
          ..write('validationStatus: $validationStatus, ')
          ..write('actualResult: $actualResult')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    decisionId,
    statement,
    confidence,
    evidence,
    expectedValidationDate,
    validationStatus,
    actualResult,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Assumption &&
          other.id == this.id &&
          other.decisionId == this.decisionId &&
          other.statement == this.statement &&
          other.confidence == this.confidence &&
          other.evidence == this.evidence &&
          other.expectedValidationDate == this.expectedValidationDate &&
          other.validationStatus == this.validationStatus &&
          other.actualResult == this.actualResult);
}

class AssumptionsCompanion extends UpdateCompanion<Assumption> {
  final Value<String> id;
  final Value<String> decisionId;
  final Value<String> statement;
  final Value<int?> confidence;
  final Value<String?> evidence;
  final Value<DateTime?> expectedValidationDate;
  final Value<String> validationStatus;
  final Value<String?> actualResult;
  final Value<int> rowid;
  const AssumptionsCompanion({
    this.id = const Value.absent(),
    this.decisionId = const Value.absent(),
    this.statement = const Value.absent(),
    this.confidence = const Value.absent(),
    this.evidence = const Value.absent(),
    this.expectedValidationDate = const Value.absent(),
    this.validationStatus = const Value.absent(),
    this.actualResult = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AssumptionsCompanion.insert({
    required String id,
    required String decisionId,
    required String statement,
    this.confidence = const Value.absent(),
    this.evidence = const Value.absent(),
    this.expectedValidationDate = const Value.absent(),
    this.validationStatus = const Value.absent(),
    this.actualResult = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       decisionId = Value(decisionId),
       statement = Value(statement);
  static Insertable<Assumption> custom({
    Expression<String>? id,
    Expression<String>? decisionId,
    Expression<String>? statement,
    Expression<int>? confidence,
    Expression<String>? evidence,
    Expression<DateTime>? expectedValidationDate,
    Expression<String>? validationStatus,
    Expression<String>? actualResult,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (decisionId != null) 'decision_id': decisionId,
      if (statement != null) 'statement': statement,
      if (confidence != null) 'confidence': confidence,
      if (evidence != null) 'evidence': evidence,
      if (expectedValidationDate != null)
        'expected_validation_date': expectedValidationDate,
      if (validationStatus != null) 'validation_status': validationStatus,
      if (actualResult != null) 'actual_result': actualResult,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AssumptionsCompanion copyWith({
    Value<String>? id,
    Value<String>? decisionId,
    Value<String>? statement,
    Value<int?>? confidence,
    Value<String?>? evidence,
    Value<DateTime?>? expectedValidationDate,
    Value<String>? validationStatus,
    Value<String?>? actualResult,
    Value<int>? rowid,
  }) {
    return AssumptionsCompanion(
      id: id ?? this.id,
      decisionId: decisionId ?? this.decisionId,
      statement: statement ?? this.statement,
      confidence: confidence ?? this.confidence,
      evidence: evidence ?? this.evidence,
      expectedValidationDate:
          expectedValidationDate ?? this.expectedValidationDate,
      validationStatus: validationStatus ?? this.validationStatus,
      actualResult: actualResult ?? this.actualResult,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (decisionId.present) {
      map['decision_id'] = Variable<String>(decisionId.value);
    }
    if (statement.present) {
      map['statement'] = Variable<String>(statement.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<int>(confidence.value);
    }
    if (evidence.present) {
      map['evidence'] = Variable<String>(evidence.value);
    }
    if (expectedValidationDate.present) {
      map['expected_validation_date'] = Variable<DateTime>(
        expectedValidationDate.value,
      );
    }
    if (validationStatus.present) {
      map['validation_status'] = Variable<String>(validationStatus.value);
    }
    if (actualResult.present) {
      map['actual_result'] = Variable<String>(actualResult.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssumptionsCompanion(')
          ..write('id: $id, ')
          ..write('decisionId: $decisionId, ')
          ..write('statement: $statement, ')
          ..write('confidence: $confidence, ')
          ..write('evidence: $evidence, ')
          ..write('expectedValidationDate: $expectedValidationDate, ')
          ..write('validationStatus: $validationStatus, ')
          ..write('actualResult: $actualResult, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DecisionRisksTable extends DecisionRisks
    with TableInfo<$DecisionRisksTable, DecisionRisk> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DecisionRisksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _decisionIdMeta = const VerificationMeta(
    'decisionId',
  );
  @override
  late final GeneratedColumn<String> decisionId = GeneratedColumn<String>(
    'decision_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES decisions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _assumptionIdMeta = const VerificationMeta(
    'assumptionId',
  );
  @override
  late final GeneratedColumn<String> assumptionId = GeneratedColumn<String>(
    'assumption_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES assumptions (id)',
    ),
  );
  static const VerificationMeta _statementMeta = const VerificationMeta(
    'statement',
  );
  @override
  late final GeneratedColumn<String> statement = GeneratedColumn<String>(
    'statement',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _happenedMeta = const VerificationMeta(
    'happened',
  );
  @override
  late final GeneratedColumn<bool> happened = GeneratedColumn<bool>(
    'happened',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("happened" IN (0, 1))',
    ),
  );
  static const VerificationMeta _notedAtMeta = const VerificationMeta(
    'notedAt',
  );
  @override
  late final GeneratedColumn<DateTime> notedAt = GeneratedColumn<DateTime>(
    'noted_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    decisionId,
    assumptionId,
    statement,
    happened,
    notedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'decision_risks';
  @override
  VerificationContext validateIntegrity(
    Insertable<DecisionRisk> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('decision_id')) {
      context.handle(
        _decisionIdMeta,
        decisionId.isAcceptableOrUnknown(data['decision_id']!, _decisionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_decisionIdMeta);
    }
    if (data.containsKey('assumption_id')) {
      context.handle(
        _assumptionIdMeta,
        assumptionId.isAcceptableOrUnknown(
          data['assumption_id']!,
          _assumptionIdMeta,
        ),
      );
    }
    if (data.containsKey('statement')) {
      context.handle(
        _statementMeta,
        statement.isAcceptableOrUnknown(data['statement']!, _statementMeta),
      );
    } else if (isInserting) {
      context.missing(_statementMeta);
    }
    if (data.containsKey('happened')) {
      context.handle(
        _happenedMeta,
        happened.isAcceptableOrUnknown(data['happened']!, _happenedMeta),
      );
    }
    if (data.containsKey('noted_at')) {
      context.handle(
        _notedAtMeta,
        notedAt.isAcceptableOrUnknown(data['noted_at']!, _notedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DecisionRisk map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DecisionRisk(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      decisionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}decision_id'],
      )!,
      assumptionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assumption_id'],
      ),
      statement: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}statement'],
      )!,
      happened: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}happened'],
      ),
      notedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}noted_at'],
      )!,
    );
  }

  @override
  $DecisionRisksTable createAlias(String alias) {
    return $DecisionRisksTable(attachedDatabase, alias);
  }
}

class DecisionRisk extends DataClass implements Insertable<DecisionRisk> {
  final String id;
  final String decisionId;
  final String? assumptionId;
  final String statement;
  final bool? happened;
  final DateTime notedAt;
  const DecisionRisk({
    required this.id,
    required this.decisionId,
    this.assumptionId,
    required this.statement,
    this.happened,
    required this.notedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['decision_id'] = Variable<String>(decisionId);
    if (!nullToAbsent || assumptionId != null) {
      map['assumption_id'] = Variable<String>(assumptionId);
    }
    map['statement'] = Variable<String>(statement);
    if (!nullToAbsent || happened != null) {
      map['happened'] = Variable<bool>(happened);
    }
    map['noted_at'] = Variable<DateTime>(notedAt);
    return map;
  }

  DecisionRisksCompanion toCompanion(bool nullToAbsent) {
    return DecisionRisksCompanion(
      id: Value(id),
      decisionId: Value(decisionId),
      assumptionId: assumptionId == null && nullToAbsent
          ? const Value.absent()
          : Value(assumptionId),
      statement: Value(statement),
      happened: happened == null && nullToAbsent
          ? const Value.absent()
          : Value(happened),
      notedAt: Value(notedAt),
    );
  }

  factory DecisionRisk.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DecisionRisk(
      id: serializer.fromJson<String>(json['id']),
      decisionId: serializer.fromJson<String>(json['decisionId']),
      assumptionId: serializer.fromJson<String?>(json['assumptionId']),
      statement: serializer.fromJson<String>(json['statement']),
      happened: serializer.fromJson<bool?>(json['happened']),
      notedAt: serializer.fromJson<DateTime>(json['notedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'decisionId': serializer.toJson<String>(decisionId),
      'assumptionId': serializer.toJson<String?>(assumptionId),
      'statement': serializer.toJson<String>(statement),
      'happened': serializer.toJson<bool?>(happened),
      'notedAt': serializer.toJson<DateTime>(notedAt),
    };
  }

  DecisionRisk copyWith({
    String? id,
    String? decisionId,
    Value<String?> assumptionId = const Value.absent(),
    String? statement,
    Value<bool?> happened = const Value.absent(),
    DateTime? notedAt,
  }) => DecisionRisk(
    id: id ?? this.id,
    decisionId: decisionId ?? this.decisionId,
    assumptionId: assumptionId.present ? assumptionId.value : this.assumptionId,
    statement: statement ?? this.statement,
    happened: happened.present ? happened.value : this.happened,
    notedAt: notedAt ?? this.notedAt,
  );
  DecisionRisk copyWithCompanion(DecisionRisksCompanion data) {
    return DecisionRisk(
      id: data.id.present ? data.id.value : this.id,
      decisionId: data.decisionId.present
          ? data.decisionId.value
          : this.decisionId,
      assumptionId: data.assumptionId.present
          ? data.assumptionId.value
          : this.assumptionId,
      statement: data.statement.present ? data.statement.value : this.statement,
      happened: data.happened.present ? data.happened.value : this.happened,
      notedAt: data.notedAt.present ? data.notedAt.value : this.notedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DecisionRisk(')
          ..write('id: $id, ')
          ..write('decisionId: $decisionId, ')
          ..write('assumptionId: $assumptionId, ')
          ..write('statement: $statement, ')
          ..write('happened: $happened, ')
          ..write('notedAt: $notedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, decisionId, assumptionId, statement, happened, notedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DecisionRisk &&
          other.id == this.id &&
          other.decisionId == this.decisionId &&
          other.assumptionId == this.assumptionId &&
          other.statement == this.statement &&
          other.happened == this.happened &&
          other.notedAt == this.notedAt);
}

class DecisionRisksCompanion extends UpdateCompanion<DecisionRisk> {
  final Value<String> id;
  final Value<String> decisionId;
  final Value<String?> assumptionId;
  final Value<String> statement;
  final Value<bool?> happened;
  final Value<DateTime> notedAt;
  final Value<int> rowid;
  const DecisionRisksCompanion({
    this.id = const Value.absent(),
    this.decisionId = const Value.absent(),
    this.assumptionId = const Value.absent(),
    this.statement = const Value.absent(),
    this.happened = const Value.absent(),
    this.notedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DecisionRisksCompanion.insert({
    required String id,
    required String decisionId,
    this.assumptionId = const Value.absent(),
    required String statement,
    this.happened = const Value.absent(),
    this.notedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       decisionId = Value(decisionId),
       statement = Value(statement);
  static Insertable<DecisionRisk> custom({
    Expression<String>? id,
    Expression<String>? decisionId,
    Expression<String>? assumptionId,
    Expression<String>? statement,
    Expression<bool>? happened,
    Expression<DateTime>? notedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (decisionId != null) 'decision_id': decisionId,
      if (assumptionId != null) 'assumption_id': assumptionId,
      if (statement != null) 'statement': statement,
      if (happened != null) 'happened': happened,
      if (notedAt != null) 'noted_at': notedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DecisionRisksCompanion copyWith({
    Value<String>? id,
    Value<String>? decisionId,
    Value<String?>? assumptionId,
    Value<String>? statement,
    Value<bool?>? happened,
    Value<DateTime>? notedAt,
    Value<int>? rowid,
  }) {
    return DecisionRisksCompanion(
      id: id ?? this.id,
      decisionId: decisionId ?? this.decisionId,
      assumptionId: assumptionId ?? this.assumptionId,
      statement: statement ?? this.statement,
      happened: happened ?? this.happened,
      notedAt: notedAt ?? this.notedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (decisionId.present) {
      map['decision_id'] = Variable<String>(decisionId.value);
    }
    if (assumptionId.present) {
      map['assumption_id'] = Variable<String>(assumptionId.value);
    }
    if (statement.present) {
      map['statement'] = Variable<String>(statement.value);
    }
    if (happened.present) {
      map['happened'] = Variable<bool>(happened.value);
    }
    if (notedAt.present) {
      map['noted_at'] = Variable<DateTime>(notedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DecisionRisksCompanion(')
          ..write('id: $id, ')
          ..write('decisionId: $decisionId, ')
          ..write('assumptionId: $assumptionId, ')
          ..write('statement: $statement, ')
          ..write('happened: $happened, ')
          ..write('notedAt: $notedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EntitiesTable extends Entities with TableInfo<$EntitiesTable, Entity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EntitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  metadata = GeneratedColumn<String>(
    'metadata',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<Map<String, dynamic>?>($EntitiesTable.$convertermetadatan);
  @override
  List<GeneratedColumn> get $columns => [id, type, name, metadata];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'entities';
  @override
  VerificationContext validateIntegrity(
    Insertable<Entity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Entity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Entity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      metadata: $EntitiesTable.$convertermetadatan.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}metadata'],
        ),
      ),
    );
  }

  @override
  $EntitiesTable createAlias(String alias) {
    return $EntitiesTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $convertermetadata =
      const JsonMapConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $convertermetadatan =
      NullAwareTypeConverter.wrap($convertermetadata);
}

class Entity extends DataClass implements Insertable<Entity> {
  final String id;
  final String type;
  final String name;
  final Map<String, dynamic>? metadata;
  const Entity({
    required this.id,
    required this.type,
    required this.name,
    this.metadata,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || metadata != null) {
      map['metadata'] = Variable<String>(
        $EntitiesTable.$convertermetadatan.toSql(metadata),
      );
    }
    return map;
  }

  EntitiesCompanion toCompanion(bool nullToAbsent) {
    return EntitiesCompanion(
      id: Value(id),
      type: Value(type),
      name: Value(name),
      metadata: metadata == null && nullToAbsent
          ? const Value.absent()
          : Value(metadata),
    );
  }

  factory Entity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Entity(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      name: serializer.fromJson<String>(json['name']),
      metadata: serializer.fromJson<Map<String, dynamic>?>(json['metadata']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'name': serializer.toJson<String>(name),
      'metadata': serializer.toJson<Map<String, dynamic>?>(metadata),
    };
  }

  Entity copyWith({
    String? id,
    String? type,
    String? name,
    Value<Map<String, dynamic>?> metadata = const Value.absent(),
  }) => Entity(
    id: id ?? this.id,
    type: type ?? this.type,
    name: name ?? this.name,
    metadata: metadata.present ? metadata.value : this.metadata,
  );
  Entity copyWithCompanion(EntitiesCompanion data) {
    return Entity(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      name: data.name.present ? data.name.value : this.name,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Entity(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('metadata: $metadata')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, name, metadata);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Entity &&
          other.id == this.id &&
          other.type == this.type &&
          other.name == this.name &&
          other.metadata == this.metadata);
}

class EntitiesCompanion extends UpdateCompanion<Entity> {
  final Value<String> id;
  final Value<String> type;
  final Value<String> name;
  final Value<Map<String, dynamic>?> metadata;
  final Value<int> rowid;
  const EntitiesCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.name = const Value.absent(),
    this.metadata = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EntitiesCompanion.insert({
    required String id,
    required String type,
    required String name,
    this.metadata = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       type = Value(type),
       name = Value(name);
  static Insertable<Entity> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<String>? name,
    Expression<String>? metadata,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (name != null) 'name': name,
      if (metadata != null) 'metadata': metadata,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EntitiesCompanion copyWith({
    Value<String>? id,
    Value<String>? type,
    Value<String>? name,
    Value<Map<String, dynamic>?>? metadata,
    Value<int>? rowid,
  }) {
    return EntitiesCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      metadata: metadata ?? this.metadata,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(
        $EntitiesTable.$convertermetadatan.toSql(metadata.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EntitiesCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('metadata: $metadata, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DecisionAdviceTable extends DecisionAdvice
    with TableInfo<$DecisionAdviceTable, DecisionAdviceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DecisionAdviceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _decisionIdMeta = const VerificationMeta(
    'decisionId',
  );
  @override
  late final GeneratedColumn<String> decisionId = GeneratedColumn<String>(
    'decision_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES decisions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES entities (id)',
    ),
  );
  static const VerificationMeta _adviceTextMeta = const VerificationMeta(
    'adviceText',
  );
  @override
  late final GeneratedColumn<String> adviceText = GeneratedColumn<String>(
    'advice_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _givenAtMeta = const VerificationMeta(
    'givenAt',
  );
  @override
  late final GeneratedColumn<DateTime> givenAt = GeneratedColumn<DateTime>(
    'given_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _heldUpMeta = const VerificationMeta('heldUp');
  @override
  late final GeneratedColumn<String> heldUp = GeneratedColumn<String>(
    'held_up',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    decisionId,
    entityId,
    adviceText,
    givenAt,
    heldUp,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'decision_advice';
  @override
  VerificationContext validateIntegrity(
    Insertable<DecisionAdviceData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('decision_id')) {
      context.handle(
        _decisionIdMeta,
        decisionId.isAcceptableOrUnknown(data['decision_id']!, _decisionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_decisionIdMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('advice_text')) {
      context.handle(
        _adviceTextMeta,
        adviceText.isAcceptableOrUnknown(data['advice_text']!, _adviceTextMeta),
      );
    } else if (isInserting) {
      context.missing(_adviceTextMeta);
    }
    if (data.containsKey('given_at')) {
      context.handle(
        _givenAtMeta,
        givenAt.isAcceptableOrUnknown(data['given_at']!, _givenAtMeta),
      );
    }
    if (data.containsKey('held_up')) {
      context.handle(
        _heldUpMeta,
        heldUp.isAcceptableOrUnknown(data['held_up']!, _heldUpMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DecisionAdviceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DecisionAdviceData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      decisionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}decision_id'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      adviceText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}advice_text'],
      )!,
      givenAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}given_at'],
      )!,
      heldUp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}held_up'],
      ),
    );
  }

  @override
  $DecisionAdviceTable createAlias(String alias) {
    return $DecisionAdviceTable(attachedDatabase, alias);
  }
}

class DecisionAdviceData extends DataClass
    implements Insertable<DecisionAdviceData> {
  final String id;
  final String decisionId;
  final String entityId;
  final String adviceText;
  final DateTime givenAt;
  final String? heldUp;
  const DecisionAdviceData({
    required this.id,
    required this.decisionId,
    required this.entityId,
    required this.adviceText,
    required this.givenAt,
    this.heldUp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['decision_id'] = Variable<String>(decisionId);
    map['entity_id'] = Variable<String>(entityId);
    map['advice_text'] = Variable<String>(adviceText);
    map['given_at'] = Variable<DateTime>(givenAt);
    if (!nullToAbsent || heldUp != null) {
      map['held_up'] = Variable<String>(heldUp);
    }
    return map;
  }

  DecisionAdviceCompanion toCompanion(bool nullToAbsent) {
    return DecisionAdviceCompanion(
      id: Value(id),
      decisionId: Value(decisionId),
      entityId: Value(entityId),
      adviceText: Value(adviceText),
      givenAt: Value(givenAt),
      heldUp: heldUp == null && nullToAbsent
          ? const Value.absent()
          : Value(heldUp),
    );
  }

  factory DecisionAdviceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DecisionAdviceData(
      id: serializer.fromJson<String>(json['id']),
      decisionId: serializer.fromJson<String>(json['decisionId']),
      entityId: serializer.fromJson<String>(json['entityId']),
      adviceText: serializer.fromJson<String>(json['adviceText']),
      givenAt: serializer.fromJson<DateTime>(json['givenAt']),
      heldUp: serializer.fromJson<String?>(json['heldUp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'decisionId': serializer.toJson<String>(decisionId),
      'entityId': serializer.toJson<String>(entityId),
      'adviceText': serializer.toJson<String>(adviceText),
      'givenAt': serializer.toJson<DateTime>(givenAt),
      'heldUp': serializer.toJson<String?>(heldUp),
    };
  }

  DecisionAdviceData copyWith({
    String? id,
    String? decisionId,
    String? entityId,
    String? adviceText,
    DateTime? givenAt,
    Value<String?> heldUp = const Value.absent(),
  }) => DecisionAdviceData(
    id: id ?? this.id,
    decisionId: decisionId ?? this.decisionId,
    entityId: entityId ?? this.entityId,
    adviceText: adviceText ?? this.adviceText,
    givenAt: givenAt ?? this.givenAt,
    heldUp: heldUp.present ? heldUp.value : this.heldUp,
  );
  DecisionAdviceData copyWithCompanion(DecisionAdviceCompanion data) {
    return DecisionAdviceData(
      id: data.id.present ? data.id.value : this.id,
      decisionId: data.decisionId.present
          ? data.decisionId.value
          : this.decisionId,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      adviceText: data.adviceText.present
          ? data.adviceText.value
          : this.adviceText,
      givenAt: data.givenAt.present ? data.givenAt.value : this.givenAt,
      heldUp: data.heldUp.present ? data.heldUp.value : this.heldUp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DecisionAdviceData(')
          ..write('id: $id, ')
          ..write('decisionId: $decisionId, ')
          ..write('entityId: $entityId, ')
          ..write('adviceText: $adviceText, ')
          ..write('givenAt: $givenAt, ')
          ..write('heldUp: $heldUp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, decisionId, entityId, adviceText, givenAt, heldUp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DecisionAdviceData &&
          other.id == this.id &&
          other.decisionId == this.decisionId &&
          other.entityId == this.entityId &&
          other.adviceText == this.adviceText &&
          other.givenAt == this.givenAt &&
          other.heldUp == this.heldUp);
}

class DecisionAdviceCompanion extends UpdateCompanion<DecisionAdviceData> {
  final Value<String> id;
  final Value<String> decisionId;
  final Value<String> entityId;
  final Value<String> adviceText;
  final Value<DateTime> givenAt;
  final Value<String?> heldUp;
  final Value<int> rowid;
  const DecisionAdviceCompanion({
    this.id = const Value.absent(),
    this.decisionId = const Value.absent(),
    this.entityId = const Value.absent(),
    this.adviceText = const Value.absent(),
    this.givenAt = const Value.absent(),
    this.heldUp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DecisionAdviceCompanion.insert({
    required String id,
    required String decisionId,
    required String entityId,
    required String adviceText,
    this.givenAt = const Value.absent(),
    this.heldUp = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       decisionId = Value(decisionId),
       entityId = Value(entityId),
       adviceText = Value(adviceText);
  static Insertable<DecisionAdviceData> custom({
    Expression<String>? id,
    Expression<String>? decisionId,
    Expression<String>? entityId,
    Expression<String>? adviceText,
    Expression<DateTime>? givenAt,
    Expression<String>? heldUp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (decisionId != null) 'decision_id': decisionId,
      if (entityId != null) 'entity_id': entityId,
      if (adviceText != null) 'advice_text': adviceText,
      if (givenAt != null) 'given_at': givenAt,
      if (heldUp != null) 'held_up': heldUp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DecisionAdviceCompanion copyWith({
    Value<String>? id,
    Value<String>? decisionId,
    Value<String>? entityId,
    Value<String>? adviceText,
    Value<DateTime>? givenAt,
    Value<String?>? heldUp,
    Value<int>? rowid,
  }) {
    return DecisionAdviceCompanion(
      id: id ?? this.id,
      decisionId: decisionId ?? this.decisionId,
      entityId: entityId ?? this.entityId,
      adviceText: adviceText ?? this.adviceText,
      givenAt: givenAt ?? this.givenAt,
      heldUp: heldUp ?? this.heldUp,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (decisionId.present) {
      map['decision_id'] = Variable<String>(decisionId.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (adviceText.present) {
      map['advice_text'] = Variable<String>(adviceText.value);
    }
    if (givenAt.present) {
      map['given_at'] = Variable<DateTime>(givenAt.value);
    }
    if (heldUp.present) {
      map['held_up'] = Variable<String>(heldUp.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DecisionAdviceCompanion(')
          ..write('id: $id, ')
          ..write('decisionId: $decisionId, ')
          ..write('entityId: $entityId, ')
          ..write('adviceText: $adviceText, ')
          ..write('givenAt: $givenAt, ')
          ..write('heldUp: $heldUp, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DecisionReviewsTable extends DecisionReviews
    with TableInfo<$DecisionReviewsTable, DecisionReview> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DecisionReviewsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _decisionIdMeta = const VerificationMeta(
    'decisionId',
  );
  @override
  late final GeneratedColumn<String> decisionId = GeneratedColumn<String>(
    'decision_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES decisions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _reviewedAtMeta = const VerificationMeta(
    'reviewedAt',
  );
  @override
  late final GeneratedColumn<DateTime> reviewedAt = GeneratedColumn<DateTime>(
    'reviewed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _whatActuallyHappenedMeta =
      const VerificationMeta('whatActuallyHappened');
  @override
  late final GeneratedColumn<String> whatActuallyHappened =
      GeneratedColumn<String>(
        'what_actually_happened',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _expectedVsActualMeta = const VerificationMeta(
    'expectedVsActual',
  );
  @override
  late final GeneratedColumn<String> expectedVsActual = GeneratedColumn<String>(
    'expected_vs_actual',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<dynamic>?, String>
  assumptionsThatHeld =
      GeneratedColumn<String>(
        'assumptions_that_held',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<dynamic>?>(
        $DecisionReviewsTable.$converterassumptionsThatHeldn,
      );
  @override
  late final GeneratedColumnWithTypeConverter<List<dynamic>?, String>
  assumptionsThatFailed =
      GeneratedColumn<String>(
        'assumptions_that_failed',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<dynamic>?>(
        $DecisionReviewsTable.$converterassumptionsThatFailedn,
      );
  static const VerificationMeta _unexpectedConsequencesMeta =
      const VerificationMeta('unexpectedConsequences');
  @override
  late final GeneratedColumn<String> unexpectedConsequences =
      GeneratedColumn<String>(
        'unexpected_consequences',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _currentViewMeta = const VerificationMeta(
    'currentView',
  );
  @override
  late final GeneratedColumn<String> currentView = GeneratedColumn<String>(
    'current_view',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lessonMeta = const VerificationMeta('lesson');
  @override
  late final GeneratedColumn<String> lesson = GeneratedColumn<String>(
    'lesson',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _satisfactionMeta = const VerificationMeta(
    'satisfaction',
  );
  @override
  late final GeneratedColumn<int> satisfaction = GeneratedColumn<int>(
    'satisfaction',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _regretMeta = const VerificationMeta('regret');
  @override
  late final GeneratedColumn<String> regret = GeneratedColumn<String>(
    'regret',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roadNotTakenMeta = const VerificationMeta(
    'roadNotTaken',
  );
  @override
  late final GeneratedColumn<String> roadNotTaken = GeneratedColumn<String>(
    'road_not_taken',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nextReviewMeta = const VerificationMeta(
    'nextReview',
  );
  @override
  late final GeneratedColumn<String> nextReview = GeneratedColumn<String>(
    'next_review',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    decisionId,
    reviewedAt,
    whatActuallyHappened,
    expectedVsActual,
    assumptionsThatHeld,
    assumptionsThatFailed,
    unexpectedConsequences,
    currentView,
    lesson,
    action,
    satisfaction,
    regret,
    roadNotTaken,
    nextReview,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'decision_reviews';
  @override
  VerificationContext validateIntegrity(
    Insertable<DecisionReview> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('decision_id')) {
      context.handle(
        _decisionIdMeta,
        decisionId.isAcceptableOrUnknown(data['decision_id']!, _decisionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_decisionIdMeta);
    }
    if (data.containsKey('reviewed_at')) {
      context.handle(
        _reviewedAtMeta,
        reviewedAt.isAcceptableOrUnknown(data['reviewed_at']!, _reviewedAtMeta),
      );
    }
    if (data.containsKey('what_actually_happened')) {
      context.handle(
        _whatActuallyHappenedMeta,
        whatActuallyHappened.isAcceptableOrUnknown(
          data['what_actually_happened']!,
          _whatActuallyHappenedMeta,
        ),
      );
    }
    if (data.containsKey('expected_vs_actual')) {
      context.handle(
        _expectedVsActualMeta,
        expectedVsActual.isAcceptableOrUnknown(
          data['expected_vs_actual']!,
          _expectedVsActualMeta,
        ),
      );
    }
    if (data.containsKey('unexpected_consequences')) {
      context.handle(
        _unexpectedConsequencesMeta,
        unexpectedConsequences.isAcceptableOrUnknown(
          data['unexpected_consequences']!,
          _unexpectedConsequencesMeta,
        ),
      );
    }
    if (data.containsKey('current_view')) {
      context.handle(
        _currentViewMeta,
        currentView.isAcceptableOrUnknown(
          data['current_view']!,
          _currentViewMeta,
        ),
      );
    }
    if (data.containsKey('lesson')) {
      context.handle(
        _lessonMeta,
        lesson.isAcceptableOrUnknown(data['lesson']!, _lessonMeta),
      );
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    }
    if (data.containsKey('satisfaction')) {
      context.handle(
        _satisfactionMeta,
        satisfaction.isAcceptableOrUnknown(
          data['satisfaction']!,
          _satisfactionMeta,
        ),
      );
    }
    if (data.containsKey('regret')) {
      context.handle(
        _regretMeta,
        regret.isAcceptableOrUnknown(data['regret']!, _regretMeta),
      );
    }
    if (data.containsKey('road_not_taken')) {
      context.handle(
        _roadNotTakenMeta,
        roadNotTaken.isAcceptableOrUnknown(
          data['road_not_taken']!,
          _roadNotTakenMeta,
        ),
      );
    }
    if (data.containsKey('next_review')) {
      context.handle(
        _nextReviewMeta,
        nextReview.isAcceptableOrUnknown(data['next_review']!, _nextReviewMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DecisionReview map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DecisionReview(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      decisionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}decision_id'],
      )!,
      reviewedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}reviewed_at'],
      )!,
      whatActuallyHappened: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}what_actually_happened'],
      ),
      expectedVsActual: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expected_vs_actual'],
      ),
      assumptionsThatHeld: $DecisionReviewsTable.$converterassumptionsThatHeldn
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}assumptions_that_held'],
            ),
          ),
      assumptionsThatFailed: $DecisionReviewsTable
          .$converterassumptionsThatFailedn
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}assumptions_that_failed'],
            ),
          ),
      unexpectedConsequences: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unexpected_consequences'],
      ),
      currentView: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}current_view'],
      ),
      lesson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lesson'],
      ),
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      ),
      satisfaction: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}satisfaction'],
      ),
      regret: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}regret'],
      ),
      roadNotTaken: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}road_not_taken'],
      ),
      nextReview: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}next_review'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DecisionReviewsTable createAlias(String alias) {
    return $DecisionReviewsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<dynamic>, String> $converterassumptionsThatHeld =
      const JsonListConverter();
  static TypeConverter<List<dynamic>?, String?> $converterassumptionsThatHeldn =
      NullAwareTypeConverter.wrap($converterassumptionsThatHeld);
  static TypeConverter<List<dynamic>, String> $converterassumptionsThatFailed =
      const JsonListConverter();
  static TypeConverter<List<dynamic>?, String?>
  $converterassumptionsThatFailedn = NullAwareTypeConverter.wrap(
    $converterassumptionsThatFailed,
  );
}

class DecisionReview extends DataClass implements Insertable<DecisionReview> {
  final String id;
  final String decisionId;
  final DateTime reviewedAt;
  final String? whatActuallyHappened;
  final String? expectedVsActual;
  final List<dynamic>? assumptionsThatHeld;
  final List<dynamic>? assumptionsThatFailed;
  final String? unexpectedConsequences;
  final String? currentView;
  final String? lesson;
  final String? action;
  final int? satisfaction;
  final String? regret;
  final String? roadNotTaken;
  final String? nextReview;
  final DateTime createdAt;
  const DecisionReview({
    required this.id,
    required this.decisionId,
    required this.reviewedAt,
    this.whatActuallyHappened,
    this.expectedVsActual,
    this.assumptionsThatHeld,
    this.assumptionsThatFailed,
    this.unexpectedConsequences,
    this.currentView,
    this.lesson,
    this.action,
    this.satisfaction,
    this.regret,
    this.roadNotTaken,
    this.nextReview,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['decision_id'] = Variable<String>(decisionId);
    map['reviewed_at'] = Variable<DateTime>(reviewedAt);
    if (!nullToAbsent || whatActuallyHappened != null) {
      map['what_actually_happened'] = Variable<String>(whatActuallyHappened);
    }
    if (!nullToAbsent || expectedVsActual != null) {
      map['expected_vs_actual'] = Variable<String>(expectedVsActual);
    }
    if (!nullToAbsent || assumptionsThatHeld != null) {
      map['assumptions_that_held'] = Variable<String>(
        $DecisionReviewsTable.$converterassumptionsThatHeldn.toSql(
          assumptionsThatHeld,
        ),
      );
    }
    if (!nullToAbsent || assumptionsThatFailed != null) {
      map['assumptions_that_failed'] = Variable<String>(
        $DecisionReviewsTable.$converterassumptionsThatFailedn.toSql(
          assumptionsThatFailed,
        ),
      );
    }
    if (!nullToAbsent || unexpectedConsequences != null) {
      map['unexpected_consequences'] = Variable<String>(unexpectedConsequences);
    }
    if (!nullToAbsent || currentView != null) {
      map['current_view'] = Variable<String>(currentView);
    }
    if (!nullToAbsent || lesson != null) {
      map['lesson'] = Variable<String>(lesson);
    }
    if (!nullToAbsent || action != null) {
      map['action'] = Variable<String>(action);
    }
    if (!nullToAbsent || satisfaction != null) {
      map['satisfaction'] = Variable<int>(satisfaction);
    }
    if (!nullToAbsent || regret != null) {
      map['regret'] = Variable<String>(regret);
    }
    if (!nullToAbsent || roadNotTaken != null) {
      map['road_not_taken'] = Variable<String>(roadNotTaken);
    }
    if (!nullToAbsent || nextReview != null) {
      map['next_review'] = Variable<String>(nextReview);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DecisionReviewsCompanion toCompanion(bool nullToAbsent) {
    return DecisionReviewsCompanion(
      id: Value(id),
      decisionId: Value(decisionId),
      reviewedAt: Value(reviewedAt),
      whatActuallyHappened: whatActuallyHappened == null && nullToAbsent
          ? const Value.absent()
          : Value(whatActuallyHappened),
      expectedVsActual: expectedVsActual == null && nullToAbsent
          ? const Value.absent()
          : Value(expectedVsActual),
      assumptionsThatHeld: assumptionsThatHeld == null && nullToAbsent
          ? const Value.absent()
          : Value(assumptionsThatHeld),
      assumptionsThatFailed: assumptionsThatFailed == null && nullToAbsent
          ? const Value.absent()
          : Value(assumptionsThatFailed),
      unexpectedConsequences: unexpectedConsequences == null && nullToAbsent
          ? const Value.absent()
          : Value(unexpectedConsequences),
      currentView: currentView == null && nullToAbsent
          ? const Value.absent()
          : Value(currentView),
      lesson: lesson == null && nullToAbsent
          ? const Value.absent()
          : Value(lesson),
      action: action == null && nullToAbsent
          ? const Value.absent()
          : Value(action),
      satisfaction: satisfaction == null && nullToAbsent
          ? const Value.absent()
          : Value(satisfaction),
      regret: regret == null && nullToAbsent
          ? const Value.absent()
          : Value(regret),
      roadNotTaken: roadNotTaken == null && nullToAbsent
          ? const Value.absent()
          : Value(roadNotTaken),
      nextReview: nextReview == null && nullToAbsent
          ? const Value.absent()
          : Value(nextReview),
      createdAt: Value(createdAt),
    );
  }

  factory DecisionReview.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DecisionReview(
      id: serializer.fromJson<String>(json['id']),
      decisionId: serializer.fromJson<String>(json['decisionId']),
      reviewedAt: serializer.fromJson<DateTime>(json['reviewedAt']),
      whatActuallyHappened: serializer.fromJson<String?>(
        json['whatActuallyHappened'],
      ),
      expectedVsActual: serializer.fromJson<String?>(json['expectedVsActual']),
      assumptionsThatHeld: serializer.fromJson<List<dynamic>?>(
        json['assumptionsThatHeld'],
      ),
      assumptionsThatFailed: serializer.fromJson<List<dynamic>?>(
        json['assumptionsThatFailed'],
      ),
      unexpectedConsequences: serializer.fromJson<String?>(
        json['unexpectedConsequences'],
      ),
      currentView: serializer.fromJson<String?>(json['currentView']),
      lesson: serializer.fromJson<String?>(json['lesson']),
      action: serializer.fromJson<String?>(json['action']),
      satisfaction: serializer.fromJson<int?>(json['satisfaction']),
      regret: serializer.fromJson<String?>(json['regret']),
      roadNotTaken: serializer.fromJson<String?>(json['roadNotTaken']),
      nextReview: serializer.fromJson<String?>(json['nextReview']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'decisionId': serializer.toJson<String>(decisionId),
      'reviewedAt': serializer.toJson<DateTime>(reviewedAt),
      'whatActuallyHappened': serializer.toJson<String?>(whatActuallyHappened),
      'expectedVsActual': serializer.toJson<String?>(expectedVsActual),
      'assumptionsThatHeld': serializer.toJson<List<dynamic>?>(
        assumptionsThatHeld,
      ),
      'assumptionsThatFailed': serializer.toJson<List<dynamic>?>(
        assumptionsThatFailed,
      ),
      'unexpectedConsequences': serializer.toJson<String?>(
        unexpectedConsequences,
      ),
      'currentView': serializer.toJson<String?>(currentView),
      'lesson': serializer.toJson<String?>(lesson),
      'action': serializer.toJson<String?>(action),
      'satisfaction': serializer.toJson<int?>(satisfaction),
      'regret': serializer.toJson<String?>(regret),
      'roadNotTaken': serializer.toJson<String?>(roadNotTaken),
      'nextReview': serializer.toJson<String?>(nextReview),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DecisionReview copyWith({
    String? id,
    String? decisionId,
    DateTime? reviewedAt,
    Value<String?> whatActuallyHappened = const Value.absent(),
    Value<String?> expectedVsActual = const Value.absent(),
    Value<List<dynamic>?> assumptionsThatHeld = const Value.absent(),
    Value<List<dynamic>?> assumptionsThatFailed = const Value.absent(),
    Value<String?> unexpectedConsequences = const Value.absent(),
    Value<String?> currentView = const Value.absent(),
    Value<String?> lesson = const Value.absent(),
    Value<String?> action = const Value.absent(),
    Value<int?> satisfaction = const Value.absent(),
    Value<String?> regret = const Value.absent(),
    Value<String?> roadNotTaken = const Value.absent(),
    Value<String?> nextReview = const Value.absent(),
    DateTime? createdAt,
  }) => DecisionReview(
    id: id ?? this.id,
    decisionId: decisionId ?? this.decisionId,
    reviewedAt: reviewedAt ?? this.reviewedAt,
    whatActuallyHappened: whatActuallyHappened.present
        ? whatActuallyHappened.value
        : this.whatActuallyHappened,
    expectedVsActual: expectedVsActual.present
        ? expectedVsActual.value
        : this.expectedVsActual,
    assumptionsThatHeld: assumptionsThatHeld.present
        ? assumptionsThatHeld.value
        : this.assumptionsThatHeld,
    assumptionsThatFailed: assumptionsThatFailed.present
        ? assumptionsThatFailed.value
        : this.assumptionsThatFailed,
    unexpectedConsequences: unexpectedConsequences.present
        ? unexpectedConsequences.value
        : this.unexpectedConsequences,
    currentView: currentView.present ? currentView.value : this.currentView,
    lesson: lesson.present ? lesson.value : this.lesson,
    action: action.present ? action.value : this.action,
    satisfaction: satisfaction.present ? satisfaction.value : this.satisfaction,
    regret: regret.present ? regret.value : this.regret,
    roadNotTaken: roadNotTaken.present ? roadNotTaken.value : this.roadNotTaken,
    nextReview: nextReview.present ? nextReview.value : this.nextReview,
    createdAt: createdAt ?? this.createdAt,
  );
  DecisionReview copyWithCompanion(DecisionReviewsCompanion data) {
    return DecisionReview(
      id: data.id.present ? data.id.value : this.id,
      decisionId: data.decisionId.present
          ? data.decisionId.value
          : this.decisionId,
      reviewedAt: data.reviewedAt.present
          ? data.reviewedAt.value
          : this.reviewedAt,
      whatActuallyHappened: data.whatActuallyHappened.present
          ? data.whatActuallyHappened.value
          : this.whatActuallyHappened,
      expectedVsActual: data.expectedVsActual.present
          ? data.expectedVsActual.value
          : this.expectedVsActual,
      assumptionsThatHeld: data.assumptionsThatHeld.present
          ? data.assumptionsThatHeld.value
          : this.assumptionsThatHeld,
      assumptionsThatFailed: data.assumptionsThatFailed.present
          ? data.assumptionsThatFailed.value
          : this.assumptionsThatFailed,
      unexpectedConsequences: data.unexpectedConsequences.present
          ? data.unexpectedConsequences.value
          : this.unexpectedConsequences,
      currentView: data.currentView.present
          ? data.currentView.value
          : this.currentView,
      lesson: data.lesson.present ? data.lesson.value : this.lesson,
      action: data.action.present ? data.action.value : this.action,
      satisfaction: data.satisfaction.present
          ? data.satisfaction.value
          : this.satisfaction,
      regret: data.regret.present ? data.regret.value : this.regret,
      roadNotTaken: data.roadNotTaken.present
          ? data.roadNotTaken.value
          : this.roadNotTaken,
      nextReview: data.nextReview.present
          ? data.nextReview.value
          : this.nextReview,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DecisionReview(')
          ..write('id: $id, ')
          ..write('decisionId: $decisionId, ')
          ..write('reviewedAt: $reviewedAt, ')
          ..write('whatActuallyHappened: $whatActuallyHappened, ')
          ..write('expectedVsActual: $expectedVsActual, ')
          ..write('assumptionsThatHeld: $assumptionsThatHeld, ')
          ..write('assumptionsThatFailed: $assumptionsThatFailed, ')
          ..write('unexpectedConsequences: $unexpectedConsequences, ')
          ..write('currentView: $currentView, ')
          ..write('lesson: $lesson, ')
          ..write('action: $action, ')
          ..write('satisfaction: $satisfaction, ')
          ..write('regret: $regret, ')
          ..write('roadNotTaken: $roadNotTaken, ')
          ..write('nextReview: $nextReview, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    decisionId,
    reviewedAt,
    whatActuallyHappened,
    expectedVsActual,
    assumptionsThatHeld,
    assumptionsThatFailed,
    unexpectedConsequences,
    currentView,
    lesson,
    action,
    satisfaction,
    regret,
    roadNotTaken,
    nextReview,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DecisionReview &&
          other.id == this.id &&
          other.decisionId == this.decisionId &&
          other.reviewedAt == this.reviewedAt &&
          other.whatActuallyHappened == this.whatActuallyHappened &&
          other.expectedVsActual == this.expectedVsActual &&
          other.assumptionsThatHeld == this.assumptionsThatHeld &&
          other.assumptionsThatFailed == this.assumptionsThatFailed &&
          other.unexpectedConsequences == this.unexpectedConsequences &&
          other.currentView == this.currentView &&
          other.lesson == this.lesson &&
          other.action == this.action &&
          other.satisfaction == this.satisfaction &&
          other.regret == this.regret &&
          other.roadNotTaken == this.roadNotTaken &&
          other.nextReview == this.nextReview &&
          other.createdAt == this.createdAt);
}

class DecisionReviewsCompanion extends UpdateCompanion<DecisionReview> {
  final Value<String> id;
  final Value<String> decisionId;
  final Value<DateTime> reviewedAt;
  final Value<String?> whatActuallyHappened;
  final Value<String?> expectedVsActual;
  final Value<List<dynamic>?> assumptionsThatHeld;
  final Value<List<dynamic>?> assumptionsThatFailed;
  final Value<String?> unexpectedConsequences;
  final Value<String?> currentView;
  final Value<String?> lesson;
  final Value<String?> action;
  final Value<int?> satisfaction;
  final Value<String?> regret;
  final Value<String?> roadNotTaken;
  final Value<String?> nextReview;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const DecisionReviewsCompanion({
    this.id = const Value.absent(),
    this.decisionId = const Value.absent(),
    this.reviewedAt = const Value.absent(),
    this.whatActuallyHappened = const Value.absent(),
    this.expectedVsActual = const Value.absent(),
    this.assumptionsThatHeld = const Value.absent(),
    this.assumptionsThatFailed = const Value.absent(),
    this.unexpectedConsequences = const Value.absent(),
    this.currentView = const Value.absent(),
    this.lesson = const Value.absent(),
    this.action = const Value.absent(),
    this.satisfaction = const Value.absent(),
    this.regret = const Value.absent(),
    this.roadNotTaken = const Value.absent(),
    this.nextReview = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DecisionReviewsCompanion.insert({
    required String id,
    required String decisionId,
    this.reviewedAt = const Value.absent(),
    this.whatActuallyHappened = const Value.absent(),
    this.expectedVsActual = const Value.absent(),
    this.assumptionsThatHeld = const Value.absent(),
    this.assumptionsThatFailed = const Value.absent(),
    this.unexpectedConsequences = const Value.absent(),
    this.currentView = const Value.absent(),
    this.lesson = const Value.absent(),
    this.action = const Value.absent(),
    this.satisfaction = const Value.absent(),
    this.regret = const Value.absent(),
    this.roadNotTaken = const Value.absent(),
    this.nextReview = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       decisionId = Value(decisionId);
  static Insertable<DecisionReview> custom({
    Expression<String>? id,
    Expression<String>? decisionId,
    Expression<DateTime>? reviewedAt,
    Expression<String>? whatActuallyHappened,
    Expression<String>? expectedVsActual,
    Expression<String>? assumptionsThatHeld,
    Expression<String>? assumptionsThatFailed,
    Expression<String>? unexpectedConsequences,
    Expression<String>? currentView,
    Expression<String>? lesson,
    Expression<String>? action,
    Expression<int>? satisfaction,
    Expression<String>? regret,
    Expression<String>? roadNotTaken,
    Expression<String>? nextReview,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (decisionId != null) 'decision_id': decisionId,
      if (reviewedAt != null) 'reviewed_at': reviewedAt,
      if (whatActuallyHappened != null)
        'what_actually_happened': whatActuallyHappened,
      if (expectedVsActual != null) 'expected_vs_actual': expectedVsActual,
      if (assumptionsThatHeld != null)
        'assumptions_that_held': assumptionsThatHeld,
      if (assumptionsThatFailed != null)
        'assumptions_that_failed': assumptionsThatFailed,
      if (unexpectedConsequences != null)
        'unexpected_consequences': unexpectedConsequences,
      if (currentView != null) 'current_view': currentView,
      if (lesson != null) 'lesson': lesson,
      if (action != null) 'action': action,
      if (satisfaction != null) 'satisfaction': satisfaction,
      if (regret != null) 'regret': regret,
      if (roadNotTaken != null) 'road_not_taken': roadNotTaken,
      if (nextReview != null) 'next_review': nextReview,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DecisionReviewsCompanion copyWith({
    Value<String>? id,
    Value<String>? decisionId,
    Value<DateTime>? reviewedAt,
    Value<String?>? whatActuallyHappened,
    Value<String?>? expectedVsActual,
    Value<List<dynamic>?>? assumptionsThatHeld,
    Value<List<dynamic>?>? assumptionsThatFailed,
    Value<String?>? unexpectedConsequences,
    Value<String?>? currentView,
    Value<String?>? lesson,
    Value<String?>? action,
    Value<int?>? satisfaction,
    Value<String?>? regret,
    Value<String?>? roadNotTaken,
    Value<String?>? nextReview,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return DecisionReviewsCompanion(
      id: id ?? this.id,
      decisionId: decisionId ?? this.decisionId,
      reviewedAt: reviewedAt ?? this.reviewedAt,
      whatActuallyHappened: whatActuallyHappened ?? this.whatActuallyHappened,
      expectedVsActual: expectedVsActual ?? this.expectedVsActual,
      assumptionsThatHeld: assumptionsThatHeld ?? this.assumptionsThatHeld,
      assumptionsThatFailed:
          assumptionsThatFailed ?? this.assumptionsThatFailed,
      unexpectedConsequences:
          unexpectedConsequences ?? this.unexpectedConsequences,
      currentView: currentView ?? this.currentView,
      lesson: lesson ?? this.lesson,
      action: action ?? this.action,
      satisfaction: satisfaction ?? this.satisfaction,
      regret: regret ?? this.regret,
      roadNotTaken: roadNotTaken ?? this.roadNotTaken,
      nextReview: nextReview ?? this.nextReview,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (decisionId.present) {
      map['decision_id'] = Variable<String>(decisionId.value);
    }
    if (reviewedAt.present) {
      map['reviewed_at'] = Variable<DateTime>(reviewedAt.value);
    }
    if (whatActuallyHappened.present) {
      map['what_actually_happened'] = Variable<String>(
        whatActuallyHappened.value,
      );
    }
    if (expectedVsActual.present) {
      map['expected_vs_actual'] = Variable<String>(expectedVsActual.value);
    }
    if (assumptionsThatHeld.present) {
      map['assumptions_that_held'] = Variable<String>(
        $DecisionReviewsTable.$converterassumptionsThatHeldn.toSql(
          assumptionsThatHeld.value,
        ),
      );
    }
    if (assumptionsThatFailed.present) {
      map['assumptions_that_failed'] = Variable<String>(
        $DecisionReviewsTable.$converterassumptionsThatFailedn.toSql(
          assumptionsThatFailed.value,
        ),
      );
    }
    if (unexpectedConsequences.present) {
      map['unexpected_consequences'] = Variable<String>(
        unexpectedConsequences.value,
      );
    }
    if (currentView.present) {
      map['current_view'] = Variable<String>(currentView.value);
    }
    if (lesson.present) {
      map['lesson'] = Variable<String>(lesson.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (satisfaction.present) {
      map['satisfaction'] = Variable<int>(satisfaction.value);
    }
    if (regret.present) {
      map['regret'] = Variable<String>(regret.value);
    }
    if (roadNotTaken.present) {
      map['road_not_taken'] = Variable<String>(roadNotTaken.value);
    }
    if (nextReview.present) {
      map['next_review'] = Variable<String>(nextReview.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DecisionReviewsCompanion(')
          ..write('id: $id, ')
          ..write('decisionId: $decisionId, ')
          ..write('reviewedAt: $reviewedAt, ')
          ..write('whatActuallyHappened: $whatActuallyHappened, ')
          ..write('expectedVsActual: $expectedVsActual, ')
          ..write('assumptionsThatHeld: $assumptionsThatHeld, ')
          ..write('assumptionsThatFailed: $assumptionsThatFailed, ')
          ..write('unexpectedConsequences: $unexpectedConsequences, ')
          ..write('currentView: $currentView, ')
          ..write('lesson: $lesson, ')
          ..write('action: $action, ')
          ..write('satisfaction: $satisfaction, ')
          ..write('regret: $regret, ')
          ..write('roadNotTaken: $roadNotTaken, ')
          ..write('nextReview: $nextReview, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GoalsTable extends Goals with TableInfo<$GoalsTable, Goal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _whyMeta = const VerificationMeta('why');
  @override
  late final GeneratedColumn<String> why = GeneratedColumn<String>(
    'why',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _horizonMeta = const VerificationMeta(
    'horizon',
  );
  @override
  late final GeneratedColumn<String> horizon = GeneratedColumn<String>(
    'horizon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetDateMeta = const VerificationMeta(
    'targetDate',
  );
  @override
  late final GeneratedColumn<DateTime> targetDate = GeneratedColumn<DateTime>(
    'target_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _parentGoalIdMeta = const VerificationMeta(
    'parentGoalId',
  );
  @override
  late final GeneratedColumn<String> parentGoalId = GeneratedColumn<String>(
    'parent_goal_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES goals (id)',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _excludeFromAiMeta = const VerificationMeta(
    'excludeFromAi',
  );
  @override
  late final GeneratedColumn<bool> excludeFromAi = GeneratedColumn<bool>(
    'exclude_from_ai',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("exclude_from_ai" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    why,
    horizon,
    targetDate,
    parentGoalId,
    status,
    excludeFromAi,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<Goal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('why')) {
      context.handle(
        _whyMeta,
        why.isAcceptableOrUnknown(data['why']!, _whyMeta),
      );
    }
    if (data.containsKey('horizon')) {
      context.handle(
        _horizonMeta,
        horizon.isAcceptableOrUnknown(data['horizon']!, _horizonMeta),
      );
    } else if (isInserting) {
      context.missing(_horizonMeta);
    }
    if (data.containsKey('target_date')) {
      context.handle(
        _targetDateMeta,
        targetDate.isAcceptableOrUnknown(data['target_date']!, _targetDateMeta),
      );
    }
    if (data.containsKey('parent_goal_id')) {
      context.handle(
        _parentGoalIdMeta,
        parentGoalId.isAcceptableOrUnknown(
          data['parent_goal_id']!,
          _parentGoalIdMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('exclude_from_ai')) {
      context.handle(
        _excludeFromAiMeta,
        excludeFromAi.isAcceptableOrUnknown(
          data['exclude_from_ai']!,
          _excludeFromAiMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Goal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Goal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      why: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}why'],
      ),
      horizon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}horizon'],
      )!,
      targetDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}target_date'],
      ),
      parentGoalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_goal_id'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      excludeFromAi: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}exclude_from_ai'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $GoalsTable createAlias(String alias) {
    return $GoalsTable(attachedDatabase, alias);
  }
}

class Goal extends DataClass implements Insertable<Goal> {
  final String id;
  final String title;
  final String? why;
  final String horizon;
  final DateTime? targetDate;
  final String? parentGoalId;
  final String status;
  final bool excludeFromAi;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Goal({
    required this.id,
    required this.title,
    this.why,
    required this.horizon,
    this.targetDate,
    this.parentGoalId,
    required this.status,
    required this.excludeFromAi,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || why != null) {
      map['why'] = Variable<String>(why);
    }
    map['horizon'] = Variable<String>(horizon);
    if (!nullToAbsent || targetDate != null) {
      map['target_date'] = Variable<DateTime>(targetDate);
    }
    if (!nullToAbsent || parentGoalId != null) {
      map['parent_goal_id'] = Variable<String>(parentGoalId);
    }
    map['status'] = Variable<String>(status);
    map['exclude_from_ai'] = Variable<bool>(excludeFromAi);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      id: Value(id),
      title: Value(title),
      why: why == null && nullToAbsent ? const Value.absent() : Value(why),
      horizon: Value(horizon),
      targetDate: targetDate == null && nullToAbsent
          ? const Value.absent()
          : Value(targetDate),
      parentGoalId: parentGoalId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentGoalId),
      status: Value(status),
      excludeFromAi: Value(excludeFromAi),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Goal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Goal(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      why: serializer.fromJson<String?>(json['why']),
      horizon: serializer.fromJson<String>(json['horizon']),
      targetDate: serializer.fromJson<DateTime?>(json['targetDate']),
      parentGoalId: serializer.fromJson<String?>(json['parentGoalId']),
      status: serializer.fromJson<String>(json['status']),
      excludeFromAi: serializer.fromJson<bool>(json['excludeFromAi']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'why': serializer.toJson<String?>(why),
      'horizon': serializer.toJson<String>(horizon),
      'targetDate': serializer.toJson<DateTime?>(targetDate),
      'parentGoalId': serializer.toJson<String?>(parentGoalId),
      'status': serializer.toJson<String>(status),
      'excludeFromAi': serializer.toJson<bool>(excludeFromAi),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Goal copyWith({
    String? id,
    String? title,
    Value<String?> why = const Value.absent(),
    String? horizon,
    Value<DateTime?> targetDate = const Value.absent(),
    Value<String?> parentGoalId = const Value.absent(),
    String? status,
    bool? excludeFromAi,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Goal(
    id: id ?? this.id,
    title: title ?? this.title,
    why: why.present ? why.value : this.why,
    horizon: horizon ?? this.horizon,
    targetDate: targetDate.present ? targetDate.value : this.targetDate,
    parentGoalId: parentGoalId.present ? parentGoalId.value : this.parentGoalId,
    status: status ?? this.status,
    excludeFromAi: excludeFromAi ?? this.excludeFromAi,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Goal copyWithCompanion(GoalsCompanion data) {
    return Goal(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      why: data.why.present ? data.why.value : this.why,
      horizon: data.horizon.present ? data.horizon.value : this.horizon,
      targetDate: data.targetDate.present
          ? data.targetDate.value
          : this.targetDate,
      parentGoalId: data.parentGoalId.present
          ? data.parentGoalId.value
          : this.parentGoalId,
      status: data.status.present ? data.status.value : this.status,
      excludeFromAi: data.excludeFromAi.present
          ? data.excludeFromAi.value
          : this.excludeFromAi,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Goal(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('why: $why, ')
          ..write('horizon: $horizon, ')
          ..write('targetDate: $targetDate, ')
          ..write('parentGoalId: $parentGoalId, ')
          ..write('status: $status, ')
          ..write('excludeFromAi: $excludeFromAi, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    why,
    horizon,
    targetDate,
    parentGoalId,
    status,
    excludeFromAi,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Goal &&
          other.id == this.id &&
          other.title == this.title &&
          other.why == this.why &&
          other.horizon == this.horizon &&
          other.targetDate == this.targetDate &&
          other.parentGoalId == this.parentGoalId &&
          other.status == this.status &&
          other.excludeFromAi == this.excludeFromAi &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class GoalsCompanion extends UpdateCompanion<Goal> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> why;
  final Value<String> horizon;
  final Value<DateTime?> targetDate;
  final Value<String?> parentGoalId;
  final Value<String> status;
  final Value<bool> excludeFromAi;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const GoalsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.why = const Value.absent(),
    this.horizon = const Value.absent(),
    this.targetDate = const Value.absent(),
    this.parentGoalId = const Value.absent(),
    this.status = const Value.absent(),
    this.excludeFromAi = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalsCompanion.insert({
    required String id,
    required String title,
    this.why = const Value.absent(),
    required String horizon,
    this.targetDate = const Value.absent(),
    this.parentGoalId = const Value.absent(),
    this.status = const Value.absent(),
    this.excludeFromAi = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       horizon = Value(horizon);
  static Insertable<Goal> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? why,
    Expression<String>? horizon,
    Expression<DateTime>? targetDate,
    Expression<String>? parentGoalId,
    Expression<String>? status,
    Expression<bool>? excludeFromAi,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (why != null) 'why': why,
      if (horizon != null) 'horizon': horizon,
      if (targetDate != null) 'target_date': targetDate,
      if (parentGoalId != null) 'parent_goal_id': parentGoalId,
      if (status != null) 'status': status,
      if (excludeFromAi != null) 'exclude_from_ai': excludeFromAi,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? why,
    Value<String>? horizon,
    Value<DateTime?>? targetDate,
    Value<String?>? parentGoalId,
    Value<String>? status,
    Value<bool>? excludeFromAi,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return GoalsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      why: why ?? this.why,
      horizon: horizon ?? this.horizon,
      targetDate: targetDate ?? this.targetDate,
      parentGoalId: parentGoalId ?? this.parentGoalId,
      status: status ?? this.status,
      excludeFromAi: excludeFromAi ?? this.excludeFromAi,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (why.present) {
      map['why'] = Variable<String>(why.value);
    }
    if (horizon.present) {
      map['horizon'] = Variable<String>(horizon.value);
    }
    if (targetDate.present) {
      map['target_date'] = Variable<DateTime>(targetDate.value);
    }
    if (parentGoalId.present) {
      map['parent_goal_id'] = Variable<String>(parentGoalId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (excludeFromAi.present) {
      map['exclude_from_ai'] = Variable<bool>(excludeFromAi.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('why: $why, ')
          ..write('horizon: $horizon, ')
          ..write('targetDate: $targetDate, ')
          ..write('parentGoalId: $parentGoalId, ')
          ..write('status: $status, ')
          ..write('excludeFromAi: $excludeFromAi, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GoalVersionsTable extends GoalVersions
    with TableInfo<$GoalVersionsTable, GoalVersion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalVersionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _goalIdMeta = const VerificationMeta('goalId');
  @override
  late final GeneratedColumn<String> goalId = GeneratedColumn<String>(
    'goal_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES goals (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _versionNoMeta = const VerificationMeta(
    'versionNo',
  );
  @override
  late final GeneratedColumn<int> versionNo = GeneratedColumn<int>(
    'version_no',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
  snapshot = GeneratedColumn<String>(
    'snapshot',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<Map<String, dynamic>>($GoalVersionsTable.$convertersnapshot);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    goalId,
    versionNo,
    snapshot,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goal_versions';
  @override
  VerificationContext validateIntegrity(
    Insertable<GoalVersion> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('goal_id')) {
      context.handle(
        _goalIdMeta,
        goalId.isAcceptableOrUnknown(data['goal_id']!, _goalIdMeta),
      );
    } else if (isInserting) {
      context.missing(_goalIdMeta);
    }
    if (data.containsKey('version_no')) {
      context.handle(
        _versionNoMeta,
        versionNo.isAcceptableOrUnknown(data['version_no']!, _versionNoMeta),
      );
    } else if (isInserting) {
      context.missing(_versionNoMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GoalVersion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoalVersion(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      goalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}goal_id'],
      )!,
      versionNo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version_no'],
      )!,
      snapshot: $GoalVersionsTable.$convertersnapshot.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}snapshot'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $GoalVersionsTable createAlias(String alias) {
    return $GoalVersionsTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $convertersnapshot =
      const JsonMapConverter();
}

class GoalVersion extends DataClass implements Insertable<GoalVersion> {
  final String id;
  final String goalId;
  final int versionNo;
  final Map<String, dynamic> snapshot;
  final DateTime createdAt;
  const GoalVersion({
    required this.id,
    required this.goalId,
    required this.versionNo,
    required this.snapshot,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['goal_id'] = Variable<String>(goalId);
    map['version_no'] = Variable<int>(versionNo);
    {
      map['snapshot'] = Variable<String>(
        $GoalVersionsTable.$convertersnapshot.toSql(snapshot),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  GoalVersionsCompanion toCompanion(bool nullToAbsent) {
    return GoalVersionsCompanion(
      id: Value(id),
      goalId: Value(goalId),
      versionNo: Value(versionNo),
      snapshot: Value(snapshot),
      createdAt: Value(createdAt),
    );
  }

  factory GoalVersion.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalVersion(
      id: serializer.fromJson<String>(json['id']),
      goalId: serializer.fromJson<String>(json['goalId']),
      versionNo: serializer.fromJson<int>(json['versionNo']),
      snapshot: serializer.fromJson<Map<String, dynamic>>(json['snapshot']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'goalId': serializer.toJson<String>(goalId),
      'versionNo': serializer.toJson<int>(versionNo),
      'snapshot': serializer.toJson<Map<String, dynamic>>(snapshot),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  GoalVersion copyWith({
    String? id,
    String? goalId,
    int? versionNo,
    Map<String, dynamic>? snapshot,
    DateTime? createdAt,
  }) => GoalVersion(
    id: id ?? this.id,
    goalId: goalId ?? this.goalId,
    versionNo: versionNo ?? this.versionNo,
    snapshot: snapshot ?? this.snapshot,
    createdAt: createdAt ?? this.createdAt,
  );
  GoalVersion copyWithCompanion(GoalVersionsCompanion data) {
    return GoalVersion(
      id: data.id.present ? data.id.value : this.id,
      goalId: data.goalId.present ? data.goalId.value : this.goalId,
      versionNo: data.versionNo.present ? data.versionNo.value : this.versionNo,
      snapshot: data.snapshot.present ? data.snapshot.value : this.snapshot,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GoalVersion(')
          ..write('id: $id, ')
          ..write('goalId: $goalId, ')
          ..write('versionNo: $versionNo, ')
          ..write('snapshot: $snapshot, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, goalId, versionNo, snapshot, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalVersion &&
          other.id == this.id &&
          other.goalId == this.goalId &&
          other.versionNo == this.versionNo &&
          other.snapshot == this.snapshot &&
          other.createdAt == this.createdAt);
}

class GoalVersionsCompanion extends UpdateCompanion<GoalVersion> {
  final Value<String> id;
  final Value<String> goalId;
  final Value<int> versionNo;
  final Value<Map<String, dynamic>> snapshot;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const GoalVersionsCompanion({
    this.id = const Value.absent(),
    this.goalId = const Value.absent(),
    this.versionNo = const Value.absent(),
    this.snapshot = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalVersionsCompanion.insert({
    required String id,
    required String goalId,
    required int versionNo,
    required Map<String, dynamic> snapshot,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       goalId = Value(goalId),
       versionNo = Value(versionNo),
       snapshot = Value(snapshot);
  static Insertable<GoalVersion> custom({
    Expression<String>? id,
    Expression<String>? goalId,
    Expression<int>? versionNo,
    Expression<String>? snapshot,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (goalId != null) 'goal_id': goalId,
      if (versionNo != null) 'version_no': versionNo,
      if (snapshot != null) 'snapshot': snapshot,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalVersionsCompanion copyWith({
    Value<String>? id,
    Value<String>? goalId,
    Value<int>? versionNo,
    Value<Map<String, dynamic>>? snapshot,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return GoalVersionsCompanion(
      id: id ?? this.id,
      goalId: goalId ?? this.goalId,
      versionNo: versionNo ?? this.versionNo,
      snapshot: snapshot ?? this.snapshot,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (goalId.present) {
      map['goal_id'] = Variable<String>(goalId.value);
    }
    if (versionNo.present) {
      map['version_no'] = Variable<int>(versionNo.value);
    }
    if (snapshot.present) {
      map['snapshot'] = Variable<String>(
        $GoalVersionsTable.$convertersnapshot.toSql(snapshot.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalVersionsCompanion(')
          ..write('id: $id, ')
          ..write('goalId: $goalId, ')
          ..write('versionNo: $versionNo, ')
          ..write('snapshot: $snapshot, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GoalCheckinsTable extends GoalCheckins
    with TableInfo<$GoalCheckinsTable, GoalCheckin> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalCheckinsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _goalIdMeta = const VerificationMeta('goalId');
  @override
  late final GeneratedColumn<String> goalId = GeneratedColumn<String>(
    'goal_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES goals (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _checkedAtMeta = const VerificationMeta(
    'checkedAt',
  );
  @override
  late final GeneratedColumn<DateTime> checkedAt = GeneratedColumn<DateTime>(
    'checked_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, goalId, checkedAt, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goal_checkins';
  @override
  VerificationContext validateIntegrity(
    Insertable<GoalCheckin> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('goal_id')) {
      context.handle(
        _goalIdMeta,
        goalId.isAcceptableOrUnknown(data['goal_id']!, _goalIdMeta),
      );
    } else if (isInserting) {
      context.missing(_goalIdMeta);
    }
    if (data.containsKey('checked_at')) {
      context.handle(
        _checkedAtMeta,
        checkedAt.isAcceptableOrUnknown(data['checked_at']!, _checkedAtMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GoalCheckin map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoalCheckin(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      goalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}goal_id'],
      )!,
      checkedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}checked_at'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $GoalCheckinsTable createAlias(String alias) {
    return $GoalCheckinsTable(attachedDatabase, alias);
  }
}

class GoalCheckin extends DataClass implements Insertable<GoalCheckin> {
  final String id;
  final String goalId;
  final DateTime checkedAt;
  final String? notes;
  const GoalCheckin({
    required this.id,
    required this.goalId,
    required this.checkedAt,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['goal_id'] = Variable<String>(goalId);
    map['checked_at'] = Variable<DateTime>(checkedAt);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  GoalCheckinsCompanion toCompanion(bool nullToAbsent) {
    return GoalCheckinsCompanion(
      id: Value(id),
      goalId: Value(goalId),
      checkedAt: Value(checkedAt),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory GoalCheckin.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalCheckin(
      id: serializer.fromJson<String>(json['id']),
      goalId: serializer.fromJson<String>(json['goalId']),
      checkedAt: serializer.fromJson<DateTime>(json['checkedAt']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'goalId': serializer.toJson<String>(goalId),
      'checkedAt': serializer.toJson<DateTime>(checkedAt),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  GoalCheckin copyWith({
    String? id,
    String? goalId,
    DateTime? checkedAt,
    Value<String?> notes = const Value.absent(),
  }) => GoalCheckin(
    id: id ?? this.id,
    goalId: goalId ?? this.goalId,
    checkedAt: checkedAt ?? this.checkedAt,
    notes: notes.present ? notes.value : this.notes,
  );
  GoalCheckin copyWithCompanion(GoalCheckinsCompanion data) {
    return GoalCheckin(
      id: data.id.present ? data.id.value : this.id,
      goalId: data.goalId.present ? data.goalId.value : this.goalId,
      checkedAt: data.checkedAt.present ? data.checkedAt.value : this.checkedAt,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GoalCheckin(')
          ..write('id: $id, ')
          ..write('goalId: $goalId, ')
          ..write('checkedAt: $checkedAt, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, goalId, checkedAt, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalCheckin &&
          other.id == this.id &&
          other.goalId == this.goalId &&
          other.checkedAt == this.checkedAt &&
          other.notes == this.notes);
}

class GoalCheckinsCompanion extends UpdateCompanion<GoalCheckin> {
  final Value<String> id;
  final Value<String> goalId;
  final Value<DateTime> checkedAt;
  final Value<String?> notes;
  final Value<int> rowid;
  const GoalCheckinsCompanion({
    this.id = const Value.absent(),
    this.goalId = const Value.absent(),
    this.checkedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalCheckinsCompanion.insert({
    required String id,
    required String goalId,
    this.checkedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       goalId = Value(goalId);
  static Insertable<GoalCheckin> custom({
    Expression<String>? id,
    Expression<String>? goalId,
    Expression<DateTime>? checkedAt,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (goalId != null) 'goal_id': goalId,
      if (checkedAt != null) 'checked_at': checkedAt,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalCheckinsCompanion copyWith({
    Value<String>? id,
    Value<String>? goalId,
    Value<DateTime>? checkedAt,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return GoalCheckinsCompanion(
      id: id ?? this.id,
      goalId: goalId ?? this.goalId,
      checkedAt: checkedAt ?? this.checkedAt,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (goalId.present) {
      map['goal_id'] = Variable<String>(goalId.value);
    }
    if (checkedAt.present) {
      map['checked_at'] = Variable<DateTime>(checkedAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalCheckinsCompanion(')
          ..write('id: $id, ')
          ..write('goalId: $goalId, ')
          ..write('checkedAt: $checkedAt, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReviewSchedulesTable extends ReviewSchedules
    with TableInfo<$ReviewSchedulesTable, ReviewSchedule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReviewSchedulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _decisionIdMeta = const VerificationMeta(
    'decisionId',
  );
  @override
  late final GeneratedColumn<String> decisionId = GeneratedColumn<String>(
    'decision_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES decisions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _goalIdMeta = const VerificationMeta('goalId');
  @override
  late final GeneratedColumn<String> goalId = GeneratedColumn<String>(
    'goal_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES goals (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _triggerTypeMeta = const VerificationMeta(
    'triggerType',
  );
  @override
  late final GeneratedColumn<String> triggerType = GeneratedColumn<String>(
    'trigger_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  triggerConfig =
      GeneratedColumn<String>(
        'trigger_config',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<Map<String, dynamic>?>(
        $ReviewSchedulesTable.$convertertriggerConfign,
      );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('review'),
  );
  static const VerificationMeta _nextDueAtMeta = const VerificationMeta(
    'nextDueAt',
  );
  @override
  late final GeneratedColumn<DateTime> nextDueAt = GeneratedColumn<DateTime>(
    'next_due_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastCompletedAtMeta = const VerificationMeta(
    'lastCompletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastCompletedAt =
      GeneratedColumn<DateTime>(
        'last_completed_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _snoozedUntilMeta = const VerificationMeta(
    'snoozedUntil',
  );
  @override
  late final GeneratedColumn<DateTime> snoozedUntil = GeneratedColumn<DateTime>(
    'snoozed_until',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    decisionId,
    goalId,
    triggerType,
    triggerConfig,
    kind,
    nextDueAt,
    lastCompletedAt,
    snoozedUntil,
    active,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'review_schedules';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReviewSchedule> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('decision_id')) {
      context.handle(
        _decisionIdMeta,
        decisionId.isAcceptableOrUnknown(data['decision_id']!, _decisionIdMeta),
      );
    }
    if (data.containsKey('goal_id')) {
      context.handle(
        _goalIdMeta,
        goalId.isAcceptableOrUnknown(data['goal_id']!, _goalIdMeta),
      );
    }
    if (data.containsKey('trigger_type')) {
      context.handle(
        _triggerTypeMeta,
        triggerType.isAcceptableOrUnknown(
          data['trigger_type']!,
          _triggerTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_triggerTypeMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    }
    if (data.containsKey('next_due_at')) {
      context.handle(
        _nextDueAtMeta,
        nextDueAt.isAcceptableOrUnknown(data['next_due_at']!, _nextDueAtMeta),
      );
    }
    if (data.containsKey('last_completed_at')) {
      context.handle(
        _lastCompletedAtMeta,
        lastCompletedAt.isAcceptableOrUnknown(
          data['last_completed_at']!,
          _lastCompletedAtMeta,
        ),
      );
    }
    if (data.containsKey('snoozed_until')) {
      context.handle(
        _snoozedUntilMeta,
        snoozedUntil.isAcceptableOrUnknown(
          data['snoozed_until']!,
          _snoozedUntilMeta,
        ),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReviewSchedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReviewSchedule(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      decisionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}decision_id'],
      ),
      goalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}goal_id'],
      ),
      triggerType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trigger_type'],
      )!,
      triggerConfig: $ReviewSchedulesTable.$convertertriggerConfign.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}trigger_config'],
        ),
      ),
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      nextDueAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_due_at'],
      ),
      lastCompletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_completed_at'],
      ),
      snoozedUntil: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}snoozed_until'],
      ),
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
    );
  }

  @override
  $ReviewSchedulesTable createAlias(String alias) {
    return $ReviewSchedulesTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $convertertriggerConfig =
      const JsonMapConverter();
  static TypeConverter<Map<String, dynamic>?, String?>
  $convertertriggerConfign = NullAwareTypeConverter.wrap(
    $convertertriggerConfig,
  );
}

class ReviewSchedule extends DataClass implements Insertable<ReviewSchedule> {
  final String id;
  final String? decisionId;
  final String? goalId;
  final String triggerType;
  final Map<String, dynamic>? triggerConfig;
  final String kind;
  final DateTime? nextDueAt;
  final DateTime? lastCompletedAt;
  final DateTime? snoozedUntil;
  final bool active;
  const ReviewSchedule({
    required this.id,
    this.decisionId,
    this.goalId,
    required this.triggerType,
    this.triggerConfig,
    required this.kind,
    this.nextDueAt,
    this.lastCompletedAt,
    this.snoozedUntil,
    required this.active,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || decisionId != null) {
      map['decision_id'] = Variable<String>(decisionId);
    }
    if (!nullToAbsent || goalId != null) {
      map['goal_id'] = Variable<String>(goalId);
    }
    map['trigger_type'] = Variable<String>(triggerType);
    if (!nullToAbsent || triggerConfig != null) {
      map['trigger_config'] = Variable<String>(
        $ReviewSchedulesTable.$convertertriggerConfign.toSql(triggerConfig),
      );
    }
    map['kind'] = Variable<String>(kind);
    if (!nullToAbsent || nextDueAt != null) {
      map['next_due_at'] = Variable<DateTime>(nextDueAt);
    }
    if (!nullToAbsent || lastCompletedAt != null) {
      map['last_completed_at'] = Variable<DateTime>(lastCompletedAt);
    }
    if (!nullToAbsent || snoozedUntil != null) {
      map['snoozed_until'] = Variable<DateTime>(snoozedUntil);
    }
    map['active'] = Variable<bool>(active);
    return map;
  }

  ReviewSchedulesCompanion toCompanion(bool nullToAbsent) {
    return ReviewSchedulesCompanion(
      id: Value(id),
      decisionId: decisionId == null && nullToAbsent
          ? const Value.absent()
          : Value(decisionId),
      goalId: goalId == null && nullToAbsent
          ? const Value.absent()
          : Value(goalId),
      triggerType: Value(triggerType),
      triggerConfig: triggerConfig == null && nullToAbsent
          ? const Value.absent()
          : Value(triggerConfig),
      kind: Value(kind),
      nextDueAt: nextDueAt == null && nullToAbsent
          ? const Value.absent()
          : Value(nextDueAt),
      lastCompletedAt: lastCompletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastCompletedAt),
      snoozedUntil: snoozedUntil == null && nullToAbsent
          ? const Value.absent()
          : Value(snoozedUntil),
      active: Value(active),
    );
  }

  factory ReviewSchedule.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReviewSchedule(
      id: serializer.fromJson<String>(json['id']),
      decisionId: serializer.fromJson<String?>(json['decisionId']),
      goalId: serializer.fromJson<String?>(json['goalId']),
      triggerType: serializer.fromJson<String>(json['triggerType']),
      triggerConfig: serializer.fromJson<Map<String, dynamic>?>(
        json['triggerConfig'],
      ),
      kind: serializer.fromJson<String>(json['kind']),
      nextDueAt: serializer.fromJson<DateTime?>(json['nextDueAt']),
      lastCompletedAt: serializer.fromJson<DateTime?>(json['lastCompletedAt']),
      snoozedUntil: serializer.fromJson<DateTime?>(json['snoozedUntil']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'decisionId': serializer.toJson<String?>(decisionId),
      'goalId': serializer.toJson<String?>(goalId),
      'triggerType': serializer.toJson<String>(triggerType),
      'triggerConfig': serializer.toJson<Map<String, dynamic>?>(triggerConfig),
      'kind': serializer.toJson<String>(kind),
      'nextDueAt': serializer.toJson<DateTime?>(nextDueAt),
      'lastCompletedAt': serializer.toJson<DateTime?>(lastCompletedAt),
      'snoozedUntil': serializer.toJson<DateTime?>(snoozedUntil),
      'active': serializer.toJson<bool>(active),
    };
  }

  ReviewSchedule copyWith({
    String? id,
    Value<String?> decisionId = const Value.absent(),
    Value<String?> goalId = const Value.absent(),
    String? triggerType,
    Value<Map<String, dynamic>?> triggerConfig = const Value.absent(),
    String? kind,
    Value<DateTime?> nextDueAt = const Value.absent(),
    Value<DateTime?> lastCompletedAt = const Value.absent(),
    Value<DateTime?> snoozedUntil = const Value.absent(),
    bool? active,
  }) => ReviewSchedule(
    id: id ?? this.id,
    decisionId: decisionId.present ? decisionId.value : this.decisionId,
    goalId: goalId.present ? goalId.value : this.goalId,
    triggerType: triggerType ?? this.triggerType,
    triggerConfig: triggerConfig.present
        ? triggerConfig.value
        : this.triggerConfig,
    kind: kind ?? this.kind,
    nextDueAt: nextDueAt.present ? nextDueAt.value : this.nextDueAt,
    lastCompletedAt: lastCompletedAt.present
        ? lastCompletedAt.value
        : this.lastCompletedAt,
    snoozedUntil: snoozedUntil.present ? snoozedUntil.value : this.snoozedUntil,
    active: active ?? this.active,
  );
  ReviewSchedule copyWithCompanion(ReviewSchedulesCompanion data) {
    return ReviewSchedule(
      id: data.id.present ? data.id.value : this.id,
      decisionId: data.decisionId.present
          ? data.decisionId.value
          : this.decisionId,
      goalId: data.goalId.present ? data.goalId.value : this.goalId,
      triggerType: data.triggerType.present
          ? data.triggerType.value
          : this.triggerType,
      triggerConfig: data.triggerConfig.present
          ? data.triggerConfig.value
          : this.triggerConfig,
      kind: data.kind.present ? data.kind.value : this.kind,
      nextDueAt: data.nextDueAt.present ? data.nextDueAt.value : this.nextDueAt,
      lastCompletedAt: data.lastCompletedAt.present
          ? data.lastCompletedAt.value
          : this.lastCompletedAt,
      snoozedUntil: data.snoozedUntil.present
          ? data.snoozedUntil.value
          : this.snoozedUntil,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReviewSchedule(')
          ..write('id: $id, ')
          ..write('decisionId: $decisionId, ')
          ..write('goalId: $goalId, ')
          ..write('triggerType: $triggerType, ')
          ..write('triggerConfig: $triggerConfig, ')
          ..write('kind: $kind, ')
          ..write('nextDueAt: $nextDueAt, ')
          ..write('lastCompletedAt: $lastCompletedAt, ')
          ..write('snoozedUntil: $snoozedUntil, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    decisionId,
    goalId,
    triggerType,
    triggerConfig,
    kind,
    nextDueAt,
    lastCompletedAt,
    snoozedUntil,
    active,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReviewSchedule &&
          other.id == this.id &&
          other.decisionId == this.decisionId &&
          other.goalId == this.goalId &&
          other.triggerType == this.triggerType &&
          other.triggerConfig == this.triggerConfig &&
          other.kind == this.kind &&
          other.nextDueAt == this.nextDueAt &&
          other.lastCompletedAt == this.lastCompletedAt &&
          other.snoozedUntil == this.snoozedUntil &&
          other.active == this.active);
}

class ReviewSchedulesCompanion extends UpdateCompanion<ReviewSchedule> {
  final Value<String> id;
  final Value<String?> decisionId;
  final Value<String?> goalId;
  final Value<String> triggerType;
  final Value<Map<String, dynamic>?> triggerConfig;
  final Value<String> kind;
  final Value<DateTime?> nextDueAt;
  final Value<DateTime?> lastCompletedAt;
  final Value<DateTime?> snoozedUntil;
  final Value<bool> active;
  final Value<int> rowid;
  const ReviewSchedulesCompanion({
    this.id = const Value.absent(),
    this.decisionId = const Value.absent(),
    this.goalId = const Value.absent(),
    this.triggerType = const Value.absent(),
    this.triggerConfig = const Value.absent(),
    this.kind = const Value.absent(),
    this.nextDueAt = const Value.absent(),
    this.lastCompletedAt = const Value.absent(),
    this.snoozedUntil = const Value.absent(),
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReviewSchedulesCompanion.insert({
    required String id,
    this.decisionId = const Value.absent(),
    this.goalId = const Value.absent(),
    required String triggerType,
    this.triggerConfig = const Value.absent(),
    this.kind = const Value.absent(),
    this.nextDueAt = const Value.absent(),
    this.lastCompletedAt = const Value.absent(),
    this.snoozedUntil = const Value.absent(),
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       triggerType = Value(triggerType);
  static Insertable<ReviewSchedule> custom({
    Expression<String>? id,
    Expression<String>? decisionId,
    Expression<String>? goalId,
    Expression<String>? triggerType,
    Expression<String>? triggerConfig,
    Expression<String>? kind,
    Expression<DateTime>? nextDueAt,
    Expression<DateTime>? lastCompletedAt,
    Expression<DateTime>? snoozedUntil,
    Expression<bool>? active,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (decisionId != null) 'decision_id': decisionId,
      if (goalId != null) 'goal_id': goalId,
      if (triggerType != null) 'trigger_type': triggerType,
      if (triggerConfig != null) 'trigger_config': triggerConfig,
      if (kind != null) 'kind': kind,
      if (nextDueAt != null) 'next_due_at': nextDueAt,
      if (lastCompletedAt != null) 'last_completed_at': lastCompletedAt,
      if (snoozedUntil != null) 'snoozed_until': snoozedUntil,
      if (active != null) 'active': active,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReviewSchedulesCompanion copyWith({
    Value<String>? id,
    Value<String?>? decisionId,
    Value<String?>? goalId,
    Value<String>? triggerType,
    Value<Map<String, dynamic>?>? triggerConfig,
    Value<String>? kind,
    Value<DateTime?>? nextDueAt,
    Value<DateTime?>? lastCompletedAt,
    Value<DateTime?>? snoozedUntil,
    Value<bool>? active,
    Value<int>? rowid,
  }) {
    return ReviewSchedulesCompanion(
      id: id ?? this.id,
      decisionId: decisionId ?? this.decisionId,
      goalId: goalId ?? this.goalId,
      triggerType: triggerType ?? this.triggerType,
      triggerConfig: triggerConfig ?? this.triggerConfig,
      kind: kind ?? this.kind,
      nextDueAt: nextDueAt ?? this.nextDueAt,
      lastCompletedAt: lastCompletedAt ?? this.lastCompletedAt,
      snoozedUntil: snoozedUntil ?? this.snoozedUntil,
      active: active ?? this.active,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (decisionId.present) {
      map['decision_id'] = Variable<String>(decisionId.value);
    }
    if (goalId.present) {
      map['goal_id'] = Variable<String>(goalId.value);
    }
    if (triggerType.present) {
      map['trigger_type'] = Variable<String>(triggerType.value);
    }
    if (triggerConfig.present) {
      map['trigger_config'] = Variable<String>(
        $ReviewSchedulesTable.$convertertriggerConfign.toSql(
          triggerConfig.value,
        ),
      );
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (nextDueAt.present) {
      map['next_due_at'] = Variable<DateTime>(nextDueAt.value);
    }
    if (lastCompletedAt.present) {
      map['last_completed_at'] = Variable<DateTime>(lastCompletedAt.value);
    }
    if (snoozedUntil.present) {
      map['snoozed_until'] = Variable<DateTime>(snoozedUntil.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReviewSchedulesCompanion(')
          ..write('id: $id, ')
          ..write('decisionId: $decisionId, ')
          ..write('goalId: $goalId, ')
          ..write('triggerType: $triggerType, ')
          ..write('triggerConfig: $triggerConfig, ')
          ..write('kind: $kind, ')
          ..write('nextDueAt: $nextDueAt, ')
          ..write('lastCompletedAt: $lastCompletedAt, ')
          ..write('snoozedUntil: $snoozedUntil, ')
          ..write('active: $active, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RelationsTable extends Relations
    with TableInfo<$RelationsTable, Relation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceTypeMeta = const VerificationMeta(
    'sourceType',
  );
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
    'source_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
    'source_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetTypeMeta = const VerificationMeta(
    'targetType',
  );
  @override
  late final GeneratedColumn<String> targetType = GeneratedColumn<String>(
    'target_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetIdMeta = const VerificationMeta(
    'targetId',
  );
  @override
  late final GeneratedColumn<String> targetId = GeneratedColumn<String>(
    'target_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relationTypeMeta = const VerificationMeta(
    'relationType',
  );
  @override
  late final GeneratedColumn<String> relationType = GeneratedColumn<String>(
    'relation_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  metadata = GeneratedColumn<String>(
    'metadata',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<Map<String, dynamic>?>($RelationsTable.$convertermetadatan);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sourceType,
    sourceId,
    targetType,
    targetId,
    relationType,
    metadata,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'relations';
  @override
  VerificationContext validateIntegrity(
    Insertable<Relation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('source_type')) {
      context.handle(
        _sourceTypeMeta,
        sourceType.isAcceptableOrUnknown(data['source_type']!, _sourceTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceTypeMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    if (data.containsKey('target_type')) {
      context.handle(
        _targetTypeMeta,
        targetType.isAcceptableOrUnknown(data['target_type']!, _targetTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_targetTypeMeta);
    }
    if (data.containsKey('target_id')) {
      context.handle(
        _targetIdMeta,
        targetId.isAcceptableOrUnknown(data['target_id']!, _targetIdMeta),
      );
    } else if (isInserting) {
      context.missing(_targetIdMeta);
    }
    if (data.containsKey('relation_type')) {
      context.handle(
        _relationTypeMeta,
        relationType.isAcceptableOrUnknown(
          data['relation_type']!,
          _relationTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relationTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Relation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Relation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      sourceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_type'],
      )!,
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_id'],
      )!,
      targetType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_type'],
      )!,
      targetId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_id'],
      )!,
      relationType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relation_type'],
      )!,
      metadata: $RelationsTable.$convertermetadatan.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}metadata'],
        ),
      ),
    );
  }

  @override
  $RelationsTable createAlias(String alias) {
    return $RelationsTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $convertermetadata =
      const JsonMapConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $convertermetadatan =
      NullAwareTypeConverter.wrap($convertermetadata);
}

class Relation extends DataClass implements Insertable<Relation> {
  final String id;
  final String sourceType;
  final String sourceId;
  final String targetType;
  final String targetId;
  final String relationType;
  final Map<String, dynamic>? metadata;
  const Relation({
    required this.id,
    required this.sourceType,
    required this.sourceId,
    required this.targetType,
    required this.targetId,
    required this.relationType,
    this.metadata,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['source_type'] = Variable<String>(sourceType);
    map['source_id'] = Variable<String>(sourceId);
    map['target_type'] = Variable<String>(targetType);
    map['target_id'] = Variable<String>(targetId);
    map['relation_type'] = Variable<String>(relationType);
    if (!nullToAbsent || metadata != null) {
      map['metadata'] = Variable<String>(
        $RelationsTable.$convertermetadatan.toSql(metadata),
      );
    }
    return map;
  }

  RelationsCompanion toCompanion(bool nullToAbsent) {
    return RelationsCompanion(
      id: Value(id),
      sourceType: Value(sourceType),
      sourceId: Value(sourceId),
      targetType: Value(targetType),
      targetId: Value(targetId),
      relationType: Value(relationType),
      metadata: metadata == null && nullToAbsent
          ? const Value.absent()
          : Value(metadata),
    );
  }

  factory Relation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Relation(
      id: serializer.fromJson<String>(json['id']),
      sourceType: serializer.fromJson<String>(json['sourceType']),
      sourceId: serializer.fromJson<String>(json['sourceId']),
      targetType: serializer.fromJson<String>(json['targetType']),
      targetId: serializer.fromJson<String>(json['targetId']),
      relationType: serializer.fromJson<String>(json['relationType']),
      metadata: serializer.fromJson<Map<String, dynamic>?>(json['metadata']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sourceType': serializer.toJson<String>(sourceType),
      'sourceId': serializer.toJson<String>(sourceId),
      'targetType': serializer.toJson<String>(targetType),
      'targetId': serializer.toJson<String>(targetId),
      'relationType': serializer.toJson<String>(relationType),
      'metadata': serializer.toJson<Map<String, dynamic>?>(metadata),
    };
  }

  Relation copyWith({
    String? id,
    String? sourceType,
    String? sourceId,
    String? targetType,
    String? targetId,
    String? relationType,
    Value<Map<String, dynamic>?> metadata = const Value.absent(),
  }) => Relation(
    id: id ?? this.id,
    sourceType: sourceType ?? this.sourceType,
    sourceId: sourceId ?? this.sourceId,
    targetType: targetType ?? this.targetType,
    targetId: targetId ?? this.targetId,
    relationType: relationType ?? this.relationType,
    metadata: metadata.present ? metadata.value : this.metadata,
  );
  Relation copyWithCompanion(RelationsCompanion data) {
    return Relation(
      id: data.id.present ? data.id.value : this.id,
      sourceType: data.sourceType.present
          ? data.sourceType.value
          : this.sourceType,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      targetType: data.targetType.present
          ? data.targetType.value
          : this.targetType,
      targetId: data.targetId.present ? data.targetId.value : this.targetId,
      relationType: data.relationType.present
          ? data.relationType.value
          : this.relationType,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Relation(')
          ..write('id: $id, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourceId: $sourceId, ')
          ..write('targetType: $targetType, ')
          ..write('targetId: $targetId, ')
          ..write('relationType: $relationType, ')
          ..write('metadata: $metadata')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sourceType,
    sourceId,
    targetType,
    targetId,
    relationType,
    metadata,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Relation &&
          other.id == this.id &&
          other.sourceType == this.sourceType &&
          other.sourceId == this.sourceId &&
          other.targetType == this.targetType &&
          other.targetId == this.targetId &&
          other.relationType == this.relationType &&
          other.metadata == this.metadata);
}

class RelationsCompanion extends UpdateCompanion<Relation> {
  final Value<String> id;
  final Value<String> sourceType;
  final Value<String> sourceId;
  final Value<String> targetType;
  final Value<String> targetId;
  final Value<String> relationType;
  final Value<Map<String, dynamic>?> metadata;
  final Value<int> rowid;
  const RelationsCompanion({
    this.id = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.targetType = const Value.absent(),
    this.targetId = const Value.absent(),
    this.relationType = const Value.absent(),
    this.metadata = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RelationsCompanion.insert({
    required String id,
    required String sourceType,
    required String sourceId,
    required String targetType,
    required String targetId,
    required String relationType,
    this.metadata = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sourceType = Value(sourceType),
       sourceId = Value(sourceId),
       targetType = Value(targetType),
       targetId = Value(targetId),
       relationType = Value(relationType);
  static Insertable<Relation> custom({
    Expression<String>? id,
    Expression<String>? sourceType,
    Expression<String>? sourceId,
    Expression<String>? targetType,
    Expression<String>? targetId,
    Expression<String>? relationType,
    Expression<String>? metadata,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sourceType != null) 'source_type': sourceType,
      if (sourceId != null) 'source_id': sourceId,
      if (targetType != null) 'target_type': targetType,
      if (targetId != null) 'target_id': targetId,
      if (relationType != null) 'relation_type': relationType,
      if (metadata != null) 'metadata': metadata,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RelationsCompanion copyWith({
    Value<String>? id,
    Value<String>? sourceType,
    Value<String>? sourceId,
    Value<String>? targetType,
    Value<String>? targetId,
    Value<String>? relationType,
    Value<Map<String, dynamic>?>? metadata,
    Value<int>? rowid,
  }) {
    return RelationsCompanion(
      id: id ?? this.id,
      sourceType: sourceType ?? this.sourceType,
      sourceId: sourceId ?? this.sourceId,
      targetType: targetType ?? this.targetType,
      targetId: targetId ?? this.targetId,
      relationType: relationType ?? this.relationType,
      metadata: metadata ?? this.metadata,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (targetType.present) {
      map['target_type'] = Variable<String>(targetType.value);
    }
    if (targetId.present) {
      map['target_id'] = Variable<String>(targetId.value);
    }
    if (relationType.present) {
      map['relation_type'] = Variable<String>(relationType.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(
        $RelationsTable.$convertermetadatan.toSql(metadata.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelationsCompanion(')
          ..write('id: $id, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourceId: $sourceId, ')
          ..write('targetType: $targetType, ')
          ..write('targetId: $targetId, ')
          ..write('relationType: $relationType, ')
          ..write('metadata: $metadata, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventsTable extends Events with TableInfo<$EventsTable, Event> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<dynamic>?, String>
  entityIds = GeneratedColumn<String>(
    'entity_ids',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<List<dynamic>?>($EventsTable.$converterentityIdsn);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  metadata = GeneratedColumn<String>(
    'metadata',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<Map<String, dynamic>?>($EventsTable.$convertermetadatan);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    type,
    description,
    occurredAt,
    entityIds,
    metadata,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'events';
  @override
  VerificationContext validateIntegrity(
    Insertable<Event> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Event map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Event(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_at'],
      )!,
      entityIds: $EventsTable.$converterentityIdsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}entity_ids'],
        ),
      ),
      metadata: $EventsTable.$convertermetadatan.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}metadata'],
        ),
      ),
    );
  }

  @override
  $EventsTable createAlias(String alias) {
    return $EventsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<dynamic>, String> $converterentityIds =
      const JsonListConverter();
  static TypeConverter<List<dynamic>?, String?> $converterentityIdsn =
      NullAwareTypeConverter.wrap($converterentityIds);
  static TypeConverter<Map<String, dynamic>, String> $convertermetadata =
      const JsonMapConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $convertermetadatan =
      NullAwareTypeConverter.wrap($convertermetadata);
}

class Event extends DataClass implements Insertable<Event> {
  final String id;
  final String title;
  final String? type;
  final String? description;
  final DateTime occurredAt;
  final List<dynamic>? entityIds;
  final Map<String, dynamic>? metadata;
  const Event({
    required this.id,
    required this.title,
    this.type,
    this.description,
    required this.occurredAt,
    this.entityIds,
    this.metadata,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    if (!nullToAbsent || entityIds != null) {
      map['entity_ids'] = Variable<String>(
        $EventsTable.$converterentityIdsn.toSql(entityIds),
      );
    }
    if (!nullToAbsent || metadata != null) {
      map['metadata'] = Variable<String>(
        $EventsTable.$convertermetadatan.toSql(metadata),
      );
    }
    return map;
  }

  EventsCompanion toCompanion(bool nullToAbsent) {
    return EventsCompanion(
      id: Value(id),
      title: Value(title),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      occurredAt: Value(occurredAt),
      entityIds: entityIds == null && nullToAbsent
          ? const Value.absent()
          : Value(entityIds),
      metadata: metadata == null && nullToAbsent
          ? const Value.absent()
          : Value(metadata),
    );
  }

  factory Event.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Event(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      type: serializer.fromJson<String?>(json['type']),
      description: serializer.fromJson<String?>(json['description']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      entityIds: serializer.fromJson<List<dynamic>?>(json['entityIds']),
      metadata: serializer.fromJson<Map<String, dynamic>?>(json['metadata']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<String?>(type),
      'description': serializer.toJson<String?>(description),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'entityIds': serializer.toJson<List<dynamic>?>(entityIds),
      'metadata': serializer.toJson<Map<String, dynamic>?>(metadata),
    };
  }

  Event copyWith({
    String? id,
    String? title,
    Value<String?> type = const Value.absent(),
    Value<String?> description = const Value.absent(),
    DateTime? occurredAt,
    Value<List<dynamic>?> entityIds = const Value.absent(),
    Value<Map<String, dynamic>?> metadata = const Value.absent(),
  }) => Event(
    id: id ?? this.id,
    title: title ?? this.title,
    type: type.present ? type.value : this.type,
    description: description.present ? description.value : this.description,
    occurredAt: occurredAt ?? this.occurredAt,
    entityIds: entityIds.present ? entityIds.value : this.entityIds,
    metadata: metadata.present ? metadata.value : this.metadata,
  );
  Event copyWithCompanion(EventsCompanion data) {
    return Event(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      type: data.type.present ? data.type.value : this.type,
      description: data.description.present
          ? data.description.value
          : this.description,
      occurredAt: data.occurredAt.present
          ? data.occurredAt.value
          : this.occurredAt,
      entityIds: data.entityIds.present ? data.entityIds.value : this.entityIds,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Event(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('entityIds: $entityIds, ')
          ..write('metadata: $metadata')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    type,
    description,
    occurredAt,
    entityIds,
    metadata,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Event &&
          other.id == this.id &&
          other.title == this.title &&
          other.type == this.type &&
          other.description == this.description &&
          other.occurredAt == this.occurredAt &&
          other.entityIds == this.entityIds &&
          other.metadata == this.metadata);
}

class EventsCompanion extends UpdateCompanion<Event> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> type;
  final Value<String?> description;
  final Value<DateTime> occurredAt;
  final Value<List<dynamic>?> entityIds;
  final Value<Map<String, dynamic>?> metadata;
  final Value<int> rowid;
  const EventsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.entityIds = const Value.absent(),
    this.metadata = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventsCompanion.insert({
    required String id,
    required String title,
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    required DateTime occurredAt,
    this.entityIds = const Value.absent(),
    this.metadata = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       occurredAt = Value(occurredAt);
  static Insertable<Event> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? type,
    Expression<String>? description,
    Expression<DateTime>? occurredAt,
    Expression<String>? entityIds,
    Expression<String>? metadata,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (entityIds != null) 'entity_ids': entityIds,
      if (metadata != null) 'metadata': metadata,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? type,
    Value<String?>? description,
    Value<DateTime>? occurredAt,
    Value<List<dynamic>?>? entityIds,
    Value<Map<String, dynamic>?>? metadata,
    Value<int>? rowid,
  }) {
    return EventsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      description: description ?? this.description,
      occurredAt: occurredAt ?? this.occurredAt,
      entityIds: entityIds ?? this.entityIds,
      metadata: metadata ?? this.metadata,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (entityIds.present) {
      map['entity_ids'] = Variable<String>(
        $EventsTable.$converterentityIdsn.toSql(entityIds.value),
      );
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(
        $EventsTable.$convertermetadatan.toSql(metadata.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('entityIds: $entityIds, ')
          ..write('metadata: $metadata, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReflectionsTable extends Reflections
    with TableInfo<$ReflectionsTable, Reflection> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReflectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _periodTypeMeta = const VerificationMeta(
    'periodType',
  );
  @override
  late final GeneratedColumn<String> periodType = GeneratedColumn<String>(
    'period_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _periodLabelMeta = const VerificationMeta(
    'periodLabel',
  );
  @override
  late final GeneratedColumn<String> periodLabel = GeneratedColumn<String>(
    'period_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
  summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<Map<String, dynamic>>($ReflectionsTable.$convertersummary);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    periodType,
    periodLabel,
    summary,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reflections';
  @override
  VerificationContext validateIntegrity(
    Insertable<Reflection> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('period_type')) {
      context.handle(
        _periodTypeMeta,
        periodType.isAcceptableOrUnknown(data['period_type']!, _periodTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_periodTypeMeta);
    }
    if (data.containsKey('period_label')) {
      context.handle(
        _periodLabelMeta,
        periodLabel.isAcceptableOrUnknown(
          data['period_label']!,
          _periodLabelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_periodLabelMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Reflection map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reflection(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      periodType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}period_type'],
      )!,
      periodLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}period_label'],
      )!,
      summary: $ReflectionsTable.$convertersummary.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}summary'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ReflectionsTable createAlias(String alias) {
    return $ReflectionsTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $convertersummary =
      const JsonMapConverter();
}

class Reflection extends DataClass implements Insertable<Reflection> {
  final String id;
  final String periodType;
  final String periodLabel;
  final Map<String, dynamic> summary;
  final DateTime createdAt;
  const Reflection({
    required this.id,
    required this.periodType,
    required this.periodLabel,
    required this.summary,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['period_type'] = Variable<String>(periodType);
    map['period_label'] = Variable<String>(periodLabel);
    {
      map['summary'] = Variable<String>(
        $ReflectionsTable.$convertersummary.toSql(summary),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ReflectionsCompanion toCompanion(bool nullToAbsent) {
    return ReflectionsCompanion(
      id: Value(id),
      periodType: Value(periodType),
      periodLabel: Value(periodLabel),
      summary: Value(summary),
      createdAt: Value(createdAt),
    );
  }

  factory Reflection.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reflection(
      id: serializer.fromJson<String>(json['id']),
      periodType: serializer.fromJson<String>(json['periodType']),
      periodLabel: serializer.fromJson<String>(json['periodLabel']),
      summary: serializer.fromJson<Map<String, dynamic>>(json['summary']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'periodType': serializer.toJson<String>(periodType),
      'periodLabel': serializer.toJson<String>(periodLabel),
      'summary': serializer.toJson<Map<String, dynamic>>(summary),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Reflection copyWith({
    String? id,
    String? periodType,
    String? periodLabel,
    Map<String, dynamic>? summary,
    DateTime? createdAt,
  }) => Reflection(
    id: id ?? this.id,
    periodType: periodType ?? this.periodType,
    periodLabel: periodLabel ?? this.periodLabel,
    summary: summary ?? this.summary,
    createdAt: createdAt ?? this.createdAt,
  );
  Reflection copyWithCompanion(ReflectionsCompanion data) {
    return Reflection(
      id: data.id.present ? data.id.value : this.id,
      periodType: data.periodType.present
          ? data.periodType.value
          : this.periodType,
      periodLabel: data.periodLabel.present
          ? data.periodLabel.value
          : this.periodLabel,
      summary: data.summary.present ? data.summary.value : this.summary,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reflection(')
          ..write('id: $id, ')
          ..write('periodType: $periodType, ')
          ..write('periodLabel: $periodLabel, ')
          ..write('summary: $summary, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, periodType, periodLabel, summary, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reflection &&
          other.id == this.id &&
          other.periodType == this.periodType &&
          other.periodLabel == this.periodLabel &&
          other.summary == this.summary &&
          other.createdAt == this.createdAt);
}

class ReflectionsCompanion extends UpdateCompanion<Reflection> {
  final Value<String> id;
  final Value<String> periodType;
  final Value<String> periodLabel;
  final Value<Map<String, dynamic>> summary;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ReflectionsCompanion({
    this.id = const Value.absent(),
    this.periodType = const Value.absent(),
    this.periodLabel = const Value.absent(),
    this.summary = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReflectionsCompanion.insert({
    required String id,
    required String periodType,
    required String periodLabel,
    required Map<String, dynamic> summary,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       periodType = Value(periodType),
       periodLabel = Value(periodLabel),
       summary = Value(summary);
  static Insertable<Reflection> custom({
    Expression<String>? id,
    Expression<String>? periodType,
    Expression<String>? periodLabel,
    Expression<String>? summary,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (periodType != null) 'period_type': periodType,
      if (periodLabel != null) 'period_label': periodLabel,
      if (summary != null) 'summary': summary,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReflectionsCompanion copyWith({
    Value<String>? id,
    Value<String>? periodType,
    Value<String>? periodLabel,
    Value<Map<String, dynamic>>? summary,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ReflectionsCompanion(
      id: id ?? this.id,
      periodType: periodType ?? this.periodType,
      periodLabel: periodLabel ?? this.periodLabel,
      summary: summary ?? this.summary,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (periodType.present) {
      map['period_type'] = Variable<String>(periodType.value);
    }
    if (periodLabel.present) {
      map['period_label'] = Variable<String>(periodLabel.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(
        $ReflectionsTable.$convertersummary.toSql(summary.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReflectionsCompanion(')
          ..write('id: $id, ')
          ..write('periodType: $periodType, ')
          ..write('periodLabel: $periodLabel, ')
          ..write('summary: $summary, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProjectEntriesTable extends ProjectEntries
    with TableInfo<$ProjectEntriesTable, ProjectEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectEntityIdMeta = const VerificationMeta(
    'projectEntityId',
  );
  @override
  late final GeneratedColumn<String> projectEntityId = GeneratedColumn<String>(
    'project_entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES entities (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _logicalKindMeta = const VerificationMeta(
    'logicalKind',
  );
  @override
  late final GeneratedColumn<String> logicalKind = GeneratedColumn<String>(
    'logical_kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rootEntryIdMeta = const VerificationMeta(
    'rootEntryId',
  );
  @override
  late final GeneratedColumn<String> rootEntryId = GeneratedColumn<String>(
    'root_entry_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _correctionTargetIdMeta =
      const VerificationMeta('correctionTargetId');
  @override
  late final GeneratedColumn<String> correctionTargetId =
      GeneratedColumn<String>(
        'correction_target_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
      );
  static const VerificationMeta _relatedEntryIdMeta = const VerificationMeta(
    'relatedEntryId',
  );
  @override
  late final GeneratedColumn<String> relatedEntryId = GeneratedColumn<String>(
    'related_entry_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _setupRevisionIdMeta = const VerificationMeta(
    'setupRevisionId',
  );
  @override
  late final GeneratedColumn<String> setupRevisionId = GeneratedColumn<String>(
    'setup_revision_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderingClaimMeta = const VerificationMeta(
    'orderingClaim',
  );
  @override
  late final GeneratedColumn<String> orderingClaim = GeneratedColumn<String>(
    'ordering_claim',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _localDayMeta = const VerificationMeta(
    'localDay',
  );
  @override
  late final GeneratedColumn<String> localDay = GeneratedColumn<String>(
    'local_day',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _capturedOffsetMinutesMeta =
      const VerificationMeta('capturedOffsetMinutes');
  @override
  late final GeneratedColumn<int> capturedOffsetMinutes = GeneratedColumn<int>(
    'captured_offset_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _focusMeta = const VerificationMeta('focus');
  @override
  late final GeneratedColumn<String> focus = GeneratedColumn<String>(
    'focus',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expectedEvidenceMeta = const VerificationMeta(
    'expectedEvidence',
  );
  @override
  late final GeneratedColumn<String> expectedEvidence = GeneratedColumn<String>(
    'expected_evidence',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _observedResultMeta = const VerificationMeta(
    'observedResult',
  );
  @override
  late final GeneratedColumn<String> observedResult = GeneratedColumn<String>(
    'observed_result',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _actualMinutesMeta = const VerificationMeta(
    'actualMinutes',
  );
  @override
  late final GeneratedColumn<int> actualMinutes = GeneratedColumn<int>(
    'actual_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _blockerMeta = const VerificationMeta(
    'blocker',
  );
  @override
  late final GeneratedColumn<String> blocker = GeneratedColumn<String>(
    'blocker',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lessonMeta = const VerificationMeta('lesson');
  @override
  late final GeneratedColumn<String> lesson = GeneratedColumn<String>(
    'lesson',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nextStepMeta = const VerificationMeta(
    'nextStep',
  );
  @override
  late final GeneratedColumn<String> nextStep = GeneratedColumn<String>(
    'next_step',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _milestoneKeyMeta = const VerificationMeta(
    'milestoneKey',
  );
  @override
  late final GeneratedColumn<String> milestoneKey = GeneratedColumn<String>(
    'milestone_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _taskReferenceMeta = const VerificationMeta(
    'taskReference',
  );
  @override
  late final GeneratedColumn<String> taskReference = GeneratedColumn<String>(
    'task_reference',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  setupPayload =
      GeneratedColumn<String>(
        'setup_payload',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<Map<String, dynamic>?>(
        $ProjectEntriesTable.$convertersetupPayloadn,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectEntityId,
    kind,
    logicalKind,
    rootEntryId,
    correctionTargetId,
    relatedEntryId,
    setupRevisionId,
    orderingClaim,
    recordedAt,
    occurredAt,
    localDay,
    capturedOffsetMinutes,
    focus,
    expectedEvidence,
    observedResult,
    actualMinutes,
    blocker,
    lesson,
    nextStep,
    milestoneKey,
    taskReference,
    setupPayload,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProjectEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_entity_id')) {
      context.handle(
        _projectEntityIdMeta,
        projectEntityId.isAcceptableOrUnknown(
          data['project_entity_id']!,
          _projectEntityIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_projectEntityIdMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('logical_kind')) {
      context.handle(
        _logicalKindMeta,
        logicalKind.isAcceptableOrUnknown(
          data['logical_kind']!,
          _logicalKindMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_logicalKindMeta);
    }
    if (data.containsKey('root_entry_id')) {
      context.handle(
        _rootEntryIdMeta,
        rootEntryId.isAcceptableOrUnknown(
          data['root_entry_id']!,
          _rootEntryIdMeta,
        ),
      );
    }
    if (data.containsKey('correction_target_id')) {
      context.handle(
        _correctionTargetIdMeta,
        correctionTargetId.isAcceptableOrUnknown(
          data['correction_target_id']!,
          _correctionTargetIdMeta,
        ),
      );
    }
    if (data.containsKey('related_entry_id')) {
      context.handle(
        _relatedEntryIdMeta,
        relatedEntryId.isAcceptableOrUnknown(
          data['related_entry_id']!,
          _relatedEntryIdMeta,
        ),
      );
    }
    if (data.containsKey('setup_revision_id')) {
      context.handle(
        _setupRevisionIdMeta,
        setupRevisionId.isAcceptableOrUnknown(
          data['setup_revision_id']!,
          _setupRevisionIdMeta,
        ),
      );
    }
    if (data.containsKey('ordering_claim')) {
      context.handle(
        _orderingClaimMeta,
        orderingClaim.isAcceptableOrUnknown(
          data['ordering_claim']!,
          _orderingClaimMeta,
        ),
      );
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    }
    if (data.containsKey('local_day')) {
      context.handle(
        _localDayMeta,
        localDay.isAcceptableOrUnknown(data['local_day']!, _localDayMeta),
      );
    } else if (isInserting) {
      context.missing(_localDayMeta);
    }
    if (data.containsKey('captured_offset_minutes')) {
      context.handle(
        _capturedOffsetMinutesMeta,
        capturedOffsetMinutes.isAcceptableOrUnknown(
          data['captured_offset_minutes']!,
          _capturedOffsetMinutesMeta,
        ),
      );
    }
    if (data.containsKey('focus')) {
      context.handle(
        _focusMeta,
        focus.isAcceptableOrUnknown(data['focus']!, _focusMeta),
      );
    }
    if (data.containsKey('expected_evidence')) {
      context.handle(
        _expectedEvidenceMeta,
        expectedEvidence.isAcceptableOrUnknown(
          data['expected_evidence']!,
          _expectedEvidenceMeta,
        ),
      );
    }
    if (data.containsKey('observed_result')) {
      context.handle(
        _observedResultMeta,
        observedResult.isAcceptableOrUnknown(
          data['observed_result']!,
          _observedResultMeta,
        ),
      );
    }
    if (data.containsKey('actual_minutes')) {
      context.handle(
        _actualMinutesMeta,
        actualMinutes.isAcceptableOrUnknown(
          data['actual_minutes']!,
          _actualMinutesMeta,
        ),
      );
    }
    if (data.containsKey('blocker')) {
      context.handle(
        _blockerMeta,
        blocker.isAcceptableOrUnknown(data['blocker']!, _blockerMeta),
      );
    }
    if (data.containsKey('lesson')) {
      context.handle(
        _lessonMeta,
        lesson.isAcceptableOrUnknown(data['lesson']!, _lessonMeta),
      );
    }
    if (data.containsKey('next_step')) {
      context.handle(
        _nextStepMeta,
        nextStep.isAcceptableOrUnknown(data['next_step']!, _nextStepMeta),
      );
    }
    if (data.containsKey('milestone_key')) {
      context.handle(
        _milestoneKeyMeta,
        milestoneKey.isAcceptableOrUnknown(
          data['milestone_key']!,
          _milestoneKeyMeta,
        ),
      );
    }
    if (data.containsKey('task_reference')) {
      context.handle(
        _taskReferenceMeta,
        taskReference.isAcceptableOrUnknown(
          data['task_reference']!,
          _taskReferenceMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProjectEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectEntityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_entity_id'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      logicalKind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logical_kind'],
      )!,
      rootEntryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}root_entry_id'],
      ),
      correctionTargetId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}correction_target_id'],
      ),
      relatedEntryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_entry_id'],
      ),
      setupRevisionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}setup_revision_id'],
      ),
      orderingClaim: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ordering_claim'],
      ),
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_at'],
      ),
      localDay: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_day'],
      )!,
      capturedOffsetMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}captured_offset_minutes'],
      ),
      focus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}focus'],
      ),
      expectedEvidence: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expected_evidence'],
      ),
      observedResult: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}observed_result'],
      ),
      actualMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}actual_minutes'],
      ),
      blocker: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}blocker'],
      ),
      lesson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lesson'],
      ),
      nextStep: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}next_step'],
      ),
      milestoneKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}milestone_key'],
      ),
      taskReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}task_reference'],
      ),
      setupPayload: $ProjectEntriesTable.$convertersetupPayloadn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}setup_payload'],
        ),
      ),
    );
  }

  @override
  $ProjectEntriesTable createAlias(String alias) {
    return $ProjectEntriesTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $convertersetupPayload =
      const JsonMapConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $convertersetupPayloadn =
      NullAwareTypeConverter.wrap($convertersetupPayload);
}

class ProjectEntry extends DataClass implements Insertable<ProjectEntry> {
  final String id;
  final String projectEntityId;
  final String kind;
  final String logicalKind;
  final String? rootEntryId;
  final String? correctionTargetId;
  final String? relatedEntryId;
  final String? setupRevisionId;
  final String? orderingClaim;
  final DateTime recordedAt;
  final DateTime? occurredAt;
  final String localDay;
  final int? capturedOffsetMinutes;
  final String? focus;
  final String? expectedEvidence;
  final String? observedResult;
  final int? actualMinutes;
  final String? blocker;
  final String? lesson;
  final String? nextStep;
  final String? milestoneKey;
  final String? taskReference;
  final Map<String, dynamic>? setupPayload;
  const ProjectEntry({
    required this.id,
    required this.projectEntityId,
    required this.kind,
    required this.logicalKind,
    this.rootEntryId,
    this.correctionTargetId,
    this.relatedEntryId,
    this.setupRevisionId,
    this.orderingClaim,
    required this.recordedAt,
    this.occurredAt,
    required this.localDay,
    this.capturedOffsetMinutes,
    this.focus,
    this.expectedEvidence,
    this.observedResult,
    this.actualMinutes,
    this.blocker,
    this.lesson,
    this.nextStep,
    this.milestoneKey,
    this.taskReference,
    this.setupPayload,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_entity_id'] = Variable<String>(projectEntityId);
    map['kind'] = Variable<String>(kind);
    map['logical_kind'] = Variable<String>(logicalKind);
    if (!nullToAbsent || rootEntryId != null) {
      map['root_entry_id'] = Variable<String>(rootEntryId);
    }
    if (!nullToAbsent || correctionTargetId != null) {
      map['correction_target_id'] = Variable<String>(correctionTargetId);
    }
    if (!nullToAbsent || relatedEntryId != null) {
      map['related_entry_id'] = Variable<String>(relatedEntryId);
    }
    if (!nullToAbsent || setupRevisionId != null) {
      map['setup_revision_id'] = Variable<String>(setupRevisionId);
    }
    if (!nullToAbsent || orderingClaim != null) {
      map['ordering_claim'] = Variable<String>(orderingClaim);
    }
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    if (!nullToAbsent || occurredAt != null) {
      map['occurred_at'] = Variable<DateTime>(occurredAt);
    }
    map['local_day'] = Variable<String>(localDay);
    if (!nullToAbsent || capturedOffsetMinutes != null) {
      map['captured_offset_minutes'] = Variable<int>(capturedOffsetMinutes);
    }
    if (!nullToAbsent || focus != null) {
      map['focus'] = Variable<String>(focus);
    }
    if (!nullToAbsent || expectedEvidence != null) {
      map['expected_evidence'] = Variable<String>(expectedEvidence);
    }
    if (!nullToAbsent || observedResult != null) {
      map['observed_result'] = Variable<String>(observedResult);
    }
    if (!nullToAbsent || actualMinutes != null) {
      map['actual_minutes'] = Variable<int>(actualMinutes);
    }
    if (!nullToAbsent || blocker != null) {
      map['blocker'] = Variable<String>(blocker);
    }
    if (!nullToAbsent || lesson != null) {
      map['lesson'] = Variable<String>(lesson);
    }
    if (!nullToAbsent || nextStep != null) {
      map['next_step'] = Variable<String>(nextStep);
    }
    if (!nullToAbsent || milestoneKey != null) {
      map['milestone_key'] = Variable<String>(milestoneKey);
    }
    if (!nullToAbsent || taskReference != null) {
      map['task_reference'] = Variable<String>(taskReference);
    }
    if (!nullToAbsent || setupPayload != null) {
      map['setup_payload'] = Variable<String>(
        $ProjectEntriesTable.$convertersetupPayloadn.toSql(setupPayload),
      );
    }
    return map;
  }

  ProjectEntriesCompanion toCompanion(bool nullToAbsent) {
    return ProjectEntriesCompanion(
      id: Value(id),
      projectEntityId: Value(projectEntityId),
      kind: Value(kind),
      logicalKind: Value(logicalKind),
      rootEntryId: rootEntryId == null && nullToAbsent
          ? const Value.absent()
          : Value(rootEntryId),
      correctionTargetId: correctionTargetId == null && nullToAbsent
          ? const Value.absent()
          : Value(correctionTargetId),
      relatedEntryId: relatedEntryId == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedEntryId),
      setupRevisionId: setupRevisionId == null && nullToAbsent
          ? const Value.absent()
          : Value(setupRevisionId),
      orderingClaim: orderingClaim == null && nullToAbsent
          ? const Value.absent()
          : Value(orderingClaim),
      recordedAt: Value(recordedAt),
      occurredAt: occurredAt == null && nullToAbsent
          ? const Value.absent()
          : Value(occurredAt),
      localDay: Value(localDay),
      capturedOffsetMinutes: capturedOffsetMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(capturedOffsetMinutes),
      focus: focus == null && nullToAbsent
          ? const Value.absent()
          : Value(focus),
      expectedEvidence: expectedEvidence == null && nullToAbsent
          ? const Value.absent()
          : Value(expectedEvidence),
      observedResult: observedResult == null && nullToAbsent
          ? const Value.absent()
          : Value(observedResult),
      actualMinutes: actualMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(actualMinutes),
      blocker: blocker == null && nullToAbsent
          ? const Value.absent()
          : Value(blocker),
      lesson: lesson == null && nullToAbsent
          ? const Value.absent()
          : Value(lesson),
      nextStep: nextStep == null && nullToAbsent
          ? const Value.absent()
          : Value(nextStep),
      milestoneKey: milestoneKey == null && nullToAbsent
          ? const Value.absent()
          : Value(milestoneKey),
      taskReference: taskReference == null && nullToAbsent
          ? const Value.absent()
          : Value(taskReference),
      setupPayload: setupPayload == null && nullToAbsent
          ? const Value.absent()
          : Value(setupPayload),
    );
  }

  factory ProjectEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectEntry(
      id: serializer.fromJson<String>(json['id']),
      projectEntityId: serializer.fromJson<String>(json['projectEntityId']),
      kind: serializer.fromJson<String>(json['kind']),
      logicalKind: serializer.fromJson<String>(json['logicalKind']),
      rootEntryId: serializer.fromJson<String?>(json['rootEntryId']),
      correctionTargetId: serializer.fromJson<String?>(
        json['correctionTargetId'],
      ),
      relatedEntryId: serializer.fromJson<String?>(json['relatedEntryId']),
      setupRevisionId: serializer.fromJson<String?>(json['setupRevisionId']),
      orderingClaim: serializer.fromJson<String?>(json['orderingClaim']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      occurredAt: serializer.fromJson<DateTime?>(json['occurredAt']),
      localDay: serializer.fromJson<String>(json['localDay']),
      capturedOffsetMinutes: serializer.fromJson<int?>(
        json['capturedOffsetMinutes'],
      ),
      focus: serializer.fromJson<String?>(json['focus']),
      expectedEvidence: serializer.fromJson<String?>(json['expectedEvidence']),
      observedResult: serializer.fromJson<String?>(json['observedResult']),
      actualMinutes: serializer.fromJson<int?>(json['actualMinutes']),
      blocker: serializer.fromJson<String?>(json['blocker']),
      lesson: serializer.fromJson<String?>(json['lesson']),
      nextStep: serializer.fromJson<String?>(json['nextStep']),
      milestoneKey: serializer.fromJson<String?>(json['milestoneKey']),
      taskReference: serializer.fromJson<String?>(json['taskReference']),
      setupPayload: serializer.fromJson<Map<String, dynamic>?>(
        json['setupPayload'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectEntityId': serializer.toJson<String>(projectEntityId),
      'kind': serializer.toJson<String>(kind),
      'logicalKind': serializer.toJson<String>(logicalKind),
      'rootEntryId': serializer.toJson<String?>(rootEntryId),
      'correctionTargetId': serializer.toJson<String?>(correctionTargetId),
      'relatedEntryId': serializer.toJson<String?>(relatedEntryId),
      'setupRevisionId': serializer.toJson<String?>(setupRevisionId),
      'orderingClaim': serializer.toJson<String?>(orderingClaim),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'occurredAt': serializer.toJson<DateTime?>(occurredAt),
      'localDay': serializer.toJson<String>(localDay),
      'capturedOffsetMinutes': serializer.toJson<int?>(capturedOffsetMinutes),
      'focus': serializer.toJson<String?>(focus),
      'expectedEvidence': serializer.toJson<String?>(expectedEvidence),
      'observedResult': serializer.toJson<String?>(observedResult),
      'actualMinutes': serializer.toJson<int?>(actualMinutes),
      'blocker': serializer.toJson<String?>(blocker),
      'lesson': serializer.toJson<String?>(lesson),
      'nextStep': serializer.toJson<String?>(nextStep),
      'milestoneKey': serializer.toJson<String?>(milestoneKey),
      'taskReference': serializer.toJson<String?>(taskReference),
      'setupPayload': serializer.toJson<Map<String, dynamic>?>(setupPayload),
    };
  }

  ProjectEntry copyWith({
    String? id,
    String? projectEntityId,
    String? kind,
    String? logicalKind,
    Value<String?> rootEntryId = const Value.absent(),
    Value<String?> correctionTargetId = const Value.absent(),
    Value<String?> relatedEntryId = const Value.absent(),
    Value<String?> setupRevisionId = const Value.absent(),
    Value<String?> orderingClaim = const Value.absent(),
    DateTime? recordedAt,
    Value<DateTime?> occurredAt = const Value.absent(),
    String? localDay,
    Value<int?> capturedOffsetMinutes = const Value.absent(),
    Value<String?> focus = const Value.absent(),
    Value<String?> expectedEvidence = const Value.absent(),
    Value<String?> observedResult = const Value.absent(),
    Value<int?> actualMinutes = const Value.absent(),
    Value<String?> blocker = const Value.absent(),
    Value<String?> lesson = const Value.absent(),
    Value<String?> nextStep = const Value.absent(),
    Value<String?> milestoneKey = const Value.absent(),
    Value<String?> taskReference = const Value.absent(),
    Value<Map<String, dynamic>?> setupPayload = const Value.absent(),
  }) => ProjectEntry(
    id: id ?? this.id,
    projectEntityId: projectEntityId ?? this.projectEntityId,
    kind: kind ?? this.kind,
    logicalKind: logicalKind ?? this.logicalKind,
    rootEntryId: rootEntryId.present ? rootEntryId.value : this.rootEntryId,
    correctionTargetId: correctionTargetId.present
        ? correctionTargetId.value
        : this.correctionTargetId,
    relatedEntryId: relatedEntryId.present
        ? relatedEntryId.value
        : this.relatedEntryId,
    setupRevisionId: setupRevisionId.present
        ? setupRevisionId.value
        : this.setupRevisionId,
    orderingClaim: orderingClaim.present
        ? orderingClaim.value
        : this.orderingClaim,
    recordedAt: recordedAt ?? this.recordedAt,
    occurredAt: occurredAt.present ? occurredAt.value : this.occurredAt,
    localDay: localDay ?? this.localDay,
    capturedOffsetMinutes: capturedOffsetMinutes.present
        ? capturedOffsetMinutes.value
        : this.capturedOffsetMinutes,
    focus: focus.present ? focus.value : this.focus,
    expectedEvidence: expectedEvidence.present
        ? expectedEvidence.value
        : this.expectedEvidence,
    observedResult: observedResult.present
        ? observedResult.value
        : this.observedResult,
    actualMinutes: actualMinutes.present
        ? actualMinutes.value
        : this.actualMinutes,
    blocker: blocker.present ? blocker.value : this.blocker,
    lesson: lesson.present ? lesson.value : this.lesson,
    nextStep: nextStep.present ? nextStep.value : this.nextStep,
    milestoneKey: milestoneKey.present ? milestoneKey.value : this.milestoneKey,
    taskReference: taskReference.present
        ? taskReference.value
        : this.taskReference,
    setupPayload: setupPayload.present ? setupPayload.value : this.setupPayload,
  );
  ProjectEntry copyWithCompanion(ProjectEntriesCompanion data) {
    return ProjectEntry(
      id: data.id.present ? data.id.value : this.id,
      projectEntityId: data.projectEntityId.present
          ? data.projectEntityId.value
          : this.projectEntityId,
      kind: data.kind.present ? data.kind.value : this.kind,
      logicalKind: data.logicalKind.present
          ? data.logicalKind.value
          : this.logicalKind,
      rootEntryId: data.rootEntryId.present
          ? data.rootEntryId.value
          : this.rootEntryId,
      correctionTargetId: data.correctionTargetId.present
          ? data.correctionTargetId.value
          : this.correctionTargetId,
      relatedEntryId: data.relatedEntryId.present
          ? data.relatedEntryId.value
          : this.relatedEntryId,
      setupRevisionId: data.setupRevisionId.present
          ? data.setupRevisionId.value
          : this.setupRevisionId,
      orderingClaim: data.orderingClaim.present
          ? data.orderingClaim.value
          : this.orderingClaim,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
      occurredAt: data.occurredAt.present
          ? data.occurredAt.value
          : this.occurredAt,
      localDay: data.localDay.present ? data.localDay.value : this.localDay,
      capturedOffsetMinutes: data.capturedOffsetMinutes.present
          ? data.capturedOffsetMinutes.value
          : this.capturedOffsetMinutes,
      focus: data.focus.present ? data.focus.value : this.focus,
      expectedEvidence: data.expectedEvidence.present
          ? data.expectedEvidence.value
          : this.expectedEvidence,
      observedResult: data.observedResult.present
          ? data.observedResult.value
          : this.observedResult,
      actualMinutes: data.actualMinutes.present
          ? data.actualMinutes.value
          : this.actualMinutes,
      blocker: data.blocker.present ? data.blocker.value : this.blocker,
      lesson: data.lesson.present ? data.lesson.value : this.lesson,
      nextStep: data.nextStep.present ? data.nextStep.value : this.nextStep,
      milestoneKey: data.milestoneKey.present
          ? data.milestoneKey.value
          : this.milestoneKey,
      taskReference: data.taskReference.present
          ? data.taskReference.value
          : this.taskReference,
      setupPayload: data.setupPayload.present
          ? data.setupPayload.value
          : this.setupPayload,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEntry(')
          ..write('id: $id, ')
          ..write('projectEntityId: $projectEntityId, ')
          ..write('kind: $kind, ')
          ..write('logicalKind: $logicalKind, ')
          ..write('rootEntryId: $rootEntryId, ')
          ..write('correctionTargetId: $correctionTargetId, ')
          ..write('relatedEntryId: $relatedEntryId, ')
          ..write('setupRevisionId: $setupRevisionId, ')
          ..write('orderingClaim: $orderingClaim, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('localDay: $localDay, ')
          ..write('capturedOffsetMinutes: $capturedOffsetMinutes, ')
          ..write('focus: $focus, ')
          ..write('expectedEvidence: $expectedEvidence, ')
          ..write('observedResult: $observedResult, ')
          ..write('actualMinutes: $actualMinutes, ')
          ..write('blocker: $blocker, ')
          ..write('lesson: $lesson, ')
          ..write('nextStep: $nextStep, ')
          ..write('milestoneKey: $milestoneKey, ')
          ..write('taskReference: $taskReference, ')
          ..write('setupPayload: $setupPayload')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    projectEntityId,
    kind,
    logicalKind,
    rootEntryId,
    correctionTargetId,
    relatedEntryId,
    setupRevisionId,
    orderingClaim,
    recordedAt,
    occurredAt,
    localDay,
    capturedOffsetMinutes,
    focus,
    expectedEvidence,
    observedResult,
    actualMinutes,
    blocker,
    lesson,
    nextStep,
    milestoneKey,
    taskReference,
    setupPayload,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectEntry &&
          other.id == this.id &&
          other.projectEntityId == this.projectEntityId &&
          other.kind == this.kind &&
          other.logicalKind == this.logicalKind &&
          other.rootEntryId == this.rootEntryId &&
          other.correctionTargetId == this.correctionTargetId &&
          other.relatedEntryId == this.relatedEntryId &&
          other.setupRevisionId == this.setupRevisionId &&
          other.orderingClaim == this.orderingClaim &&
          other.recordedAt == this.recordedAt &&
          other.occurredAt == this.occurredAt &&
          other.localDay == this.localDay &&
          other.capturedOffsetMinutes == this.capturedOffsetMinutes &&
          other.focus == this.focus &&
          other.expectedEvidence == this.expectedEvidence &&
          other.observedResult == this.observedResult &&
          other.actualMinutes == this.actualMinutes &&
          other.blocker == this.blocker &&
          other.lesson == this.lesson &&
          other.nextStep == this.nextStep &&
          other.milestoneKey == this.milestoneKey &&
          other.taskReference == this.taskReference &&
          other.setupPayload == this.setupPayload);
}

class ProjectEntriesCompanion extends UpdateCompanion<ProjectEntry> {
  final Value<String> id;
  final Value<String> projectEntityId;
  final Value<String> kind;
  final Value<String> logicalKind;
  final Value<String?> rootEntryId;
  final Value<String?> correctionTargetId;
  final Value<String?> relatedEntryId;
  final Value<String?> setupRevisionId;
  final Value<String?> orderingClaim;
  final Value<DateTime> recordedAt;
  final Value<DateTime?> occurredAt;
  final Value<String> localDay;
  final Value<int?> capturedOffsetMinutes;
  final Value<String?> focus;
  final Value<String?> expectedEvidence;
  final Value<String?> observedResult;
  final Value<int?> actualMinutes;
  final Value<String?> blocker;
  final Value<String?> lesson;
  final Value<String?> nextStep;
  final Value<String?> milestoneKey;
  final Value<String?> taskReference;
  final Value<Map<String, dynamic>?> setupPayload;
  final Value<int> rowid;
  const ProjectEntriesCompanion({
    this.id = const Value.absent(),
    this.projectEntityId = const Value.absent(),
    this.kind = const Value.absent(),
    this.logicalKind = const Value.absent(),
    this.rootEntryId = const Value.absent(),
    this.correctionTargetId = const Value.absent(),
    this.relatedEntryId = const Value.absent(),
    this.setupRevisionId = const Value.absent(),
    this.orderingClaim = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.localDay = const Value.absent(),
    this.capturedOffsetMinutes = const Value.absent(),
    this.focus = const Value.absent(),
    this.expectedEvidence = const Value.absent(),
    this.observedResult = const Value.absent(),
    this.actualMinutes = const Value.absent(),
    this.blocker = const Value.absent(),
    this.lesson = const Value.absent(),
    this.nextStep = const Value.absent(),
    this.milestoneKey = const Value.absent(),
    this.taskReference = const Value.absent(),
    this.setupPayload = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectEntriesCompanion.insert({
    required String id,
    required String projectEntityId,
    required String kind,
    required String logicalKind,
    this.rootEntryId = const Value.absent(),
    this.correctionTargetId = const Value.absent(),
    this.relatedEntryId = const Value.absent(),
    this.setupRevisionId = const Value.absent(),
    this.orderingClaim = const Value.absent(),
    required DateTime recordedAt,
    this.occurredAt = const Value.absent(),
    required String localDay,
    this.capturedOffsetMinutes = const Value.absent(),
    this.focus = const Value.absent(),
    this.expectedEvidence = const Value.absent(),
    this.observedResult = const Value.absent(),
    this.actualMinutes = const Value.absent(),
    this.blocker = const Value.absent(),
    this.lesson = const Value.absent(),
    this.nextStep = const Value.absent(),
    this.milestoneKey = const Value.absent(),
    this.taskReference = const Value.absent(),
    this.setupPayload = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectEntityId = Value(projectEntityId),
       kind = Value(kind),
       logicalKind = Value(logicalKind),
       recordedAt = Value(recordedAt),
       localDay = Value(localDay);
  static Insertable<ProjectEntry> custom({
    Expression<String>? id,
    Expression<String>? projectEntityId,
    Expression<String>? kind,
    Expression<String>? logicalKind,
    Expression<String>? rootEntryId,
    Expression<String>? correctionTargetId,
    Expression<String>? relatedEntryId,
    Expression<String>? setupRevisionId,
    Expression<String>? orderingClaim,
    Expression<DateTime>? recordedAt,
    Expression<DateTime>? occurredAt,
    Expression<String>? localDay,
    Expression<int>? capturedOffsetMinutes,
    Expression<String>? focus,
    Expression<String>? expectedEvidence,
    Expression<String>? observedResult,
    Expression<int>? actualMinutes,
    Expression<String>? blocker,
    Expression<String>? lesson,
    Expression<String>? nextStep,
    Expression<String>? milestoneKey,
    Expression<String>? taskReference,
    Expression<String>? setupPayload,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectEntityId != null) 'project_entity_id': projectEntityId,
      if (kind != null) 'kind': kind,
      if (logicalKind != null) 'logical_kind': logicalKind,
      if (rootEntryId != null) 'root_entry_id': rootEntryId,
      if (correctionTargetId != null)
        'correction_target_id': correctionTargetId,
      if (relatedEntryId != null) 'related_entry_id': relatedEntryId,
      if (setupRevisionId != null) 'setup_revision_id': setupRevisionId,
      if (orderingClaim != null) 'ordering_claim': orderingClaim,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (localDay != null) 'local_day': localDay,
      if (capturedOffsetMinutes != null)
        'captured_offset_minutes': capturedOffsetMinutes,
      if (focus != null) 'focus': focus,
      if (expectedEvidence != null) 'expected_evidence': expectedEvidence,
      if (observedResult != null) 'observed_result': observedResult,
      if (actualMinutes != null) 'actual_minutes': actualMinutes,
      if (blocker != null) 'blocker': blocker,
      if (lesson != null) 'lesson': lesson,
      if (nextStep != null) 'next_step': nextStep,
      if (milestoneKey != null) 'milestone_key': milestoneKey,
      if (taskReference != null) 'task_reference': taskReference,
      if (setupPayload != null) 'setup_payload': setupPayload,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectEntriesCompanion copyWith({
    Value<String>? id,
    Value<String>? projectEntityId,
    Value<String>? kind,
    Value<String>? logicalKind,
    Value<String?>? rootEntryId,
    Value<String?>? correctionTargetId,
    Value<String?>? relatedEntryId,
    Value<String?>? setupRevisionId,
    Value<String?>? orderingClaim,
    Value<DateTime>? recordedAt,
    Value<DateTime?>? occurredAt,
    Value<String>? localDay,
    Value<int?>? capturedOffsetMinutes,
    Value<String?>? focus,
    Value<String?>? expectedEvidence,
    Value<String?>? observedResult,
    Value<int?>? actualMinutes,
    Value<String?>? blocker,
    Value<String?>? lesson,
    Value<String?>? nextStep,
    Value<String?>? milestoneKey,
    Value<String?>? taskReference,
    Value<Map<String, dynamic>?>? setupPayload,
    Value<int>? rowid,
  }) {
    return ProjectEntriesCompanion(
      id: id ?? this.id,
      projectEntityId: projectEntityId ?? this.projectEntityId,
      kind: kind ?? this.kind,
      logicalKind: logicalKind ?? this.logicalKind,
      rootEntryId: rootEntryId ?? this.rootEntryId,
      correctionTargetId: correctionTargetId ?? this.correctionTargetId,
      relatedEntryId: relatedEntryId ?? this.relatedEntryId,
      setupRevisionId: setupRevisionId ?? this.setupRevisionId,
      orderingClaim: orderingClaim ?? this.orderingClaim,
      recordedAt: recordedAt ?? this.recordedAt,
      occurredAt: occurredAt ?? this.occurredAt,
      localDay: localDay ?? this.localDay,
      capturedOffsetMinutes:
          capturedOffsetMinutes ?? this.capturedOffsetMinutes,
      focus: focus ?? this.focus,
      expectedEvidence: expectedEvidence ?? this.expectedEvidence,
      observedResult: observedResult ?? this.observedResult,
      actualMinutes: actualMinutes ?? this.actualMinutes,
      blocker: blocker ?? this.blocker,
      lesson: lesson ?? this.lesson,
      nextStep: nextStep ?? this.nextStep,
      milestoneKey: milestoneKey ?? this.milestoneKey,
      taskReference: taskReference ?? this.taskReference,
      setupPayload: setupPayload ?? this.setupPayload,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectEntityId.present) {
      map['project_entity_id'] = Variable<String>(projectEntityId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (logicalKind.present) {
      map['logical_kind'] = Variable<String>(logicalKind.value);
    }
    if (rootEntryId.present) {
      map['root_entry_id'] = Variable<String>(rootEntryId.value);
    }
    if (correctionTargetId.present) {
      map['correction_target_id'] = Variable<String>(correctionTargetId.value);
    }
    if (relatedEntryId.present) {
      map['related_entry_id'] = Variable<String>(relatedEntryId.value);
    }
    if (setupRevisionId.present) {
      map['setup_revision_id'] = Variable<String>(setupRevisionId.value);
    }
    if (orderingClaim.present) {
      map['ordering_claim'] = Variable<String>(orderingClaim.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (localDay.present) {
      map['local_day'] = Variable<String>(localDay.value);
    }
    if (capturedOffsetMinutes.present) {
      map['captured_offset_minutes'] = Variable<int>(
        capturedOffsetMinutes.value,
      );
    }
    if (focus.present) {
      map['focus'] = Variable<String>(focus.value);
    }
    if (expectedEvidence.present) {
      map['expected_evidence'] = Variable<String>(expectedEvidence.value);
    }
    if (observedResult.present) {
      map['observed_result'] = Variable<String>(observedResult.value);
    }
    if (actualMinutes.present) {
      map['actual_minutes'] = Variable<int>(actualMinutes.value);
    }
    if (blocker.present) {
      map['blocker'] = Variable<String>(blocker.value);
    }
    if (lesson.present) {
      map['lesson'] = Variable<String>(lesson.value);
    }
    if (nextStep.present) {
      map['next_step'] = Variable<String>(nextStep.value);
    }
    if (milestoneKey.present) {
      map['milestone_key'] = Variable<String>(milestoneKey.value);
    }
    if (taskReference.present) {
      map['task_reference'] = Variable<String>(taskReference.value);
    }
    if (setupPayload.present) {
      map['setup_payload'] = Variable<String>(
        $ProjectEntriesTable.$convertersetupPayloadn.toSql(setupPayload.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEntriesCompanion(')
          ..write('id: $id, ')
          ..write('projectEntityId: $projectEntityId, ')
          ..write('kind: $kind, ')
          ..write('logicalKind: $logicalKind, ')
          ..write('rootEntryId: $rootEntryId, ')
          ..write('correctionTargetId: $correctionTargetId, ')
          ..write('relatedEntryId: $relatedEntryId, ')
          ..write('setupRevisionId: $setupRevisionId, ')
          ..write('orderingClaim: $orderingClaim, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('localDay: $localDay, ')
          ..write('capturedOffsetMinutes: $capturedOffsetMinutes, ')
          ..write('focus: $focus, ')
          ..write('expectedEvidence: $expectedEvidence, ')
          ..write('observedResult: $observedResult, ')
          ..write('actualMinutes: $actualMinutes, ')
          ..write('blocker: $blocker, ')
          ..write('lesson: $lesson, ')
          ..write('nextStep: $nextStep, ')
          ..write('milestoneKey: $milestoneKey, ')
          ..write('taskReference: $taskReference, ')
          ..write('setupPayload: $setupPayload, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProjectEntryEvidenceTable extends ProjectEntryEvidence
    with TableInfo<$ProjectEntryEvidenceTable, ProjectEntryEvidenceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectEntryEvidenceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entryIdMeta = const VerificationMeta(
    'entryId',
  );
  @override
  late final GeneratedColumn<String> entryId = GeneratedColumn<String>(
    'entry_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES project_entries (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _referenceTextMeta = const VerificationMeta(
    'referenceText',
  );
  @override
  late final GeneratedColumn<String> referenceText = GeneratedColumn<String>(
    'reference_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _httpsUrlMeta = const VerificationMeta(
    'httpsUrl',
  );
  @override
  late final GeneratedColumn<String> httpsUrl = GeneratedColumn<String>(
    'https_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entryId,
    label,
    referenceText,
    httpsUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_entry_evidence';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProjectEntryEvidenceData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('entry_id')) {
      context.handle(
        _entryIdMeta,
        entryId.isAcceptableOrUnknown(data['entry_id']!, _entryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entryIdMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('reference_text')) {
      context.handle(
        _referenceTextMeta,
        referenceText.isAcceptableOrUnknown(
          data['reference_text']!,
          _referenceTextMeta,
        ),
      );
    }
    if (data.containsKey('https_url')) {
      context.handle(
        _httpsUrlMeta,
        httpsUrl.isAcceptableOrUnknown(data['https_url']!, _httpsUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProjectEntryEvidenceData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectEntryEvidenceData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      entryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entry_id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      referenceText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference_text'],
      ),
      httpsUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}https_url'],
      ),
    );
  }

  @override
  $ProjectEntryEvidenceTable createAlias(String alias) {
    return $ProjectEntryEvidenceTable(attachedDatabase, alias);
  }
}

class ProjectEntryEvidenceData extends DataClass
    implements Insertable<ProjectEntryEvidenceData> {
  final String id;
  final String entryId;
  final String label;
  final String? referenceText;
  final String? httpsUrl;
  const ProjectEntryEvidenceData({
    required this.id,
    required this.entryId,
    required this.label,
    this.referenceText,
    this.httpsUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['entry_id'] = Variable<String>(entryId);
    map['label'] = Variable<String>(label);
    if (!nullToAbsent || referenceText != null) {
      map['reference_text'] = Variable<String>(referenceText);
    }
    if (!nullToAbsent || httpsUrl != null) {
      map['https_url'] = Variable<String>(httpsUrl);
    }
    return map;
  }

  ProjectEntryEvidenceCompanion toCompanion(bool nullToAbsent) {
    return ProjectEntryEvidenceCompanion(
      id: Value(id),
      entryId: Value(entryId),
      label: Value(label),
      referenceText: referenceText == null && nullToAbsent
          ? const Value.absent()
          : Value(referenceText),
      httpsUrl: httpsUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(httpsUrl),
    );
  }

  factory ProjectEntryEvidenceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectEntryEvidenceData(
      id: serializer.fromJson<String>(json['id']),
      entryId: serializer.fromJson<String>(json['entryId']),
      label: serializer.fromJson<String>(json['label']),
      referenceText: serializer.fromJson<String?>(json['referenceText']),
      httpsUrl: serializer.fromJson<String?>(json['httpsUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'entryId': serializer.toJson<String>(entryId),
      'label': serializer.toJson<String>(label),
      'referenceText': serializer.toJson<String?>(referenceText),
      'httpsUrl': serializer.toJson<String?>(httpsUrl),
    };
  }

  ProjectEntryEvidenceData copyWith({
    String? id,
    String? entryId,
    String? label,
    Value<String?> referenceText = const Value.absent(),
    Value<String?> httpsUrl = const Value.absent(),
  }) => ProjectEntryEvidenceData(
    id: id ?? this.id,
    entryId: entryId ?? this.entryId,
    label: label ?? this.label,
    referenceText: referenceText.present
        ? referenceText.value
        : this.referenceText,
    httpsUrl: httpsUrl.present ? httpsUrl.value : this.httpsUrl,
  );
  ProjectEntryEvidenceData copyWithCompanion(
    ProjectEntryEvidenceCompanion data,
  ) {
    return ProjectEntryEvidenceData(
      id: data.id.present ? data.id.value : this.id,
      entryId: data.entryId.present ? data.entryId.value : this.entryId,
      label: data.label.present ? data.label.value : this.label,
      referenceText: data.referenceText.present
          ? data.referenceText.value
          : this.referenceText,
      httpsUrl: data.httpsUrl.present ? data.httpsUrl.value : this.httpsUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEntryEvidenceData(')
          ..write('id: $id, ')
          ..write('entryId: $entryId, ')
          ..write('label: $label, ')
          ..write('referenceText: $referenceText, ')
          ..write('httpsUrl: $httpsUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, entryId, label, referenceText, httpsUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectEntryEvidenceData &&
          other.id == this.id &&
          other.entryId == this.entryId &&
          other.label == this.label &&
          other.referenceText == this.referenceText &&
          other.httpsUrl == this.httpsUrl);
}

class ProjectEntryEvidenceCompanion
    extends UpdateCompanion<ProjectEntryEvidenceData> {
  final Value<String> id;
  final Value<String> entryId;
  final Value<String> label;
  final Value<String?> referenceText;
  final Value<String?> httpsUrl;
  final Value<int> rowid;
  const ProjectEntryEvidenceCompanion({
    this.id = const Value.absent(),
    this.entryId = const Value.absent(),
    this.label = const Value.absent(),
    this.referenceText = const Value.absent(),
    this.httpsUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectEntryEvidenceCompanion.insert({
    required String id,
    required String entryId,
    required String label,
    this.referenceText = const Value.absent(),
    this.httpsUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       entryId = Value(entryId),
       label = Value(label);
  static Insertable<ProjectEntryEvidenceData> custom({
    Expression<String>? id,
    Expression<String>? entryId,
    Expression<String>? label,
    Expression<String>? referenceText,
    Expression<String>? httpsUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entryId != null) 'entry_id': entryId,
      if (label != null) 'label': label,
      if (referenceText != null) 'reference_text': referenceText,
      if (httpsUrl != null) 'https_url': httpsUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectEntryEvidenceCompanion copyWith({
    Value<String>? id,
    Value<String>? entryId,
    Value<String>? label,
    Value<String?>? referenceText,
    Value<String?>? httpsUrl,
    Value<int>? rowid,
  }) {
    return ProjectEntryEvidenceCompanion(
      id: id ?? this.id,
      entryId: entryId ?? this.entryId,
      label: label ?? this.label,
      referenceText: referenceText ?? this.referenceText,
      httpsUrl: httpsUrl ?? this.httpsUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (entryId.present) {
      map['entry_id'] = Variable<String>(entryId.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (referenceText.present) {
      map['reference_text'] = Variable<String>(referenceText.value);
    }
    if (httpsUrl.present) {
      map['https_url'] = Variable<String>(httpsUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectEntryEvidenceCompanion(')
          ..write('id: $id, ')
          ..write('entryId: $entryId, ')
          ..write('label: $label, ')
          ..write('referenceText: $referenceText, ')
          ..write('httpsUrl: $httpsUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProjectReviewEntriesTable extends ProjectReviewEntries
    with TableInfo<$ProjectReviewEntriesTable, ProjectReviewEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectReviewEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _reviewIdMeta = const VerificationMeta(
    'reviewId',
  );
  @override
  late final GeneratedColumn<String> reviewId = GeneratedColumn<String>(
    'review_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES decision_reviews (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _entryIdMeta = const VerificationMeta(
    'entryId',
  );
  @override
  late final GeneratedColumn<String> entryId = GeneratedColumn<String>(
    'entry_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES project_entries (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [reviewId, entryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_review_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProjectReviewEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('review_id')) {
      context.handle(
        _reviewIdMeta,
        reviewId.isAcceptableOrUnknown(data['review_id']!, _reviewIdMeta),
      );
    } else if (isInserting) {
      context.missing(_reviewIdMeta);
    }
    if (data.containsKey('entry_id')) {
      context.handle(
        _entryIdMeta,
        entryId.isAcceptableOrUnknown(data['entry_id']!, _entryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {reviewId, entryId};
  @override
  ProjectReviewEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectReviewEntry(
      reviewId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}review_id'],
      )!,
      entryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entry_id'],
      )!,
    );
  }

  @override
  $ProjectReviewEntriesTable createAlias(String alias) {
    return $ProjectReviewEntriesTable(attachedDatabase, alias);
  }
}

class ProjectReviewEntry extends DataClass
    implements Insertable<ProjectReviewEntry> {
  final String reviewId;
  final String entryId;
  const ProjectReviewEntry({required this.reviewId, required this.entryId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['review_id'] = Variable<String>(reviewId);
    map['entry_id'] = Variable<String>(entryId);
    return map;
  }

  ProjectReviewEntriesCompanion toCompanion(bool nullToAbsent) {
    return ProjectReviewEntriesCompanion(
      reviewId: Value(reviewId),
      entryId: Value(entryId),
    );
  }

  factory ProjectReviewEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectReviewEntry(
      reviewId: serializer.fromJson<String>(json['reviewId']),
      entryId: serializer.fromJson<String>(json['entryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'reviewId': serializer.toJson<String>(reviewId),
      'entryId': serializer.toJson<String>(entryId),
    };
  }

  ProjectReviewEntry copyWith({String? reviewId, String? entryId}) =>
      ProjectReviewEntry(
        reviewId: reviewId ?? this.reviewId,
        entryId: entryId ?? this.entryId,
      );
  ProjectReviewEntry copyWithCompanion(ProjectReviewEntriesCompanion data) {
    return ProjectReviewEntry(
      reviewId: data.reviewId.present ? data.reviewId.value : this.reviewId,
      entryId: data.entryId.present ? data.entryId.value : this.entryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectReviewEntry(')
          ..write('reviewId: $reviewId, ')
          ..write('entryId: $entryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(reviewId, entryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectReviewEntry &&
          other.reviewId == this.reviewId &&
          other.entryId == this.entryId);
}

class ProjectReviewEntriesCompanion
    extends UpdateCompanion<ProjectReviewEntry> {
  final Value<String> reviewId;
  final Value<String> entryId;
  final Value<int> rowid;
  const ProjectReviewEntriesCompanion({
    this.reviewId = const Value.absent(),
    this.entryId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectReviewEntriesCompanion.insert({
    required String reviewId,
    required String entryId,
    this.rowid = const Value.absent(),
  }) : reviewId = Value(reviewId),
       entryId = Value(entryId);
  static Insertable<ProjectReviewEntry> custom({
    Expression<String>? reviewId,
    Expression<String>? entryId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (reviewId != null) 'review_id': reviewId,
      if (entryId != null) 'entry_id': entryId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectReviewEntriesCompanion copyWith({
    Value<String>? reviewId,
    Value<String>? entryId,
    Value<int>? rowid,
  }) {
    return ProjectReviewEntriesCompanion(
      reviewId: reviewId ?? this.reviewId,
      entryId: entryId ?? this.entryId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (reviewId.present) {
      map['review_id'] = Variable<String>(reviewId.value);
    }
    if (entryId.present) {
      map['entry_id'] = Variable<String>(entryId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectReviewEntriesCompanion(')
          ..write('reviewId: $reviewId, ')
          ..write('entryId: $entryId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DecisionsTable decisions = $DecisionsTable(this);
  late final $DecisionVersionsTable decisionVersions = $DecisionVersionsTable(
    this,
  );
  late final $AssumptionsTable assumptions = $AssumptionsTable(this);
  late final $DecisionRisksTable decisionRisks = $DecisionRisksTable(this);
  late final $EntitiesTable entities = $EntitiesTable(this);
  late final $DecisionAdviceTable decisionAdvice = $DecisionAdviceTable(this);
  late final $DecisionReviewsTable decisionReviews = $DecisionReviewsTable(
    this,
  );
  late final $GoalsTable goals = $GoalsTable(this);
  late final $GoalVersionsTable goalVersions = $GoalVersionsTable(this);
  late final $GoalCheckinsTable goalCheckins = $GoalCheckinsTable(this);
  late final $ReviewSchedulesTable reviewSchedules = $ReviewSchedulesTable(
    this,
  );
  late final $RelationsTable relations = $RelationsTable(this);
  late final $EventsTable events = $EventsTable(this);
  late final $ReflectionsTable reflections = $ReflectionsTable(this);
  late final $ProjectEntriesTable projectEntries = $ProjectEntriesTable(this);
  late final $ProjectEntryEvidenceTable projectEntryEvidence =
      $ProjectEntryEvidenceTable(this);
  late final $ProjectReviewEntriesTable projectReviewEntries =
      $ProjectReviewEntriesTable(this);
  late final DecisionsDao decisionsDao = DecisionsDao(this as AppDatabase);
  late final GoalsDao goalsDao = GoalsDao(this as AppDatabase);
  late final ReviewsDao reviewsDao = ReviewsDao(this as AppDatabase);
  late final SchedulesDao schedulesDao = SchedulesDao(this as AppDatabase);
  late final EntitiesDao entitiesDao = EntitiesDao(this as AppDatabase);
  late final ProjectsDao projectsDao = ProjectsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    decisions,
    decisionVersions,
    assumptions,
    decisionRisks,
    entities,
    decisionAdvice,
    decisionReviews,
    goals,
    goalVersions,
    goalCheckins,
    reviewSchedules,
    relations,
    events,
    reflections,
    projectEntries,
    projectEntryEvidence,
    projectReviewEntries,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'decisions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('decision_versions', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'decisions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('assumptions', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'decisions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('decision_risks', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'decisions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('decision_advice', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'decisions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('decision_reviews', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'goals',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('goal_versions', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'goals',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('goal_checkins', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'decisions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('review_schedules', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'goals',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('review_schedules', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'entities',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('project_entries', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'project_entries',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('project_entry_evidence', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'decision_reviews',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('project_review_entries', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'project_entries',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('project_review_entries', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$DecisionsTableCreateCompanionBuilder = DecisionsCompanion Function({
  required String id,
  required String title,
  required String type,
  Value<String> status,
  Value<DateTime?> decisionAt,
  Value<String?> context,
  Value<String?> objective,
  Value<String?> rationale,
  Value<String?> alternatives,
  Value<String?> constraints,
  Value<Map<String, dynamic>?> emotionalContext,
  Value<String?> expectedOutcome,
  Value<String?> successCriteria,
  Value<String?> failureConditions,
  Value<int?> confidence,
  Value<int?> importance,
  Value<int?> reversibility,
  Value<DateTime?> decideBy,
  Value<List<dynamic>?> openQuestions,
  Value<List<dynamic>?> tags,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$DecisionsTableUpdateCompanionBuilder = DecisionsCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String> type,
  Value<String> status,
  Value<DateTime?> decisionAt,
  Value<String?> context,
  Value<String?> objective,
  Value<String?> rationale,
  Value<String?> alternatives,
  Value<String?> constraints,
  Value<Map<String, dynamic>?> emotionalContext,
  Value<String?> expectedOutcome,
  Value<String?> successCriteria,
  Value<String?> failureConditions,
  Value<int?> confidence,
  Value<int?> importance,
  Value<int?> reversibility,
  Value<DateTime?> decideBy,
  Value<List<dynamic>?> openQuestions,
  Value<List<dynamic>?> tags,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$DecisionsTableReferences
    extends BaseReferences<_$AppDatabase, $DecisionsTable, Decision> {
  $$DecisionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DecisionVersionsTable, List<DecisionVersion>>
  _decisionVersionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.decisionVersions,
    aliasName: 'decisions__id__decision_versions__decision_id',
  );

  $$DecisionVersionsTableProcessedTableManager get decisionVersionsRefs {
    final manager = $$DecisionVersionsTableTableManager(
      $_db,
      $_db.decisionVersions,
    ).filter((f) => f.decisionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _decisionVersionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AssumptionsTable, List<Assumption>>
  _assumptionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.assumptions,
    aliasName: 'decisions__id__assumptions__decision_id',
  );

  $$AssumptionsTableProcessedTableManager get assumptionsRefs {
    final manager = $$AssumptionsTableTableManager(
      $_db,
      $_db.assumptions,
    ).filter((f) => f.decisionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_assumptionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DecisionRisksTable, List<DecisionRisk>>
  _decisionRisksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.decisionRisks,
    aliasName: 'decisions__id__decision_risks__decision_id',
  );

  $$DecisionRisksTableProcessedTableManager get decisionRisksRefs {
    final manager = $$DecisionRisksTableTableManager(
      $_db,
      $_db.decisionRisks,
    ).filter((f) => f.decisionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_decisionRisksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DecisionAdviceTable, List<DecisionAdviceData>>
  _decisionAdviceRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.decisionAdvice,
    aliasName: 'decisions__id__decision_advice__decision_id',
  );

  $$DecisionAdviceTableProcessedTableManager get decisionAdviceRefs {
    final manager = $$DecisionAdviceTableTableManager(
      $_db,
      $_db.decisionAdvice,
    ).filter((f) => f.decisionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_decisionAdviceRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DecisionReviewsTable, List<DecisionReview>>
  _decisionReviewsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.decisionReviews,
    aliasName: 'decisions__id__decision_reviews__decision_id',
  );

  $$DecisionReviewsTableProcessedTableManager get decisionReviewsRefs {
    final manager = $$DecisionReviewsTableTableManager(
      $_db,
      $_db.decisionReviews,
    ).filter((f) => f.decisionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _decisionReviewsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ReviewSchedulesTable, List<ReviewSchedule>>
  _reviewSchedulesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reviewSchedules,
    aliasName: 'decisions__id__review_schedules__decision_id',
  );

  $$ReviewSchedulesTableProcessedTableManager get reviewSchedulesRefs {
    final manager = $$ReviewSchedulesTableTableManager(
      $_db,
      $_db.reviewSchedules,
    ).filter((f) => f.decisionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _reviewSchedulesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DecisionsTableFilterComposer
    extends Composer<_$AppDatabase, $DecisionsTable> {
  $$DecisionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get decisionAt => $composableBuilder(
    column: $table.decisionAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get context => $composableBuilder(
    column: $table.context,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get objective => $composableBuilder(
    column: $table.objective,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rationale => $composableBuilder(
    column: $table.rationale,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get alternatives => $composableBuilder(
    column: $table.alternatives,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get constraints => $composableBuilder(
    column: $table.constraints,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, dynamic>?,
    Map<String, dynamic>,
    String
  >
  get emotionalContext => $composableBuilder(
    column: $table.emotionalContext,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get expectedOutcome => $composableBuilder(
    column: $table.expectedOutcome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get successCriteria => $composableBuilder(
    column: $table.successCriteria,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get failureConditions => $composableBuilder(
    column: $table.failureConditions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get importance => $composableBuilder(
    column: $table.importance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reversibility => $composableBuilder(
    column: $table.reversibility,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get decideBy => $composableBuilder(
    column: $table.decideBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<dynamic>?, List<dynamic>, String>
  get openQuestions => $composableBuilder(
    column: $table.openQuestions,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<dynamic>?, List<dynamic>, String>
  get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> decisionVersionsRefs(
    Expression<bool> Function($$DecisionVersionsTableFilterComposer f) f,
  ) {
    final $$DecisionVersionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.decisionVersions,
      getReferencedColumn: (t) => t.decisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionVersionsTableFilterComposer(
            $db: $db,
            $table: $db.decisionVersions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> assumptionsRefs(
    Expression<bool> Function($$AssumptionsTableFilterComposer f) f,
  ) {
    final $$AssumptionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.assumptions,
      getReferencedColumn: (t) => t.decisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssumptionsTableFilterComposer(
            $db: $db,
            $table: $db.assumptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> decisionRisksRefs(
    Expression<bool> Function($$DecisionRisksTableFilterComposer f) f,
  ) {
    final $$DecisionRisksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.decisionRisks,
      getReferencedColumn: (t) => t.decisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionRisksTableFilterComposer(
            $db: $db,
            $table: $db.decisionRisks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> decisionAdviceRefs(
    Expression<bool> Function($$DecisionAdviceTableFilterComposer f) f,
  ) {
    final $$DecisionAdviceTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.decisionAdvice,
      getReferencedColumn: (t) => t.decisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionAdviceTableFilterComposer(
            $db: $db,
            $table: $db.decisionAdvice,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> decisionReviewsRefs(
    Expression<bool> Function($$DecisionReviewsTableFilterComposer f) f,
  ) {
    final $$DecisionReviewsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.decisionReviews,
      getReferencedColumn: (t) => t.decisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionReviewsTableFilterComposer(
            $db: $db,
            $table: $db.decisionReviews,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> reviewSchedulesRefs(
    Expression<bool> Function($$ReviewSchedulesTableFilterComposer f) f,
  ) {
    final $$ReviewSchedulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reviewSchedules,
      getReferencedColumn: (t) => t.decisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewSchedulesTableFilterComposer(
            $db: $db,
            $table: $db.reviewSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DecisionsTableOrderingComposer
    extends Composer<_$AppDatabase, $DecisionsTable> {
  $$DecisionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get decisionAt => $composableBuilder(
    column: $table.decisionAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get context => $composableBuilder(
    column: $table.context,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get objective => $composableBuilder(
    column: $table.objective,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rationale => $composableBuilder(
    column: $table.rationale,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get alternatives => $composableBuilder(
    column: $table.alternatives,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get constraints => $composableBuilder(
    column: $table.constraints,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emotionalContext => $composableBuilder(
    column: $table.emotionalContext,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expectedOutcome => $composableBuilder(
    column: $table.expectedOutcome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get successCriteria => $composableBuilder(
    column: $table.successCriteria,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get failureConditions => $composableBuilder(
    column: $table.failureConditions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get importance => $composableBuilder(
    column: $table.importance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reversibility => $composableBuilder(
    column: $table.reversibility,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get decideBy => $composableBuilder(
    column: $table.decideBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get openQuestions => $composableBuilder(
    column: $table.openQuestions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DecisionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DecisionsTable> {
  $$DecisionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get decisionAt => $composableBuilder(
    column: $table.decisionAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get context =>
      $composableBuilder(column: $table.context, builder: (column) => column);

  GeneratedColumn<String> get objective =>
      $composableBuilder(column: $table.objective, builder: (column) => column);

  GeneratedColumn<String> get rationale =>
      $composableBuilder(column: $table.rationale, builder: (column) => column);

  GeneratedColumn<String> get alternatives => $composableBuilder(
    column: $table.alternatives,
    builder: (column) => column,
  );

  GeneratedColumn<String> get constraints => $composableBuilder(
    column: $table.constraints,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  get emotionalContext => $composableBuilder(
    column: $table.emotionalContext,
    builder: (column) => column,
  );

  GeneratedColumn<String> get expectedOutcome => $composableBuilder(
    column: $table.expectedOutcome,
    builder: (column) => column,
  );

  GeneratedColumn<String> get successCriteria => $composableBuilder(
    column: $table.successCriteria,
    builder: (column) => column,
  );

  GeneratedColumn<String> get failureConditions => $composableBuilder(
    column: $table.failureConditions,
    builder: (column) => column,
  );

  GeneratedColumn<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );

  GeneratedColumn<int> get importance => $composableBuilder(
    column: $table.importance,
    builder: (column) => column,
  );

  GeneratedColumn<int> get reversibility => $composableBuilder(
    column: $table.reversibility,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get decideBy =>
      $composableBuilder(column: $table.decideBy, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<dynamic>?, String> get openQuestions =>
      $composableBuilder(
        column: $table.openQuestions,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<List<dynamic>?, String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> decisionVersionsRefs<T extends Object>(
    Expression<T> Function($$DecisionVersionsTableAnnotationComposer a) f,
  ) {
    final $$DecisionVersionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.decisionVersions,
      getReferencedColumn: (t) => t.decisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionVersionsTableAnnotationComposer(
            $db: $db,
            $table: $db.decisionVersions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> assumptionsRefs<T extends Object>(
    Expression<T> Function($$AssumptionsTableAnnotationComposer a) f,
  ) {
    final $$AssumptionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.assumptions,
      getReferencedColumn: (t) => t.decisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssumptionsTableAnnotationComposer(
            $db: $db,
            $table: $db.assumptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> decisionRisksRefs<T extends Object>(
    Expression<T> Function($$DecisionRisksTableAnnotationComposer a) f,
  ) {
    final $$DecisionRisksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.decisionRisks,
      getReferencedColumn: (t) => t.decisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionRisksTableAnnotationComposer(
            $db: $db,
            $table: $db.decisionRisks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> decisionAdviceRefs<T extends Object>(
    Expression<T> Function($$DecisionAdviceTableAnnotationComposer a) f,
  ) {
    final $$DecisionAdviceTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.decisionAdvice,
      getReferencedColumn: (t) => t.decisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionAdviceTableAnnotationComposer(
            $db: $db,
            $table: $db.decisionAdvice,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> decisionReviewsRefs<T extends Object>(
    Expression<T> Function($$DecisionReviewsTableAnnotationComposer a) f,
  ) {
    final $$DecisionReviewsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.decisionReviews,
      getReferencedColumn: (t) => t.decisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionReviewsTableAnnotationComposer(
            $db: $db,
            $table: $db.decisionReviews,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> reviewSchedulesRefs<T extends Object>(
    Expression<T> Function($$ReviewSchedulesTableAnnotationComposer a) f,
  ) {
    final $$ReviewSchedulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reviewSchedules,
      getReferencedColumn: (t) => t.decisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewSchedulesTableAnnotationComposer(
            $db: $db,
            $table: $db.reviewSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DecisionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DecisionsTable,
          Decision,
          $$DecisionsTableFilterComposer,
          $$DecisionsTableOrderingComposer,
          $$DecisionsTableAnnotationComposer,
          $$DecisionsTableCreateCompanionBuilder,
          $$DecisionsTableUpdateCompanionBuilder,
          (Decision, $$DecisionsTableReferences),
          Decision,
          PrefetchHooks Function({
            bool decisionVersionsRefs,
            bool assumptionsRefs,
            bool decisionRisksRefs,
            bool decisionAdviceRefs,
            bool decisionReviewsRefs,
            bool reviewSchedulesRefs,
          })
        > {
  $$DecisionsTableTableManager(_$AppDatabase db, $DecisionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DecisionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DecisionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DecisionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> decisionAt = const Value.absent(),
                Value<String?> context = const Value.absent(),
                Value<String?> objective = const Value.absent(),
                Value<String?> rationale = const Value.absent(),
                Value<String?> alternatives = const Value.absent(),
                Value<String?> constraints = const Value.absent(),
                Value<Map<String, dynamic>?> emotionalContext =
                    const Value.absent(),
                Value<String?> expectedOutcome = const Value.absent(),
                Value<String?> successCriteria = const Value.absent(),
                Value<String?> failureConditions = const Value.absent(),
                Value<int?> confidence = const Value.absent(),
                Value<int?> importance = const Value.absent(),
                Value<int?> reversibility = const Value.absent(),
                Value<DateTime?> decideBy = const Value.absent(),
                Value<List<dynamic>?> openQuestions = const Value.absent(),
                Value<List<dynamic>?> tags = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DecisionsCompanion(
                id: id,
                title: title,
                type: type,
                status: status,
                decisionAt: decisionAt,
                context: context,
                objective: objective,
                rationale: rationale,
                alternatives: alternatives,
                constraints: constraints,
                emotionalContext: emotionalContext,
                expectedOutcome: expectedOutcome,
                successCriteria: successCriteria,
                failureConditions: failureConditions,
                confidence: confidence,
                importance: importance,
                reversibility: reversibility,
                decideBy: decideBy,
                openQuestions: openQuestions,
                tags: tags,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String type,
                Value<String> status = const Value.absent(),
                Value<DateTime?> decisionAt = const Value.absent(),
                Value<String?> context = const Value.absent(),
                Value<String?> objective = const Value.absent(),
                Value<String?> rationale = const Value.absent(),
                Value<String?> alternatives = const Value.absent(),
                Value<String?> constraints = const Value.absent(),
                Value<Map<String, dynamic>?> emotionalContext =
                    const Value.absent(),
                Value<String?> expectedOutcome = const Value.absent(),
                Value<String?> successCriteria = const Value.absent(),
                Value<String?> failureConditions = const Value.absent(),
                Value<int?> confidence = const Value.absent(),
                Value<int?> importance = const Value.absent(),
                Value<int?> reversibility = const Value.absent(),
                Value<DateTime?> decideBy = const Value.absent(),
                Value<List<dynamic>?> openQuestions = const Value.absent(),
                Value<List<dynamic>?> tags = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DecisionsCompanion.insert(
                id: id,
                title: title,
                type: type,
                status: status,
                decisionAt: decisionAt,
                context: context,
                objective: objective,
                rationale: rationale,
                alternatives: alternatives,
                constraints: constraints,
                emotionalContext: emotionalContext,
                expectedOutcome: expectedOutcome,
                successCriteria: successCriteria,
                failureConditions: failureConditions,
                confidence: confidence,
                importance: importance,
                reversibility: reversibility,
                decideBy: decideBy,
                openQuestions: openQuestions,
                tags: tags,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DecisionsTable, Decision>(table),
                  $$DecisionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                decisionVersionsRefs = false,
                assumptionsRefs = false,
                decisionRisksRefs = false,
                decisionAdviceRefs = false,
                decisionReviewsRefs = false,
                reviewSchedulesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (decisionVersionsRefs) db.decisionVersions,
                    if (assumptionsRefs) db.assumptions,
                    if (decisionRisksRefs) db.decisionRisks,
                    if (decisionAdviceRefs) db.decisionAdvice,
                    if (decisionReviewsRefs) db.decisionReviews,
                    if (reviewSchedulesRefs) db.reviewSchedules,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (decisionVersionsRefs)
                        await $_getPrefetchedData<
                          Decision,
                          $DecisionsTable,
                          DecisionVersion
                        >(
                          currentTable: table,
                          referencedTable: $$DecisionsTableReferences
                              ._decisionVersionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DecisionsTableReferences(
                                db,
                                table,
                                p0,
                              ).decisionVersionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.decisionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (assumptionsRefs)
                        await $_getPrefetchedData<
                          Decision,
                          $DecisionsTable,
                          Assumption
                        >(
                          currentTable: table,
                          referencedTable: $$DecisionsTableReferences
                              ._assumptionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DecisionsTableReferences(
                                db,
                                table,
                                p0,
                              ).assumptionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.decisionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (decisionRisksRefs)
                        await $_getPrefetchedData<
                          Decision,
                          $DecisionsTable,
                          DecisionRisk
                        >(
                          currentTable: table,
                          referencedTable: $$DecisionsTableReferences
                              ._decisionRisksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DecisionsTableReferences(
                                db,
                                table,
                                p0,
                              ).decisionRisksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.decisionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (decisionAdviceRefs)
                        await $_getPrefetchedData<
                          Decision,
                          $DecisionsTable,
                          DecisionAdviceData
                        >(
                          currentTable: table,
                          referencedTable: $$DecisionsTableReferences
                              ._decisionAdviceRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DecisionsTableReferences(
                                db,
                                table,
                                p0,
                              ).decisionAdviceRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.decisionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (decisionReviewsRefs)
                        await $_getPrefetchedData<
                          Decision,
                          $DecisionsTable,
                          DecisionReview
                        >(
                          currentTable: table,
                          referencedTable: $$DecisionsTableReferences
                              ._decisionReviewsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DecisionsTableReferences(
                                db,
                                table,
                                p0,
                              ).decisionReviewsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.decisionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (reviewSchedulesRefs)
                        await $_getPrefetchedData<
                          Decision,
                          $DecisionsTable,
                          ReviewSchedule
                        >(
                          currentTable: table,
                          referencedTable: $$DecisionsTableReferences
                              ._reviewSchedulesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DecisionsTableReferences(
                                db,
                                table,
                                p0,
                              ).reviewSchedulesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.decisionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DecisionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DecisionsTable,
      Decision,
      $$DecisionsTableFilterComposer,
      $$DecisionsTableOrderingComposer,
      $$DecisionsTableAnnotationComposer,
      $$DecisionsTableCreateCompanionBuilder,
      $$DecisionsTableUpdateCompanionBuilder,
      (Decision, $$DecisionsTableReferences),
      Decision,
      PrefetchHooks Function({
        bool decisionVersionsRefs,
        bool assumptionsRefs,
        bool decisionRisksRefs,
        bool decisionAdviceRefs,
        bool decisionReviewsRefs,
        bool reviewSchedulesRefs,
      })
    >;
typedef $$DecisionVersionsTableCreateCompanionBuilder =
    DecisionVersionsCompanion Function({
      required String id,
      required String decisionId,
      required int versionNo,
      required Map<String, dynamic> snapshot,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$DecisionVersionsTableUpdateCompanionBuilder =
    DecisionVersionsCompanion Function({
      Value<String> id,
      Value<String> decisionId,
      Value<int> versionNo,
      Value<Map<String, dynamic>> snapshot,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$DecisionVersionsTableReferences
    extends
        BaseReferences<_$AppDatabase, $DecisionVersionsTable, DecisionVersion> {
  $$DecisionVersionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DecisionsTable _decisionIdTable(_$AppDatabase db) =>
      db.decisions.createAlias('decision_versions__decision_id__decisions__id');

  $$DecisionsTableProcessedTableManager get decisionId {
    final $_column = $_itemColumn<String>('decision_id')!;

    final manager = $$DecisionsTableTableManager(
      $_db,
      $_db.decisions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_decisionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DecisionVersionsTableFilterComposer
    extends Composer<_$AppDatabase, $DecisionVersionsTable> {
  $$DecisionVersionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get versionNo => $composableBuilder(
    column: $table.versionNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, dynamic>,
    Map<String, dynamic>,
    String
  >
  get snapshot => $composableBuilder(
    column: $table.snapshot,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DecisionsTableFilterComposer get decisionId {
    final $$DecisionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableFilterComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DecisionVersionsTableOrderingComposer
    extends Composer<_$AppDatabase, $DecisionVersionsTable> {
  $$DecisionVersionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get versionNo => $composableBuilder(
    column: $table.versionNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get snapshot => $composableBuilder(
    column: $table.snapshot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DecisionsTableOrderingComposer get decisionId {
    final $$DecisionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableOrderingComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DecisionVersionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DecisionVersionsTable> {
  $$DecisionVersionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get versionNo =>
      $composableBuilder(column: $table.versionNo, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String> get snapshot =>
      $composableBuilder(column: $table.snapshot, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$DecisionsTableAnnotationComposer get decisionId {
    final $$DecisionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableAnnotationComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DecisionVersionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DecisionVersionsTable,
          DecisionVersion,
          $$DecisionVersionsTableFilterComposer,
          $$DecisionVersionsTableOrderingComposer,
          $$DecisionVersionsTableAnnotationComposer,
          $$DecisionVersionsTableCreateCompanionBuilder,
          $$DecisionVersionsTableUpdateCompanionBuilder,
          (DecisionVersion, $$DecisionVersionsTableReferences),
          DecisionVersion,
          PrefetchHooks Function({bool decisionId})
        > {
  $$DecisionVersionsTableTableManager(
    _$AppDatabase db,
    $DecisionVersionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DecisionVersionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DecisionVersionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DecisionVersionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> decisionId = const Value.absent(),
                Value<int> versionNo = const Value.absent(),
                Value<Map<String, dynamic>> snapshot = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DecisionVersionsCompanion(
                id: id,
                decisionId: decisionId,
                versionNo: versionNo,
                snapshot: snapshot,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String decisionId,
                required int versionNo,
                required Map<String, dynamic> snapshot,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DecisionVersionsCompanion.insert(
                id: id,
                decisionId: decisionId,
                versionNo: versionNo,
                snapshot: snapshot,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DecisionVersionsTable, DecisionVersion>(table),
                  $$DecisionVersionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({decisionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (decisionId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.decisionId,
                        referencedTable: $$DecisionVersionsTableReferences
                            ._decisionIdTable(db),
                        referencedColumn: $$DecisionVersionsTableReferences
                            ._decisionIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DecisionVersionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DecisionVersionsTable,
      DecisionVersion,
      $$DecisionVersionsTableFilterComposer,
      $$DecisionVersionsTableOrderingComposer,
      $$DecisionVersionsTableAnnotationComposer,
      $$DecisionVersionsTableCreateCompanionBuilder,
      $$DecisionVersionsTableUpdateCompanionBuilder,
      (DecisionVersion, $$DecisionVersionsTableReferences),
      DecisionVersion,
      PrefetchHooks Function({bool decisionId})
    >;
typedef $$AssumptionsTableCreateCompanionBuilder =
    AssumptionsCompanion Function({
      required String id,
      required String decisionId,
      required String statement,
      Value<int?> confidence,
      Value<String?> evidence,
      Value<DateTime?> expectedValidationDate,
      Value<String> validationStatus,
      Value<String?> actualResult,
      Value<int> rowid,
    });
typedef $$AssumptionsTableUpdateCompanionBuilder =
    AssumptionsCompanion Function({
      Value<String> id,
      Value<String> decisionId,
      Value<String> statement,
      Value<int?> confidence,
      Value<String?> evidence,
      Value<DateTime?> expectedValidationDate,
      Value<String> validationStatus,
      Value<String?> actualResult,
      Value<int> rowid,
    });

final class $$AssumptionsTableReferences
    extends BaseReferences<_$AppDatabase, $AssumptionsTable, Assumption> {
  $$AssumptionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DecisionsTable _decisionIdTable(_$AppDatabase db) =>
      db.decisions.createAlias('assumptions__decision_id__decisions__id');

  $$DecisionsTableProcessedTableManager get decisionId {
    final $_column = $_itemColumn<String>('decision_id')!;

    final manager = $$DecisionsTableTableManager(
      $_db,
      $_db.decisions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_decisionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DecisionRisksTable, List<DecisionRisk>>
  _decisionRisksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.decisionRisks,
    aliasName: 'assumptions__id__decision_risks__assumption_id',
  );

  $$DecisionRisksTableProcessedTableManager get decisionRisksRefs {
    final manager = $$DecisionRisksTableTableManager(
      $_db,
      $_db.decisionRisks,
    ).filter((f) => f.assumptionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_decisionRisksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AssumptionsTableFilterComposer
    extends Composer<_$AppDatabase, $AssumptionsTable> {
  $$AssumptionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statement => $composableBuilder(
    column: $table.statement,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get evidence => $composableBuilder(
    column: $table.evidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expectedValidationDate => $composableBuilder(
    column: $table.expectedValidationDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get validationStatus => $composableBuilder(
    column: $table.validationStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get actualResult => $composableBuilder(
    column: $table.actualResult,
    builder: (column) => ColumnFilters(column),
  );

  $$DecisionsTableFilterComposer get decisionId {
    final $$DecisionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableFilterComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> decisionRisksRefs(
    Expression<bool> Function($$DecisionRisksTableFilterComposer f) f,
  ) {
    final $$DecisionRisksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.decisionRisks,
      getReferencedColumn: (t) => t.assumptionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionRisksTableFilterComposer(
            $db: $db,
            $table: $db.decisionRisks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AssumptionsTableOrderingComposer
    extends Composer<_$AppDatabase, $AssumptionsTable> {
  $$AssumptionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statement => $composableBuilder(
    column: $table.statement,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get evidence => $composableBuilder(
    column: $table.evidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expectedValidationDate => $composableBuilder(
    column: $table.expectedValidationDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get validationStatus => $composableBuilder(
    column: $table.validationStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get actualResult => $composableBuilder(
    column: $table.actualResult,
    builder: (column) => ColumnOrderings(column),
  );

  $$DecisionsTableOrderingComposer get decisionId {
    final $$DecisionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableOrderingComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AssumptionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssumptionsTable> {
  $$AssumptionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get statement =>
      $composableBuilder(column: $table.statement, builder: (column) => column);

  GeneratedColumn<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );

  GeneratedColumn<String> get evidence =>
      $composableBuilder(column: $table.evidence, builder: (column) => column);

  GeneratedColumn<DateTime> get expectedValidationDate => $composableBuilder(
    column: $table.expectedValidationDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get validationStatus => $composableBuilder(
    column: $table.validationStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get actualResult => $composableBuilder(
    column: $table.actualResult,
    builder: (column) => column,
  );

  $$DecisionsTableAnnotationComposer get decisionId {
    final $$DecisionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableAnnotationComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> decisionRisksRefs<T extends Object>(
    Expression<T> Function($$DecisionRisksTableAnnotationComposer a) f,
  ) {
    final $$DecisionRisksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.decisionRisks,
      getReferencedColumn: (t) => t.assumptionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionRisksTableAnnotationComposer(
            $db: $db,
            $table: $db.decisionRisks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AssumptionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AssumptionsTable,
          Assumption,
          $$AssumptionsTableFilterComposer,
          $$AssumptionsTableOrderingComposer,
          $$AssumptionsTableAnnotationComposer,
          $$AssumptionsTableCreateCompanionBuilder,
          $$AssumptionsTableUpdateCompanionBuilder,
          (Assumption, $$AssumptionsTableReferences),
          Assumption,
          PrefetchHooks Function({bool decisionId, bool decisionRisksRefs})
        > {
  $$AssumptionsTableTableManager(_$AppDatabase db, $AssumptionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssumptionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssumptionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssumptionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> decisionId = const Value.absent(),
                Value<String> statement = const Value.absent(),
                Value<int?> confidence = const Value.absent(),
                Value<String?> evidence = const Value.absent(),
                Value<DateTime?> expectedValidationDate = const Value.absent(),
                Value<String> validationStatus = const Value.absent(),
                Value<String?> actualResult = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AssumptionsCompanion(
                id: id,
                decisionId: decisionId,
                statement: statement,
                confidence: confidence,
                evidence: evidence,
                expectedValidationDate: expectedValidationDate,
                validationStatus: validationStatus,
                actualResult: actualResult,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String decisionId,
                required String statement,
                Value<int?> confidence = const Value.absent(),
                Value<String?> evidence = const Value.absent(),
                Value<DateTime?> expectedValidationDate = const Value.absent(),
                Value<String> validationStatus = const Value.absent(),
                Value<String?> actualResult = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AssumptionsCompanion.insert(
                id: id,
                decisionId: decisionId,
                statement: statement,
                confidence: confidence,
                evidence: evidence,
                expectedValidationDate: expectedValidationDate,
                validationStatus: validationStatus,
                actualResult: actualResult,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AssumptionsTable, Assumption>(table),
                  $$AssumptionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({decisionId = false, decisionRisksRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (decisionRisksRefs) db.decisionRisks,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (decisionId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.decisionId,
                            referencedTable: $$AssumptionsTableReferences
                                ._decisionIdTable(db),
                            referencedColumn: $$AssumptionsTableReferences
                                ._decisionIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (decisionRisksRefs)
                        await $_getPrefetchedData<
                          Assumption,
                          $AssumptionsTable,
                          DecisionRisk
                        >(
                          currentTable: table,
                          referencedTable: $$AssumptionsTableReferences
                              ._decisionRisksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AssumptionsTableReferences(
                                db,
                                table,
                                p0,
                              ).decisionRisksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.assumptionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AssumptionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AssumptionsTable,
      Assumption,
      $$AssumptionsTableFilterComposer,
      $$AssumptionsTableOrderingComposer,
      $$AssumptionsTableAnnotationComposer,
      $$AssumptionsTableCreateCompanionBuilder,
      $$AssumptionsTableUpdateCompanionBuilder,
      (Assumption, $$AssumptionsTableReferences),
      Assumption,
      PrefetchHooks Function({bool decisionId, bool decisionRisksRefs})
    >;
typedef $$DecisionRisksTableCreateCompanionBuilder =
    DecisionRisksCompanion Function({
      required String id,
      required String decisionId,
      Value<String?> assumptionId,
      required String statement,
      Value<bool?> happened,
      Value<DateTime> notedAt,
      Value<int> rowid,
    });
typedef $$DecisionRisksTableUpdateCompanionBuilder =
    DecisionRisksCompanion Function({
      Value<String> id,
      Value<String> decisionId,
      Value<String?> assumptionId,
      Value<String> statement,
      Value<bool?> happened,
      Value<DateTime> notedAt,
      Value<int> rowid,
    });

final class $$DecisionRisksTableReferences
    extends BaseReferences<_$AppDatabase, $DecisionRisksTable, DecisionRisk> {
  $$DecisionRisksTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DecisionsTable _decisionIdTable(_$AppDatabase db) =>
      db.decisions.createAlias('decision_risks__decision_id__decisions__id');

  $$DecisionsTableProcessedTableManager get decisionId {
    final $_column = $_itemColumn<String>('decision_id')!;

    final manager = $$DecisionsTableTableManager(
      $_db,
      $_db.decisions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_decisionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AssumptionsTable _assumptionIdTable(_$AppDatabase db) => db
      .assumptions
      .createAlias('decision_risks__assumption_id__assumptions__id');

  $$AssumptionsTableProcessedTableManager? get assumptionId {
    final $_column = $_itemColumn<String>('assumption_id');
    if ($_column == null) return null;
    final manager = $$AssumptionsTableTableManager(
      $_db,
      $_db.assumptions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_assumptionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DecisionRisksTableFilterComposer
    extends Composer<_$AppDatabase, $DecisionRisksTable> {
  $$DecisionRisksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statement => $composableBuilder(
    column: $table.statement,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get happened => $composableBuilder(
    column: $table.happened,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get notedAt => $composableBuilder(
    column: $table.notedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DecisionsTableFilterComposer get decisionId {
    final $$DecisionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableFilterComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AssumptionsTableFilterComposer get assumptionId {
    final $$AssumptionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.assumptionId,
      referencedTable: $db.assumptions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssumptionsTableFilterComposer(
            $db: $db,
            $table: $db.assumptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DecisionRisksTableOrderingComposer
    extends Composer<_$AppDatabase, $DecisionRisksTable> {
  $$DecisionRisksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statement => $composableBuilder(
    column: $table.statement,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get happened => $composableBuilder(
    column: $table.happened,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get notedAt => $composableBuilder(
    column: $table.notedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DecisionsTableOrderingComposer get decisionId {
    final $$DecisionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableOrderingComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AssumptionsTableOrderingComposer get assumptionId {
    final $$AssumptionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.assumptionId,
      referencedTable: $db.assumptions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssumptionsTableOrderingComposer(
            $db: $db,
            $table: $db.assumptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DecisionRisksTableAnnotationComposer
    extends Composer<_$AppDatabase, $DecisionRisksTable> {
  $$DecisionRisksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get statement =>
      $composableBuilder(column: $table.statement, builder: (column) => column);

  GeneratedColumn<bool> get happened =>
      $composableBuilder(column: $table.happened, builder: (column) => column);

  GeneratedColumn<DateTime> get notedAt =>
      $composableBuilder(column: $table.notedAt, builder: (column) => column);

  $$DecisionsTableAnnotationComposer get decisionId {
    final $$DecisionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableAnnotationComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AssumptionsTableAnnotationComposer get assumptionId {
    final $$AssumptionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.assumptionId,
      referencedTable: $db.assumptions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssumptionsTableAnnotationComposer(
            $db: $db,
            $table: $db.assumptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DecisionRisksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DecisionRisksTable,
          DecisionRisk,
          $$DecisionRisksTableFilterComposer,
          $$DecisionRisksTableOrderingComposer,
          $$DecisionRisksTableAnnotationComposer,
          $$DecisionRisksTableCreateCompanionBuilder,
          $$DecisionRisksTableUpdateCompanionBuilder,
          (DecisionRisk, $$DecisionRisksTableReferences),
          DecisionRisk,
          PrefetchHooks Function({bool decisionId, bool assumptionId})
        > {
  $$DecisionRisksTableTableManager(_$AppDatabase db, $DecisionRisksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DecisionRisksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DecisionRisksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DecisionRisksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> decisionId = const Value.absent(),
                Value<String?> assumptionId = const Value.absent(),
                Value<String> statement = const Value.absent(),
                Value<bool?> happened = const Value.absent(),
                Value<DateTime> notedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DecisionRisksCompanion(
                id: id,
                decisionId: decisionId,
                assumptionId: assumptionId,
                statement: statement,
                happened: happened,
                notedAt: notedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String decisionId,
                Value<String?> assumptionId = const Value.absent(),
                required String statement,
                Value<bool?> happened = const Value.absent(),
                Value<DateTime> notedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DecisionRisksCompanion.insert(
                id: id,
                decisionId: decisionId,
                assumptionId: assumptionId,
                statement: statement,
                happened: happened,
                notedAt: notedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DecisionRisksTable, DecisionRisk>(table),
                  $$DecisionRisksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({decisionId = false, assumptionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (decisionId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.decisionId,
                        referencedTable: $$DecisionRisksTableReferences
                            ._decisionIdTable(db),
                        referencedColumn: $$DecisionRisksTableReferences
                            ._decisionIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (assumptionId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.assumptionId,
                        referencedTable: $$DecisionRisksTableReferences
                            ._assumptionIdTable(db),
                        referencedColumn: $$DecisionRisksTableReferences
                            ._assumptionIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DecisionRisksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DecisionRisksTable,
      DecisionRisk,
      $$DecisionRisksTableFilterComposer,
      $$DecisionRisksTableOrderingComposer,
      $$DecisionRisksTableAnnotationComposer,
      $$DecisionRisksTableCreateCompanionBuilder,
      $$DecisionRisksTableUpdateCompanionBuilder,
      (DecisionRisk, $$DecisionRisksTableReferences),
      DecisionRisk,
      PrefetchHooks Function({bool decisionId, bool assumptionId})
    >;
typedef $$EntitiesTableCreateCompanionBuilder = EntitiesCompanion Function({
  required String id,
  required String type,
  required String name,
  Value<Map<String, dynamic>?> metadata,
  Value<int> rowid,
});
typedef $$EntitiesTableUpdateCompanionBuilder = EntitiesCompanion Function({
  Value<String> id,
  Value<String> type,
  Value<String> name,
  Value<Map<String, dynamic>?> metadata,
  Value<int> rowid,
});

final class $$EntitiesTableReferences
    extends BaseReferences<_$AppDatabase, $EntitiesTable, Entity> {
  $$EntitiesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DecisionAdviceTable, List<DecisionAdviceData>>
  _decisionAdviceRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.decisionAdvice,
    aliasName: 'entities__id__decision_advice__entity_id',
  );

  $$DecisionAdviceTableProcessedTableManager get decisionAdviceRefs {
    final manager = $$DecisionAdviceTableTableManager(
      $_db,
      $_db.decisionAdvice,
    ).filter((f) => f.entityId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_decisionAdviceRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProjectEntriesTable, List<ProjectEntry>>
  _projectEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.projectEntries,
    aliasName: 'entities__id__project_entries__project_entity_id',
  );

  $$ProjectEntriesTableProcessedTableManager get projectEntriesRefs {
    final manager = $$ProjectEntriesTableTableManager($_db, $_db.projectEntries)
        .filter(
          (f) => f.projectEntityId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_projectEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EntitiesTableFilterComposer
    extends Composer<_$AppDatabase, $EntitiesTable> {
  $$EntitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, dynamic>?,
    Map<String, dynamic>,
    String
  >
  get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  Expression<bool> decisionAdviceRefs(
    Expression<bool> Function($$DecisionAdviceTableFilterComposer f) f,
  ) {
    final $$DecisionAdviceTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.decisionAdvice,
      getReferencedColumn: (t) => t.entityId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionAdviceTableFilterComposer(
            $db: $db,
            $table: $db.decisionAdvice,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> projectEntriesRefs(
    Expression<bool> Function($$ProjectEntriesTableFilterComposer f) f,
  ) {
    final $$ProjectEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projectEntries,
      getReferencedColumn: (t) => t.projectEntityId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectEntriesTableFilterComposer(
            $db: $db,
            $table: $db.projectEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EntitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $EntitiesTable> {
  $$EntitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EntitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $EntitiesTable> {
  $$EntitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);

  Expression<T> decisionAdviceRefs<T extends Object>(
    Expression<T> Function($$DecisionAdviceTableAnnotationComposer a) f,
  ) {
    final $$DecisionAdviceTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.decisionAdvice,
      getReferencedColumn: (t) => t.entityId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionAdviceTableAnnotationComposer(
            $db: $db,
            $table: $db.decisionAdvice,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> projectEntriesRefs<T extends Object>(
    Expression<T> Function($$ProjectEntriesTableAnnotationComposer a) f,
  ) {
    final $$ProjectEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projectEntries,
      getReferencedColumn: (t) => t.projectEntityId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.projectEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EntitiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EntitiesTable,
          Entity,
          $$EntitiesTableFilterComposer,
          $$EntitiesTableOrderingComposer,
          $$EntitiesTableAnnotationComposer,
          $$EntitiesTableCreateCompanionBuilder,
          $$EntitiesTableUpdateCompanionBuilder,
          (Entity, $$EntitiesTableReferences),
          Entity,
          PrefetchHooks Function({
            bool decisionAdviceRefs,
            bool projectEntriesRefs,
          })
        > {
  $$EntitiesTableTableManager(_$AppDatabase db, $EntitiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EntitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EntitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EntitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<Map<String, dynamic>?> metadata = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EntitiesCompanion(
                id: id,
                type: type,
                name: name,
                metadata: metadata,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String type,
                required String name,
                Value<Map<String, dynamic>?> metadata = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EntitiesCompanion.insert(
                id: id,
                type: type,
                name: name,
                metadata: metadata,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$EntitiesTable, Entity>(table),
                  $$EntitiesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({decisionAdviceRefs = false, projectEntriesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (decisionAdviceRefs) db.decisionAdvice,
                    if (projectEntriesRefs) db.projectEntries,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (decisionAdviceRefs)
                        await $_getPrefetchedData<
                          Entity,
                          $EntitiesTable,
                          DecisionAdviceData
                        >(
                          currentTable: table,
                          referencedTable: $$EntitiesTableReferences
                              ._decisionAdviceRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EntitiesTableReferences(
                                db,
                                table,
                                p0,
                              ).decisionAdviceRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.entityId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (projectEntriesRefs)
                        await $_getPrefetchedData<
                          Entity,
                          $EntitiesTable,
                          ProjectEntry
                        >(
                          currentTable: table,
                          referencedTable: $$EntitiesTableReferences
                              ._projectEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EntitiesTableReferences(
                                db,
                                table,
                                p0,
                              ).projectEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.projectEntityId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$EntitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EntitiesTable,
      Entity,
      $$EntitiesTableFilterComposer,
      $$EntitiesTableOrderingComposer,
      $$EntitiesTableAnnotationComposer,
      $$EntitiesTableCreateCompanionBuilder,
      $$EntitiesTableUpdateCompanionBuilder,
      (Entity, $$EntitiesTableReferences),
      Entity,
      PrefetchHooks Function({bool decisionAdviceRefs, bool projectEntriesRefs})
    >;
typedef $$DecisionAdviceTableCreateCompanionBuilder =
    DecisionAdviceCompanion Function({
      required String id,
      required String decisionId,
      required String entityId,
      required String adviceText,
      Value<DateTime> givenAt,
      Value<String?> heldUp,
      Value<int> rowid,
    });
typedef $$DecisionAdviceTableUpdateCompanionBuilder =
    DecisionAdviceCompanion Function({
      Value<String> id,
      Value<String> decisionId,
      Value<String> entityId,
      Value<String> adviceText,
      Value<DateTime> givenAt,
      Value<String?> heldUp,
      Value<int> rowid,
    });

final class $$DecisionAdviceTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DecisionAdviceTable,
          DecisionAdviceData
        > {
  $$DecisionAdviceTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DecisionsTable _decisionIdTable(_$AppDatabase db) =>
      db.decisions.createAlias('decision_advice__decision_id__decisions__id');

  $$DecisionsTableProcessedTableManager get decisionId {
    final $_column = $_itemColumn<String>('decision_id')!;

    final manager = $$DecisionsTableTableManager(
      $_db,
      $_db.decisions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_decisionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EntitiesTable _entityIdTable(_$AppDatabase db) =>
      db.entities.createAlias('decision_advice__entity_id__entities__id');

  $$EntitiesTableProcessedTableManager get entityId {
    final $_column = $_itemColumn<String>('entity_id')!;

    final manager = $$EntitiesTableTableManager(
      $_db,
      $_db.entities,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_entityIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DecisionAdviceTableFilterComposer
    extends Composer<_$AppDatabase, $DecisionAdviceTable> {
  $$DecisionAdviceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get adviceText => $composableBuilder(
    column: $table.adviceText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get givenAt => $composableBuilder(
    column: $table.givenAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get heldUp => $composableBuilder(
    column: $table.heldUp,
    builder: (column) => ColumnFilters(column),
  );

  $$DecisionsTableFilterComposer get decisionId {
    final $$DecisionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableFilterComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EntitiesTableFilterComposer get entityId {
    final $$EntitiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entityId,
      referencedTable: $db.entities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntitiesTableFilterComposer(
            $db: $db,
            $table: $db.entities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DecisionAdviceTableOrderingComposer
    extends Composer<_$AppDatabase, $DecisionAdviceTable> {
  $$DecisionAdviceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get adviceText => $composableBuilder(
    column: $table.adviceText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get givenAt => $composableBuilder(
    column: $table.givenAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get heldUp => $composableBuilder(
    column: $table.heldUp,
    builder: (column) => ColumnOrderings(column),
  );

  $$DecisionsTableOrderingComposer get decisionId {
    final $$DecisionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableOrderingComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EntitiesTableOrderingComposer get entityId {
    final $$EntitiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entityId,
      referencedTable: $db.entities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntitiesTableOrderingComposer(
            $db: $db,
            $table: $db.entities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DecisionAdviceTableAnnotationComposer
    extends Composer<_$AppDatabase, $DecisionAdviceTable> {
  $$DecisionAdviceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get adviceText => $composableBuilder(
    column: $table.adviceText,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get givenAt =>
      $composableBuilder(column: $table.givenAt, builder: (column) => column);

  GeneratedColumn<String> get heldUp =>
      $composableBuilder(column: $table.heldUp, builder: (column) => column);

  $$DecisionsTableAnnotationComposer get decisionId {
    final $$DecisionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableAnnotationComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EntitiesTableAnnotationComposer get entityId {
    final $$EntitiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entityId,
      referencedTable: $db.entities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntitiesTableAnnotationComposer(
            $db: $db,
            $table: $db.entities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DecisionAdviceTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DecisionAdviceTable,
          DecisionAdviceData,
          $$DecisionAdviceTableFilterComposer,
          $$DecisionAdviceTableOrderingComposer,
          $$DecisionAdviceTableAnnotationComposer,
          $$DecisionAdviceTableCreateCompanionBuilder,
          $$DecisionAdviceTableUpdateCompanionBuilder,
          (DecisionAdviceData, $$DecisionAdviceTableReferences),
          DecisionAdviceData,
          PrefetchHooks Function({bool decisionId, bool entityId})
        > {
  $$DecisionAdviceTableTableManager(
    _$AppDatabase db,
    $DecisionAdviceTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DecisionAdviceTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DecisionAdviceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DecisionAdviceTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> decisionId = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<String> adviceText = const Value.absent(),
                Value<DateTime> givenAt = const Value.absent(),
                Value<String?> heldUp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DecisionAdviceCompanion(
                id: id,
                decisionId: decisionId,
                entityId: entityId,
                adviceText: adviceText,
                givenAt: givenAt,
                heldUp: heldUp,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String decisionId,
                required String entityId,
                required String adviceText,
                Value<DateTime> givenAt = const Value.absent(),
                Value<String?> heldUp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DecisionAdviceCompanion.insert(
                id: id,
                decisionId: decisionId,
                entityId: entityId,
                adviceText: adviceText,
                givenAt: givenAt,
                heldUp: heldUp,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DecisionAdviceTable, DecisionAdviceData>(table),
                  $$DecisionAdviceTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({decisionId = false, entityId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (decisionId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.decisionId,
                        referencedTable: $$DecisionAdviceTableReferences
                            ._decisionIdTable(db),
                        referencedColumn: $$DecisionAdviceTableReferences
                            ._decisionIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (entityId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.entityId,
                        referencedTable: $$DecisionAdviceTableReferences
                            ._entityIdTable(db),
                        referencedColumn: $$DecisionAdviceTableReferences
                            ._entityIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DecisionAdviceTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DecisionAdviceTable,
      DecisionAdviceData,
      $$DecisionAdviceTableFilterComposer,
      $$DecisionAdviceTableOrderingComposer,
      $$DecisionAdviceTableAnnotationComposer,
      $$DecisionAdviceTableCreateCompanionBuilder,
      $$DecisionAdviceTableUpdateCompanionBuilder,
      (DecisionAdviceData, $$DecisionAdviceTableReferences),
      DecisionAdviceData,
      PrefetchHooks Function({bool decisionId, bool entityId})
    >;
typedef $$DecisionReviewsTableCreateCompanionBuilder =
    DecisionReviewsCompanion Function({
      required String id,
      required String decisionId,
      Value<DateTime> reviewedAt,
      Value<String?> whatActuallyHappened,
      Value<String?> expectedVsActual,
      Value<List<dynamic>?> assumptionsThatHeld,
      Value<List<dynamic>?> assumptionsThatFailed,
      Value<String?> unexpectedConsequences,
      Value<String?> currentView,
      Value<String?> lesson,
      Value<String?> action,
      Value<int?> satisfaction,
      Value<String?> regret,
      Value<String?> roadNotTaken,
      Value<String?> nextReview,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$DecisionReviewsTableUpdateCompanionBuilder =
    DecisionReviewsCompanion Function({
      Value<String> id,
      Value<String> decisionId,
      Value<DateTime> reviewedAt,
      Value<String?> whatActuallyHappened,
      Value<String?> expectedVsActual,
      Value<List<dynamic>?> assumptionsThatHeld,
      Value<List<dynamic>?> assumptionsThatFailed,
      Value<String?> unexpectedConsequences,
      Value<String?> currentView,
      Value<String?> lesson,
      Value<String?> action,
      Value<int?> satisfaction,
      Value<String?> regret,
      Value<String?> roadNotTaken,
      Value<String?> nextReview,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$DecisionReviewsTableReferences
    extends
        BaseReferences<_$AppDatabase, $DecisionReviewsTable, DecisionReview> {
  $$DecisionReviewsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DecisionsTable _decisionIdTable(_$AppDatabase db) =>
      db.decisions.createAlias('decision_reviews__decision_id__decisions__id');

  $$DecisionsTableProcessedTableManager get decisionId {
    final $_column = $_itemColumn<String>('decision_id')!;

    final manager = $$DecisionsTableTableManager(
      $_db,
      $_db.decisions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_decisionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $ProjectReviewEntriesTable,
    List<ProjectReviewEntry>
  >
  _projectReviewEntriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.projectReviewEntries,
        aliasName: 'decision_reviews__id__project_review_entries__review_id',
      );

  $$ProjectReviewEntriesTableProcessedTableManager
  get projectReviewEntriesRefs {
    final manager = $$ProjectReviewEntriesTableTableManager(
      $_db,
      $_db.projectReviewEntries,
    ).filter((f) => f.reviewId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _projectReviewEntriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DecisionReviewsTableFilterComposer
    extends Composer<_$AppDatabase, $DecisionReviewsTable> {
  $$DecisionReviewsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get reviewedAt => $composableBuilder(
    column: $table.reviewedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get whatActuallyHappened => $composableBuilder(
    column: $table.whatActuallyHappened,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expectedVsActual => $composableBuilder(
    column: $table.expectedVsActual,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<dynamic>?, List<dynamic>, String>
  get assumptionsThatHeld => $composableBuilder(
    column: $table.assumptionsThatHeld,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<dynamic>?, List<dynamic>, String>
  get assumptionsThatFailed => $composableBuilder(
    column: $table.assumptionsThatFailed,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get unexpectedConsequences => $composableBuilder(
    column: $table.unexpectedConsequences,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currentView => $composableBuilder(
    column: $table.currentView,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lesson => $composableBuilder(
    column: $table.lesson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get satisfaction => $composableBuilder(
    column: $table.satisfaction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get regret => $composableBuilder(
    column: $table.regret,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roadNotTaken => $composableBuilder(
    column: $table.roadNotTaken,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nextReview => $composableBuilder(
    column: $table.nextReview,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DecisionsTableFilterComposer get decisionId {
    final $$DecisionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableFilterComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> projectReviewEntriesRefs(
    Expression<bool> Function($$ProjectReviewEntriesTableFilterComposer f) f,
  ) {
    final $$ProjectReviewEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projectReviewEntries,
      getReferencedColumn: (t) => t.reviewId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectReviewEntriesTableFilterComposer(
            $db: $db,
            $table: $db.projectReviewEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DecisionReviewsTableOrderingComposer
    extends Composer<_$AppDatabase, $DecisionReviewsTable> {
  $$DecisionReviewsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get reviewedAt => $composableBuilder(
    column: $table.reviewedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get whatActuallyHappened => $composableBuilder(
    column: $table.whatActuallyHappened,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expectedVsActual => $composableBuilder(
    column: $table.expectedVsActual,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assumptionsThatHeld => $composableBuilder(
    column: $table.assumptionsThatHeld,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assumptionsThatFailed => $composableBuilder(
    column: $table.assumptionsThatFailed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unexpectedConsequences => $composableBuilder(
    column: $table.unexpectedConsequences,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currentView => $composableBuilder(
    column: $table.currentView,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lesson => $composableBuilder(
    column: $table.lesson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get satisfaction => $composableBuilder(
    column: $table.satisfaction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get regret => $composableBuilder(
    column: $table.regret,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roadNotTaken => $composableBuilder(
    column: $table.roadNotTaken,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nextReview => $composableBuilder(
    column: $table.nextReview,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DecisionsTableOrderingComposer get decisionId {
    final $$DecisionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableOrderingComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DecisionReviewsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DecisionReviewsTable> {
  $$DecisionReviewsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get reviewedAt => $composableBuilder(
    column: $table.reviewedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get whatActuallyHappened => $composableBuilder(
    column: $table.whatActuallyHappened,
    builder: (column) => column,
  );

  GeneratedColumn<String> get expectedVsActual => $composableBuilder(
    column: $table.expectedVsActual,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<dynamic>?, String>
  get assumptionsThatHeld => $composableBuilder(
    column: $table.assumptionsThatHeld,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<dynamic>?, String>
  get assumptionsThatFailed => $composableBuilder(
    column: $table.assumptionsThatFailed,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unexpectedConsequences => $composableBuilder(
    column: $table.unexpectedConsequences,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currentView => $composableBuilder(
    column: $table.currentView,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lesson =>
      $composableBuilder(column: $table.lesson, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<int> get satisfaction => $composableBuilder(
    column: $table.satisfaction,
    builder: (column) => column,
  );

  GeneratedColumn<String> get regret =>
      $composableBuilder(column: $table.regret, builder: (column) => column);

  GeneratedColumn<String> get roadNotTaken => $composableBuilder(
    column: $table.roadNotTaken,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nextReview => $composableBuilder(
    column: $table.nextReview,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$DecisionsTableAnnotationComposer get decisionId {
    final $$DecisionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableAnnotationComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> projectReviewEntriesRefs<T extends Object>(
    Expression<T> Function($$ProjectReviewEntriesTableAnnotationComposer a) f,
  ) {
    final $$ProjectReviewEntriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.projectReviewEntries,
          getReferencedColumn: (t) => t.reviewId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProjectReviewEntriesTableAnnotationComposer(
                $db: $db,
                $table: $db.projectReviewEntries,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$DecisionReviewsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DecisionReviewsTable,
          DecisionReview,
          $$DecisionReviewsTableFilterComposer,
          $$DecisionReviewsTableOrderingComposer,
          $$DecisionReviewsTableAnnotationComposer,
          $$DecisionReviewsTableCreateCompanionBuilder,
          $$DecisionReviewsTableUpdateCompanionBuilder,
          (DecisionReview, $$DecisionReviewsTableReferences),
          DecisionReview,
          PrefetchHooks Function({
            bool decisionId,
            bool projectReviewEntriesRefs,
          })
        > {
  $$DecisionReviewsTableTableManager(
    _$AppDatabase db,
    $DecisionReviewsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DecisionReviewsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DecisionReviewsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DecisionReviewsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> decisionId = const Value.absent(),
                Value<DateTime> reviewedAt = const Value.absent(),
                Value<String?> whatActuallyHappened = const Value.absent(),
                Value<String?> expectedVsActual = const Value.absent(),
                Value<List<dynamic>?> assumptionsThatHeld =
                    const Value.absent(),
                Value<List<dynamic>?> assumptionsThatFailed =
                    const Value.absent(),
                Value<String?> unexpectedConsequences = const Value.absent(),
                Value<String?> currentView = const Value.absent(),
                Value<String?> lesson = const Value.absent(),
                Value<String?> action = const Value.absent(),
                Value<int?> satisfaction = const Value.absent(),
                Value<String?> regret = const Value.absent(),
                Value<String?> roadNotTaken = const Value.absent(),
                Value<String?> nextReview = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DecisionReviewsCompanion(
                id: id,
                decisionId: decisionId,
                reviewedAt: reviewedAt,
                whatActuallyHappened: whatActuallyHappened,
                expectedVsActual: expectedVsActual,
                assumptionsThatHeld: assumptionsThatHeld,
                assumptionsThatFailed: assumptionsThatFailed,
                unexpectedConsequences: unexpectedConsequences,
                currentView: currentView,
                lesson: lesson,
                action: action,
                satisfaction: satisfaction,
                regret: regret,
                roadNotTaken: roadNotTaken,
                nextReview: nextReview,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String decisionId,
                Value<DateTime> reviewedAt = const Value.absent(),
                Value<String?> whatActuallyHappened = const Value.absent(),
                Value<String?> expectedVsActual = const Value.absent(),
                Value<List<dynamic>?> assumptionsThatHeld =
                    const Value.absent(),
                Value<List<dynamic>?> assumptionsThatFailed =
                    const Value.absent(),
                Value<String?> unexpectedConsequences = const Value.absent(),
                Value<String?> currentView = const Value.absent(),
                Value<String?> lesson = const Value.absent(),
                Value<String?> action = const Value.absent(),
                Value<int?> satisfaction = const Value.absent(),
                Value<String?> regret = const Value.absent(),
                Value<String?> roadNotTaken = const Value.absent(),
                Value<String?> nextReview = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DecisionReviewsCompanion.insert(
                id: id,
                decisionId: decisionId,
                reviewedAt: reviewedAt,
                whatActuallyHappened: whatActuallyHappened,
                expectedVsActual: expectedVsActual,
                assumptionsThatHeld: assumptionsThatHeld,
                assumptionsThatFailed: assumptionsThatFailed,
                unexpectedConsequences: unexpectedConsequences,
                currentView: currentView,
                lesson: lesson,
                action: action,
                satisfaction: satisfaction,
                regret: regret,
                roadNotTaken: roadNotTaken,
                nextReview: nextReview,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DecisionReviewsTable, DecisionReview>(table),
                  $$DecisionReviewsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({decisionId = false, projectReviewEntriesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (projectReviewEntriesRefs) db.projectReviewEntries,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (decisionId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.decisionId,
                            referencedTable: $$DecisionReviewsTableReferences
                                ._decisionIdTable(db),
                            referencedColumn: $$DecisionReviewsTableReferences
                                ._decisionIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (projectReviewEntriesRefs)
                        await $_getPrefetchedData<
                          DecisionReview,
                          $DecisionReviewsTable,
                          ProjectReviewEntry
                        >(
                          currentTable: table,
                          referencedTable: $$DecisionReviewsTableReferences
                              ._projectReviewEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DecisionReviewsTableReferences(
                                db,
                                table,
                                p0,
                              ).projectReviewEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.reviewId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DecisionReviewsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DecisionReviewsTable,
      DecisionReview,
      $$DecisionReviewsTableFilterComposer,
      $$DecisionReviewsTableOrderingComposer,
      $$DecisionReviewsTableAnnotationComposer,
      $$DecisionReviewsTableCreateCompanionBuilder,
      $$DecisionReviewsTableUpdateCompanionBuilder,
      (DecisionReview, $$DecisionReviewsTableReferences),
      DecisionReview,
      PrefetchHooks Function({bool decisionId, bool projectReviewEntriesRefs})
    >;
typedef $$GoalsTableCreateCompanionBuilder = GoalsCompanion Function({
  required String id,
  required String title,
  Value<String?> why,
  required String horizon,
  Value<DateTime?> targetDate,
  Value<String?> parentGoalId,
  Value<String> status,
  Value<bool> excludeFromAi,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$GoalsTableUpdateCompanionBuilder = GoalsCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String?> why,
  Value<String> horizon,
  Value<DateTime?> targetDate,
  Value<String?> parentGoalId,
  Value<String> status,
  Value<bool> excludeFromAi,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$GoalsTableReferences
    extends BaseReferences<_$AppDatabase, $GoalsTable, Goal> {
  $$GoalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GoalsTable _parentGoalIdTable(_$AppDatabase db) =>
      db.goals.createAlias('goals__parent_goal_id__goals__id');

  $$GoalsTableProcessedTableManager? get parentGoalId {
    final $_column = $_itemColumn<String>('parent_goal_id');
    if ($_column == null) return null;
    final manager = $$GoalsTableTableManager(
      $_db,
      $_db.goals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentGoalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$GoalVersionsTable, List<GoalVersion>>
  _goalVersionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.goalVersions,
    aliasName: 'goals__id__goal_versions__goal_id',
  );

  $$GoalVersionsTableProcessedTableManager get goalVersionsRefs {
    final manager = $$GoalVersionsTableTableManager(
      $_db,
      $_db.goalVersions,
    ).filter((f) => f.goalId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_goalVersionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$GoalCheckinsTable, List<GoalCheckin>>
  _goalCheckinsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.goalCheckins,
    aliasName: 'goals__id__goal_checkins__goal_id',
  );

  $$GoalCheckinsTableProcessedTableManager get goalCheckinsRefs {
    final manager = $$GoalCheckinsTableTableManager(
      $_db,
      $_db.goalCheckins,
    ).filter((f) => f.goalId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_goalCheckinsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ReviewSchedulesTable, List<ReviewSchedule>>
  _reviewSchedulesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reviewSchedules,
    aliasName: 'goals__id__review_schedules__goal_id',
  );

  $$ReviewSchedulesTableProcessedTableManager get reviewSchedulesRefs {
    final manager = $$ReviewSchedulesTableTableManager(
      $_db,
      $_db.reviewSchedules,
    ).filter((f) => f.goalId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _reviewSchedulesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GoalsTableFilterComposer extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get why => $composableBuilder(
    column: $table.why,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get horizon => $composableBuilder(
    column: $table.horizon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get excludeFromAi => $composableBuilder(
    column: $table.excludeFromAi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$GoalsTableFilterComposer get parentGoalId {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentGoalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableFilterComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> goalVersionsRefs(
    Expression<bool> Function($$GoalVersionsTableFilterComposer f) f,
  ) {
    final $$GoalVersionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.goalVersions,
      getReferencedColumn: (t) => t.goalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalVersionsTableFilterComposer(
            $db: $db,
            $table: $db.goalVersions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> goalCheckinsRefs(
    Expression<bool> Function($$GoalCheckinsTableFilterComposer f) f,
  ) {
    final $$GoalCheckinsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.goalCheckins,
      getReferencedColumn: (t) => t.goalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalCheckinsTableFilterComposer(
            $db: $db,
            $table: $db.goalCheckins,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> reviewSchedulesRefs(
    Expression<bool> Function($$ReviewSchedulesTableFilterComposer f) f,
  ) {
    final $$ReviewSchedulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reviewSchedules,
      getReferencedColumn: (t) => t.goalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewSchedulesTableFilterComposer(
            $db: $db,
            $table: $db.reviewSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get why => $composableBuilder(
    column: $table.why,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get horizon => $composableBuilder(
    column: $table.horizon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get excludeFromAi => $composableBuilder(
    column: $table.excludeFromAi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$GoalsTableOrderingComposer get parentGoalId {
    final $$GoalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentGoalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableOrderingComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get why =>
      $composableBuilder(column: $table.why, builder: (column) => column);

  GeneratedColumn<String> get horizon =>
      $composableBuilder(column: $table.horizon, builder: (column) => column);

  GeneratedColumn<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<bool> get excludeFromAi => $composableBuilder(
    column: $table.excludeFromAi,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$GoalsTableAnnotationComposer get parentGoalId {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentGoalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> goalVersionsRefs<T extends Object>(
    Expression<T> Function($$GoalVersionsTableAnnotationComposer a) f,
  ) {
    final $$GoalVersionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.goalVersions,
      getReferencedColumn: (t) => t.goalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalVersionsTableAnnotationComposer(
            $db: $db,
            $table: $db.goalVersions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> goalCheckinsRefs<T extends Object>(
    Expression<T> Function($$GoalCheckinsTableAnnotationComposer a) f,
  ) {
    final $$GoalCheckinsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.goalCheckins,
      getReferencedColumn: (t) => t.goalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalCheckinsTableAnnotationComposer(
            $db: $db,
            $table: $db.goalCheckins,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> reviewSchedulesRefs<T extends Object>(
    Expression<T> Function($$ReviewSchedulesTableAnnotationComposer a) f,
  ) {
    final $$ReviewSchedulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reviewSchedules,
      getReferencedColumn: (t) => t.goalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewSchedulesTableAnnotationComposer(
            $db: $db,
            $table: $db.reviewSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GoalsTable,
          Goal,
          $$GoalsTableFilterComposer,
          $$GoalsTableOrderingComposer,
          $$GoalsTableAnnotationComposer,
          $$GoalsTableCreateCompanionBuilder,
          $$GoalsTableUpdateCompanionBuilder,
          (Goal, $$GoalsTableReferences),
          Goal,
          PrefetchHooks Function({
            bool parentGoalId,
            bool goalVersionsRefs,
            bool goalCheckinsRefs,
            bool reviewSchedulesRefs,
          })
        > {
  $$GoalsTableTableManager(_$AppDatabase db, $GoalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> why = const Value.absent(),
                Value<String> horizon = const Value.absent(),
                Value<DateTime?> targetDate = const Value.absent(),
                Value<String?> parentGoalId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<bool> excludeFromAi = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GoalsCompanion(
                id: id,
                title: title,
                why: why,
                horizon: horizon,
                targetDate: targetDate,
                parentGoalId: parentGoalId,
                status: status,
                excludeFromAi: excludeFromAi,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String?> why = const Value.absent(),
                required String horizon,
                Value<DateTime?> targetDate = const Value.absent(),
                Value<String?> parentGoalId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<bool> excludeFromAi = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GoalsCompanion.insert(
                id: id,
                title: title,
                why: why,
                horizon: horizon,
                targetDate: targetDate,
                parentGoalId: parentGoalId,
                status: status,
                excludeFromAi: excludeFromAi,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$GoalsTable, Goal>(table),
                  $$GoalsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                parentGoalId = false,
                goalVersionsRefs = false,
                goalCheckinsRefs = false,
                reviewSchedulesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (goalVersionsRefs) db.goalVersions,
                    if (goalCheckinsRefs) db.goalCheckins,
                    if (reviewSchedulesRefs) db.reviewSchedules,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (parentGoalId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.parentGoalId,
                            referencedTable: $$GoalsTableReferences
                                ._parentGoalIdTable(db),
                            referencedColumn: $$GoalsTableReferences
                                ._parentGoalIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (goalVersionsRefs)
                        await $_getPrefetchedData<
                          Goal,
                          $GoalsTable,
                          GoalVersion
                        >(
                          currentTable: table,
                          referencedTable: $$GoalsTableReferences
                              ._goalVersionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GoalsTableReferences(
                                db,
                                table,
                                p0,
                              ).goalVersionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.goalId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (goalCheckinsRefs)
                        await $_getPrefetchedData<
                          Goal,
                          $GoalsTable,
                          GoalCheckin
                        >(
                          currentTable: table,
                          referencedTable: $$GoalsTableReferences
                              ._goalCheckinsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GoalsTableReferences(
                                db,
                                table,
                                p0,
                              ).goalCheckinsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.goalId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (reviewSchedulesRefs)
                        await $_getPrefetchedData<
                          Goal,
                          $GoalsTable,
                          ReviewSchedule
                        >(
                          currentTable: table,
                          referencedTable: $$GoalsTableReferences
                              ._reviewSchedulesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GoalsTableReferences(
                                db,
                                table,
                                p0,
                              ).reviewSchedulesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.goalId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$GoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GoalsTable,
      Goal,
      $$GoalsTableFilterComposer,
      $$GoalsTableOrderingComposer,
      $$GoalsTableAnnotationComposer,
      $$GoalsTableCreateCompanionBuilder,
      $$GoalsTableUpdateCompanionBuilder,
      (Goal, $$GoalsTableReferences),
      Goal,
      PrefetchHooks Function({
        bool parentGoalId,
        bool goalVersionsRefs,
        bool goalCheckinsRefs,
        bool reviewSchedulesRefs,
      })
    >;
typedef $$GoalVersionsTableCreateCompanionBuilder =
    GoalVersionsCompanion Function({
      required String id,
      required String goalId,
      required int versionNo,
      required Map<String, dynamic> snapshot,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$GoalVersionsTableUpdateCompanionBuilder =
    GoalVersionsCompanion Function({
      Value<String> id,
      Value<String> goalId,
      Value<int> versionNo,
      Value<Map<String, dynamic>> snapshot,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$GoalVersionsTableReferences
    extends BaseReferences<_$AppDatabase, $GoalVersionsTable, GoalVersion> {
  $$GoalVersionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GoalsTable _goalIdTable(_$AppDatabase db) =>
      db.goals.createAlias('goal_versions__goal_id__goals__id');

  $$GoalsTableProcessedTableManager get goalId {
    final $_column = $_itemColumn<String>('goal_id')!;

    final manager = $$GoalsTableTableManager(
      $_db,
      $_db.goals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_goalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GoalVersionsTableFilterComposer
    extends Composer<_$AppDatabase, $GoalVersionsTable> {
  $$GoalVersionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get versionNo => $composableBuilder(
    column: $table.versionNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, dynamic>,
    Map<String, dynamic>,
    String
  >
  get snapshot => $composableBuilder(
    column: $table.snapshot,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$GoalsTableFilterComposer get goalId {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableFilterComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalVersionsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalVersionsTable> {
  $$GoalVersionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get versionNo => $composableBuilder(
    column: $table.versionNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get snapshot => $composableBuilder(
    column: $table.snapshot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$GoalsTableOrderingComposer get goalId {
    final $$GoalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableOrderingComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalVersionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalVersionsTable> {
  $$GoalVersionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get versionNo =>
      $composableBuilder(column: $table.versionNo, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String> get snapshot =>
      $composableBuilder(column: $table.snapshot, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$GoalsTableAnnotationComposer get goalId {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalVersionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GoalVersionsTable,
          GoalVersion,
          $$GoalVersionsTableFilterComposer,
          $$GoalVersionsTableOrderingComposer,
          $$GoalVersionsTableAnnotationComposer,
          $$GoalVersionsTableCreateCompanionBuilder,
          $$GoalVersionsTableUpdateCompanionBuilder,
          (GoalVersion, $$GoalVersionsTableReferences),
          GoalVersion,
          PrefetchHooks Function({bool goalId})
        > {
  $$GoalVersionsTableTableManager(_$AppDatabase db, $GoalVersionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalVersionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalVersionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalVersionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> goalId = const Value.absent(),
                Value<int> versionNo = const Value.absent(),
                Value<Map<String, dynamic>> snapshot = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GoalVersionsCompanion(
                id: id,
                goalId: goalId,
                versionNo: versionNo,
                snapshot: snapshot,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String goalId,
                required int versionNo,
                required Map<String, dynamic> snapshot,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GoalVersionsCompanion.insert(
                id: id,
                goalId: goalId,
                versionNo: versionNo,
                snapshot: snapshot,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$GoalVersionsTable, GoalVersion>(table),
                  $$GoalVersionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({goalId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (goalId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.goalId,
                        referencedTable: $$GoalVersionsTableReferences
                            ._goalIdTable(db),
                        referencedColumn: $$GoalVersionsTableReferences
                            ._goalIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$GoalVersionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GoalVersionsTable,
      GoalVersion,
      $$GoalVersionsTableFilterComposer,
      $$GoalVersionsTableOrderingComposer,
      $$GoalVersionsTableAnnotationComposer,
      $$GoalVersionsTableCreateCompanionBuilder,
      $$GoalVersionsTableUpdateCompanionBuilder,
      (GoalVersion, $$GoalVersionsTableReferences),
      GoalVersion,
      PrefetchHooks Function({bool goalId})
    >;
typedef $$GoalCheckinsTableCreateCompanionBuilder =
    GoalCheckinsCompanion Function({
      required String id,
      required String goalId,
      Value<DateTime> checkedAt,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$GoalCheckinsTableUpdateCompanionBuilder =
    GoalCheckinsCompanion Function({
      Value<String> id,
      Value<String> goalId,
      Value<DateTime> checkedAt,
      Value<String?> notes,
      Value<int> rowid,
    });

final class $$GoalCheckinsTableReferences
    extends BaseReferences<_$AppDatabase, $GoalCheckinsTable, GoalCheckin> {
  $$GoalCheckinsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GoalsTable _goalIdTable(_$AppDatabase db) =>
      db.goals.createAlias('goal_checkins__goal_id__goals__id');

  $$GoalsTableProcessedTableManager get goalId {
    final $_column = $_itemColumn<String>('goal_id')!;

    final manager = $$GoalsTableTableManager(
      $_db,
      $_db.goals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_goalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GoalCheckinsTableFilterComposer
    extends Composer<_$AppDatabase, $GoalCheckinsTable> {
  $$GoalCheckinsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get checkedAt => $composableBuilder(
    column: $table.checkedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$GoalsTableFilterComposer get goalId {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableFilterComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalCheckinsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalCheckinsTable> {
  $$GoalCheckinsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get checkedAt => $composableBuilder(
    column: $table.checkedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$GoalsTableOrderingComposer get goalId {
    final $$GoalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableOrderingComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalCheckinsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalCheckinsTable> {
  $$GoalCheckinsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get checkedAt =>
      $composableBuilder(column: $table.checkedAt, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$GoalsTableAnnotationComposer get goalId {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalCheckinsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GoalCheckinsTable,
          GoalCheckin,
          $$GoalCheckinsTableFilterComposer,
          $$GoalCheckinsTableOrderingComposer,
          $$GoalCheckinsTableAnnotationComposer,
          $$GoalCheckinsTableCreateCompanionBuilder,
          $$GoalCheckinsTableUpdateCompanionBuilder,
          (GoalCheckin, $$GoalCheckinsTableReferences),
          GoalCheckin,
          PrefetchHooks Function({bool goalId})
        > {
  $$GoalCheckinsTableTableManager(_$AppDatabase db, $GoalCheckinsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalCheckinsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalCheckinsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalCheckinsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> goalId = const Value.absent(),
                Value<DateTime> checkedAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GoalCheckinsCompanion(
                id: id,
                goalId: goalId,
                checkedAt: checkedAt,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String goalId,
                Value<DateTime> checkedAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GoalCheckinsCompanion.insert(
                id: id,
                goalId: goalId,
                checkedAt: checkedAt,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$GoalCheckinsTable, GoalCheckin>(table),
                  $$GoalCheckinsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({goalId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (goalId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.goalId,
                        referencedTable: $$GoalCheckinsTableReferences
                            ._goalIdTable(db),
                        referencedColumn: $$GoalCheckinsTableReferences
                            ._goalIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$GoalCheckinsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GoalCheckinsTable,
      GoalCheckin,
      $$GoalCheckinsTableFilterComposer,
      $$GoalCheckinsTableOrderingComposer,
      $$GoalCheckinsTableAnnotationComposer,
      $$GoalCheckinsTableCreateCompanionBuilder,
      $$GoalCheckinsTableUpdateCompanionBuilder,
      (GoalCheckin, $$GoalCheckinsTableReferences),
      GoalCheckin,
      PrefetchHooks Function({bool goalId})
    >;
typedef $$ReviewSchedulesTableCreateCompanionBuilder =
    ReviewSchedulesCompanion Function({
      required String id,
      Value<String?> decisionId,
      Value<String?> goalId,
      required String triggerType,
      Value<Map<String, dynamic>?> triggerConfig,
      Value<String> kind,
      Value<DateTime?> nextDueAt,
      Value<DateTime?> lastCompletedAt,
      Value<DateTime?> snoozedUntil,
      Value<bool> active,
      Value<int> rowid,
    });
typedef $$ReviewSchedulesTableUpdateCompanionBuilder =
    ReviewSchedulesCompanion Function({
      Value<String> id,
      Value<String?> decisionId,
      Value<String?> goalId,
      Value<String> triggerType,
      Value<Map<String, dynamic>?> triggerConfig,
      Value<String> kind,
      Value<DateTime?> nextDueAt,
      Value<DateTime?> lastCompletedAt,
      Value<DateTime?> snoozedUntil,
      Value<bool> active,
      Value<int> rowid,
    });

final class $$ReviewSchedulesTableReferences
    extends
        BaseReferences<_$AppDatabase, $ReviewSchedulesTable, ReviewSchedule> {
  $$ReviewSchedulesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DecisionsTable _decisionIdTable(_$AppDatabase db) =>
      db.decisions.createAlias('review_schedules__decision_id__decisions__id');

  $$DecisionsTableProcessedTableManager? get decisionId {
    final $_column = $_itemColumn<String>('decision_id');
    if ($_column == null) return null;
    final manager = $$DecisionsTableTableManager(
      $_db,
      $_db.decisions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_decisionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $GoalsTable _goalIdTable(_$AppDatabase db) =>
      db.goals.createAlias('review_schedules__goal_id__goals__id');

  $$GoalsTableProcessedTableManager? get goalId {
    final $_column = $_itemColumn<String>('goal_id');
    if ($_column == null) return null;
    final manager = $$GoalsTableTableManager(
      $_db,
      $_db.goals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_goalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReviewSchedulesTableFilterComposer
    extends Composer<_$AppDatabase, $ReviewSchedulesTable> {
  $$ReviewSchedulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get triggerType => $composableBuilder(
    column: $table.triggerType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, dynamic>?,
    Map<String, dynamic>,
    String
  >
  get triggerConfig => $composableBuilder(
    column: $table.triggerConfig,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextDueAt => $composableBuilder(
    column: $table.nextDueAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastCompletedAt => $composableBuilder(
    column: $table.lastCompletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get snoozedUntil => $composableBuilder(
    column: $table.snoozedUntil,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  $$DecisionsTableFilterComposer get decisionId {
    final $$DecisionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableFilterComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GoalsTableFilterComposer get goalId {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableFilterComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReviewSchedulesTableOrderingComposer
    extends Composer<_$AppDatabase, $ReviewSchedulesTable> {
  $$ReviewSchedulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get triggerType => $composableBuilder(
    column: $table.triggerType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get triggerConfig => $composableBuilder(
    column: $table.triggerConfig,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextDueAt => $composableBuilder(
    column: $table.nextDueAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastCompletedAt => $composableBuilder(
    column: $table.lastCompletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get snoozedUntil => $composableBuilder(
    column: $table.snoozedUntil,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  $$DecisionsTableOrderingComposer get decisionId {
    final $$DecisionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableOrderingComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GoalsTableOrderingComposer get goalId {
    final $$GoalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableOrderingComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReviewSchedulesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReviewSchedulesTable> {
  $$ReviewSchedulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get triggerType => $composableBuilder(
    column: $table.triggerType,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  get triggerConfig => $composableBuilder(
    column: $table.triggerConfig,
    builder: (column) => column,
  );

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<DateTime> get nextDueAt =>
      $composableBuilder(column: $table.nextDueAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastCompletedAt => $composableBuilder(
    column: $table.lastCompletedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get snoozedUntil => $composableBuilder(
    column: $table.snoozedUntil,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  $$DecisionsTableAnnotationComposer get decisionId {
    final $$DecisionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.decisionId,
      referencedTable: $db.decisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionsTableAnnotationComposer(
            $db: $db,
            $table: $db.decisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GoalsTableAnnotationComposer get goalId {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReviewSchedulesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReviewSchedulesTable,
          ReviewSchedule,
          $$ReviewSchedulesTableFilterComposer,
          $$ReviewSchedulesTableOrderingComposer,
          $$ReviewSchedulesTableAnnotationComposer,
          $$ReviewSchedulesTableCreateCompanionBuilder,
          $$ReviewSchedulesTableUpdateCompanionBuilder,
          (ReviewSchedule, $$ReviewSchedulesTableReferences),
          ReviewSchedule,
          PrefetchHooks Function({bool decisionId, bool goalId})
        > {
  $$ReviewSchedulesTableTableManager(
    _$AppDatabase db,
    $ReviewSchedulesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReviewSchedulesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReviewSchedulesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReviewSchedulesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> decisionId = const Value.absent(),
                Value<String?> goalId = const Value.absent(),
                Value<String> triggerType = const Value.absent(),
                Value<Map<String, dynamic>?> triggerConfig =
                    const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<DateTime?> nextDueAt = const Value.absent(),
                Value<DateTime?> lastCompletedAt = const Value.absent(),
                Value<DateTime?> snoozedUntil = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReviewSchedulesCompanion(
                id: id,
                decisionId: decisionId,
                goalId: goalId,
                triggerType: triggerType,
                triggerConfig: triggerConfig,
                kind: kind,
                nextDueAt: nextDueAt,
                lastCompletedAt: lastCompletedAt,
                snoozedUntil: snoozedUntil,
                active: active,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> decisionId = const Value.absent(),
                Value<String?> goalId = const Value.absent(),
                required String triggerType,
                Value<Map<String, dynamic>?> triggerConfig =
                    const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<DateTime?> nextDueAt = const Value.absent(),
                Value<DateTime?> lastCompletedAt = const Value.absent(),
                Value<DateTime?> snoozedUntil = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReviewSchedulesCompanion.insert(
                id: id,
                decisionId: decisionId,
                goalId: goalId,
                triggerType: triggerType,
                triggerConfig: triggerConfig,
                kind: kind,
                nextDueAt: nextDueAt,
                lastCompletedAt: lastCompletedAt,
                snoozedUntil: snoozedUntil,
                active: active,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ReviewSchedulesTable, ReviewSchedule>(table),
                  $$ReviewSchedulesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({decisionId = false, goalId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (decisionId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.decisionId,
                        referencedTable: $$ReviewSchedulesTableReferences
                            ._decisionIdTable(db),
                        referencedColumn: $$ReviewSchedulesTableReferences
                            ._decisionIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (goalId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.goalId,
                        referencedTable: $$ReviewSchedulesTableReferences
                            ._goalIdTable(db),
                        referencedColumn: $$ReviewSchedulesTableReferences
                            ._goalIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ReviewSchedulesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReviewSchedulesTable,
      ReviewSchedule,
      $$ReviewSchedulesTableFilterComposer,
      $$ReviewSchedulesTableOrderingComposer,
      $$ReviewSchedulesTableAnnotationComposer,
      $$ReviewSchedulesTableCreateCompanionBuilder,
      $$ReviewSchedulesTableUpdateCompanionBuilder,
      (ReviewSchedule, $$ReviewSchedulesTableReferences),
      ReviewSchedule,
      PrefetchHooks Function({bool decisionId, bool goalId})
    >;
typedef $$RelationsTableCreateCompanionBuilder = RelationsCompanion Function({
  required String id,
  required String sourceType,
  required String sourceId,
  required String targetType,
  required String targetId,
  required String relationType,
  Value<Map<String, dynamic>?> metadata,
  Value<int> rowid,
});
typedef $$RelationsTableUpdateCompanionBuilder = RelationsCompanion Function({
  Value<String> id,
  Value<String> sourceType,
  Value<String> sourceId,
  Value<String> targetType,
  Value<String> targetId,
  Value<String> relationType,
  Value<Map<String, dynamic>?> metadata,
  Value<int> rowid,
});

class $$RelationsTableFilterComposer
    extends Composer<_$AppDatabase, $RelationsTable> {
  $$RelationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetType => $composableBuilder(
    column: $table.targetType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetId => $composableBuilder(
    column: $table.targetId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relationType => $composableBuilder(
    column: $table.relationType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, dynamic>?,
    Map<String, dynamic>,
    String
  >
  get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$RelationsTableOrderingComposer
    extends Composer<_$AppDatabase, $RelationsTable> {
  $$RelationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetType => $composableBuilder(
    column: $table.targetType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetId => $composableBuilder(
    column: $table.targetId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relationType => $composableBuilder(
    column: $table.relationType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RelationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RelationsTable> {
  $$RelationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<String> get targetType => $composableBuilder(
    column: $table.targetType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get targetId =>
      $composableBuilder(column: $table.targetId, builder: (column) => column);

  GeneratedColumn<String> get relationType => $composableBuilder(
    column: $table.relationType,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);
}

class $$RelationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RelationsTable,
          Relation,
          $$RelationsTableFilterComposer,
          $$RelationsTableOrderingComposer,
          $$RelationsTableAnnotationComposer,
          $$RelationsTableCreateCompanionBuilder,
          $$RelationsTableUpdateCompanionBuilder,
          (Relation, BaseReferences<_$AppDatabase, $RelationsTable, Relation>),
          Relation,
          PrefetchHooks Function()
        > {
  $$RelationsTableTableManager(_$AppDatabase db, $RelationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RelationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RelationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RelationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> sourceType = const Value.absent(),
                Value<String> sourceId = const Value.absent(),
                Value<String> targetType = const Value.absent(),
                Value<String> targetId = const Value.absent(),
                Value<String> relationType = const Value.absent(),
                Value<Map<String, dynamic>?> metadata = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RelationsCompanion(
                id: id,
                sourceType: sourceType,
                sourceId: sourceId,
                targetType: targetType,
                targetId: targetId,
                relationType: relationType,
                metadata: metadata,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String sourceType,
                required String sourceId,
                required String targetType,
                required String targetId,
                required String relationType,
                Value<Map<String, dynamic>?> metadata = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RelationsCompanion.insert(
                id: id,
                sourceType: sourceType,
                sourceId: sourceId,
                targetType: targetType,
                targetId: targetId,
                relationType: relationType,
                metadata: metadata,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RelationsTable, Relation>(table),
                  BaseReferences<_$AppDatabase, $RelationsTable, Relation>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RelationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RelationsTable,
      Relation,
      $$RelationsTableFilterComposer,
      $$RelationsTableOrderingComposer,
      $$RelationsTableAnnotationComposer,
      $$RelationsTableCreateCompanionBuilder,
      $$RelationsTableUpdateCompanionBuilder,
      (Relation, BaseReferences<_$AppDatabase, $RelationsTable, Relation>),
      Relation,
      PrefetchHooks Function()
    >;
typedef $$EventsTableCreateCompanionBuilder = EventsCompanion Function({
  required String id,
  required String title,
  Value<String?> type,
  Value<String?> description,
  required DateTime occurredAt,
  Value<List<dynamic>?> entityIds,
  Value<Map<String, dynamic>?> metadata,
  Value<int> rowid,
});
typedef $$EventsTableUpdateCompanionBuilder = EventsCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String?> type,
  Value<String?> description,
  Value<DateTime> occurredAt,
  Value<List<dynamic>?> entityIds,
  Value<Map<String, dynamic>?> metadata,
  Value<int> rowid,
});

class $$EventsTableFilterComposer
    extends Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<dynamic>?, List<dynamic>, String>
  get entityIds => $composableBuilder(
    column: $table.entityIds,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, dynamic>?,
    Map<String, dynamic>,
    String
  >
  get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$EventsTableOrderingComposer
    extends Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityIds => $composableBuilder(
    column: $table.entityIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<dynamic>?, String> get entityIds =>
      $composableBuilder(column: $table.entityIds, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);
}

class $$EventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventsTable,
          Event,
          $$EventsTableFilterComposer,
          $$EventsTableOrderingComposer,
          $$EventsTableAnnotationComposer,
          $$EventsTableCreateCompanionBuilder,
          $$EventsTableUpdateCompanionBuilder,
          (Event, BaseReferences<_$AppDatabase, $EventsTable, Event>),
          Event,
          PrefetchHooks Function()
        > {
  $$EventsTableTableManager(_$AppDatabase db, $EventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> occurredAt = const Value.absent(),
                Value<List<dynamic>?> entityIds = const Value.absent(),
                Value<Map<String, dynamic>?> metadata = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventsCompanion(
                id: id,
                title: title,
                type: type,
                description: description,
                occurredAt: occurredAt,
                entityIds: entityIds,
                metadata: metadata,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String?> type = const Value.absent(),
                Value<String?> description = const Value.absent(),
                required DateTime occurredAt,
                Value<List<dynamic>?> entityIds = const Value.absent(),
                Value<Map<String, dynamic>?> metadata = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventsCompanion.insert(
                id: id,
                title: title,
                type: type,
                description: description,
                occurredAt: occurredAt,
                entityIds: entityIds,
                metadata: metadata,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$EventsTable, Event>(table),
                  BaseReferences<_$AppDatabase, $EventsTable, Event>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventsTable,
      Event,
      $$EventsTableFilterComposer,
      $$EventsTableOrderingComposer,
      $$EventsTableAnnotationComposer,
      $$EventsTableCreateCompanionBuilder,
      $$EventsTableUpdateCompanionBuilder,
      (Event, BaseReferences<_$AppDatabase, $EventsTable, Event>),
      Event,
      PrefetchHooks Function()
    >;
typedef $$ReflectionsTableCreateCompanionBuilder =
    ReflectionsCompanion Function({
      required String id,
      required String periodType,
      required String periodLabel,
      required Map<String, dynamic> summary,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$ReflectionsTableUpdateCompanionBuilder =
    ReflectionsCompanion Function({
      Value<String> id,
      Value<String> periodType,
      Value<String> periodLabel,
      Value<Map<String, dynamic>> summary,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$ReflectionsTableFilterComposer
    extends Composer<_$AppDatabase, $ReflectionsTable> {
  $$ReflectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get periodType => $composableBuilder(
    column: $table.periodType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get periodLabel => $composableBuilder(
    column: $table.periodLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, dynamic>,
    Map<String, dynamic>,
    String
  >
  get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReflectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReflectionsTable> {
  $$ReflectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get periodType => $composableBuilder(
    column: $table.periodType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get periodLabel => $composableBuilder(
    column: $table.periodLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReflectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReflectionsTable> {
  $$ReflectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get periodType => $composableBuilder(
    column: $table.periodType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get periodLabel => $composableBuilder(
    column: $table.periodLabel,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ReflectionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReflectionsTable,
          Reflection,
          $$ReflectionsTableFilterComposer,
          $$ReflectionsTableOrderingComposer,
          $$ReflectionsTableAnnotationComposer,
          $$ReflectionsTableCreateCompanionBuilder,
          $$ReflectionsTableUpdateCompanionBuilder,
          (
            Reflection,
            BaseReferences<_$AppDatabase, $ReflectionsTable, Reflection>,
          ),
          Reflection,
          PrefetchHooks Function()
        > {
  $$ReflectionsTableTableManager(_$AppDatabase db, $ReflectionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReflectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReflectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReflectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> periodType = const Value.absent(),
                Value<String> periodLabel = const Value.absent(),
                Value<Map<String, dynamic>> summary = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReflectionsCompanion(
                id: id,
                periodType: periodType,
                periodLabel: periodLabel,
                summary: summary,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String periodType,
                required String periodLabel,
                required Map<String, dynamic> summary,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReflectionsCompanion.insert(
                id: id,
                periodType: periodType,
                periodLabel: periodLabel,
                summary: summary,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ReflectionsTable, Reflection>(table),
                  BaseReferences<_$AppDatabase, $ReflectionsTable, Reflection>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReflectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReflectionsTable,
      Reflection,
      $$ReflectionsTableFilterComposer,
      $$ReflectionsTableOrderingComposer,
      $$ReflectionsTableAnnotationComposer,
      $$ReflectionsTableCreateCompanionBuilder,
      $$ReflectionsTableUpdateCompanionBuilder,
      (
        Reflection,
        BaseReferences<_$AppDatabase, $ReflectionsTable, Reflection>,
      ),
      Reflection,
      PrefetchHooks Function()
    >;
typedef $$ProjectEntriesTableCreateCompanionBuilder =
    ProjectEntriesCompanion Function({
      required String id,
      required String projectEntityId,
      required String kind,
      required String logicalKind,
      Value<String?> rootEntryId,
      Value<String?> correctionTargetId,
      Value<String?> relatedEntryId,
      Value<String?> setupRevisionId,
      Value<String?> orderingClaim,
      required DateTime recordedAt,
      Value<DateTime?> occurredAt,
      required String localDay,
      Value<int?> capturedOffsetMinutes,
      Value<String?> focus,
      Value<String?> expectedEvidence,
      Value<String?> observedResult,
      Value<int?> actualMinutes,
      Value<String?> blocker,
      Value<String?> lesson,
      Value<String?> nextStep,
      Value<String?> milestoneKey,
      Value<String?> taskReference,
      Value<Map<String, dynamic>?> setupPayload,
      Value<int> rowid,
    });
typedef $$ProjectEntriesTableUpdateCompanionBuilder =
    ProjectEntriesCompanion Function({
      Value<String> id,
      Value<String> projectEntityId,
      Value<String> kind,
      Value<String> logicalKind,
      Value<String?> rootEntryId,
      Value<String?> correctionTargetId,
      Value<String?> relatedEntryId,
      Value<String?> setupRevisionId,
      Value<String?> orderingClaim,
      Value<DateTime> recordedAt,
      Value<DateTime?> occurredAt,
      Value<String> localDay,
      Value<int?> capturedOffsetMinutes,
      Value<String?> focus,
      Value<String?> expectedEvidence,
      Value<String?> observedResult,
      Value<int?> actualMinutes,
      Value<String?> blocker,
      Value<String?> lesson,
      Value<String?> nextStep,
      Value<String?> milestoneKey,
      Value<String?> taskReference,
      Value<Map<String, dynamic>?> setupPayload,
      Value<int> rowid,
    });

final class $$ProjectEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $ProjectEntriesTable, ProjectEntry> {
  $$ProjectEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $EntitiesTable _projectEntityIdTable(_$AppDatabase db) => db.entities
      .createAlias('project_entries__project_entity_id__entities__id');

  $$EntitiesTableProcessedTableManager get projectEntityId {
    final $_column = $_itemColumn<String>('project_entity_id')!;

    final manager = $$EntitiesTableTableManager(
      $_db,
      $_db.entities,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectEntityIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $ProjectEntryEvidenceTable,
    List<ProjectEntryEvidenceData>
  >
  _projectEntryEvidenceRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.projectEntryEvidence,
        aliasName: 'project_entries__id__project_entry_evidence__entry_id',
      );

  $$ProjectEntryEvidenceTableProcessedTableManager
  get projectEntryEvidenceRefs {
    final manager = $$ProjectEntryEvidenceTableTableManager(
      $_db,
      $_db.projectEntryEvidence,
    ).filter((f) => f.entryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _projectEntryEvidenceRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ProjectReviewEntriesTable,
    List<ProjectReviewEntry>
  >
  _projectReviewEntriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.projectReviewEntries,
        aliasName: 'project_entries__id__project_review_entries__entry_id',
      );

  $$ProjectReviewEntriesTableProcessedTableManager
  get projectReviewEntriesRefs {
    final manager = $$ProjectReviewEntriesTableTableManager(
      $_db,
      $_db.projectReviewEntries,
    ).filter((f) => f.entryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _projectReviewEntriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProjectEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectEntriesTable> {
  $$ProjectEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logicalKind => $composableBuilder(
    column: $table.logicalKind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rootEntryId => $composableBuilder(
    column: $table.rootEntryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get correctionTargetId => $composableBuilder(
    column: $table.correctionTargetId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relatedEntryId => $composableBuilder(
    column: $table.relatedEntryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get setupRevisionId => $composableBuilder(
    column: $table.setupRevisionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderingClaim => $composableBuilder(
    column: $table.orderingClaim,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localDay => $composableBuilder(
    column: $table.localDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get capturedOffsetMinutes => $composableBuilder(
    column: $table.capturedOffsetMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get focus => $composableBuilder(
    column: $table.focus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expectedEvidence => $composableBuilder(
    column: $table.expectedEvidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get observedResult => $composableBuilder(
    column: $table.observedResult,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actualMinutes => $composableBuilder(
    column: $table.actualMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get blocker => $composableBuilder(
    column: $table.blocker,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lesson => $composableBuilder(
    column: $table.lesson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nextStep => $composableBuilder(
    column: $table.nextStep,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get milestoneKey => $composableBuilder(
    column: $table.milestoneKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get taskReference => $composableBuilder(
    column: $table.taskReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, dynamic>?,
    Map<String, dynamic>,
    String
  >
  get setupPayload => $composableBuilder(
    column: $table.setupPayload,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  $$EntitiesTableFilterComposer get projectEntityId {
    final $$EntitiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectEntityId,
      referencedTable: $db.entities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntitiesTableFilterComposer(
            $db: $db,
            $table: $db.entities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> projectEntryEvidenceRefs(
    Expression<bool> Function($$ProjectEntryEvidenceTableFilterComposer f) f,
  ) {
    final $$ProjectEntryEvidenceTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projectEntryEvidence,
      getReferencedColumn: (t) => t.entryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectEntryEvidenceTableFilterComposer(
            $db: $db,
            $table: $db.projectEntryEvidence,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> projectReviewEntriesRefs(
    Expression<bool> Function($$ProjectReviewEntriesTableFilterComposer f) f,
  ) {
    final $$ProjectReviewEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projectReviewEntries,
      getReferencedColumn: (t) => t.entryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectReviewEntriesTableFilterComposer(
            $db: $db,
            $table: $db.projectReviewEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProjectEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectEntriesTable> {
  $$ProjectEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logicalKind => $composableBuilder(
    column: $table.logicalKind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rootEntryId => $composableBuilder(
    column: $table.rootEntryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get correctionTargetId => $composableBuilder(
    column: $table.correctionTargetId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relatedEntryId => $composableBuilder(
    column: $table.relatedEntryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get setupRevisionId => $composableBuilder(
    column: $table.setupRevisionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderingClaim => $composableBuilder(
    column: $table.orderingClaim,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localDay => $composableBuilder(
    column: $table.localDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get capturedOffsetMinutes => $composableBuilder(
    column: $table.capturedOffsetMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get focus => $composableBuilder(
    column: $table.focus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expectedEvidence => $composableBuilder(
    column: $table.expectedEvidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get observedResult => $composableBuilder(
    column: $table.observedResult,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actualMinutes => $composableBuilder(
    column: $table.actualMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get blocker => $composableBuilder(
    column: $table.blocker,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lesson => $composableBuilder(
    column: $table.lesson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nextStep => $composableBuilder(
    column: $table.nextStep,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get milestoneKey => $composableBuilder(
    column: $table.milestoneKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get taskReference => $composableBuilder(
    column: $table.taskReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get setupPayload => $composableBuilder(
    column: $table.setupPayload,
    builder: (column) => ColumnOrderings(column),
  );

  $$EntitiesTableOrderingComposer get projectEntityId {
    final $$EntitiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectEntityId,
      referencedTable: $db.entities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntitiesTableOrderingComposer(
            $db: $db,
            $table: $db.entities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProjectEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectEntriesTable> {
  $$ProjectEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get logicalKind => $composableBuilder(
    column: $table.logicalKind,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rootEntryId => $composableBuilder(
    column: $table.rootEntryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get correctionTargetId => $composableBuilder(
    column: $table.correctionTargetId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get relatedEntryId => $composableBuilder(
    column: $table.relatedEntryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get setupRevisionId => $composableBuilder(
    column: $table.setupRevisionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get orderingClaim => $composableBuilder(
    column: $table.orderingClaim,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get localDay =>
      $composableBuilder(column: $table.localDay, builder: (column) => column);

  GeneratedColumn<int> get capturedOffsetMinutes => $composableBuilder(
    column: $table.capturedOffsetMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get focus =>
      $composableBuilder(column: $table.focus, builder: (column) => column);

  GeneratedColumn<String> get expectedEvidence => $composableBuilder(
    column: $table.expectedEvidence,
    builder: (column) => column,
  );

  GeneratedColumn<String> get observedResult => $composableBuilder(
    column: $table.observedResult,
    builder: (column) => column,
  );

  GeneratedColumn<int> get actualMinutes => $composableBuilder(
    column: $table.actualMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get blocker =>
      $composableBuilder(column: $table.blocker, builder: (column) => column);

  GeneratedColumn<String> get lesson =>
      $composableBuilder(column: $table.lesson, builder: (column) => column);

  GeneratedColumn<String> get nextStep =>
      $composableBuilder(column: $table.nextStep, builder: (column) => column);

  GeneratedColumn<String> get milestoneKey => $composableBuilder(
    column: $table.milestoneKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get taskReference => $composableBuilder(
    column: $table.taskReference,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  get setupPayload => $composableBuilder(
    column: $table.setupPayload,
    builder: (column) => column,
  );

  $$EntitiesTableAnnotationComposer get projectEntityId {
    final $$EntitiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectEntityId,
      referencedTable: $db.entities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EntitiesTableAnnotationComposer(
            $db: $db,
            $table: $db.entities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> projectEntryEvidenceRefs<T extends Object>(
    Expression<T> Function($$ProjectEntryEvidenceTableAnnotationComposer a) f,
  ) {
    final $$ProjectEntryEvidenceTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.projectEntryEvidence,
          getReferencedColumn: (t) => t.entryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProjectEntryEvidenceTableAnnotationComposer(
                $db: $db,
                $table: $db.projectEntryEvidence,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> projectReviewEntriesRefs<T extends Object>(
    Expression<T> Function($$ProjectReviewEntriesTableAnnotationComposer a) f,
  ) {
    final $$ProjectReviewEntriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.projectReviewEntries,
          getReferencedColumn: (t) => t.entryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProjectReviewEntriesTableAnnotationComposer(
                $db: $db,
                $table: $db.projectReviewEntries,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProjectEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProjectEntriesTable,
          ProjectEntry,
          $$ProjectEntriesTableFilterComposer,
          $$ProjectEntriesTableOrderingComposer,
          $$ProjectEntriesTableAnnotationComposer,
          $$ProjectEntriesTableCreateCompanionBuilder,
          $$ProjectEntriesTableUpdateCompanionBuilder,
          (ProjectEntry, $$ProjectEntriesTableReferences),
          ProjectEntry,
          PrefetchHooks Function({
            bool projectEntityId,
            bool projectEntryEvidenceRefs,
            bool projectReviewEntriesRefs,
          })
        > {
  $$ProjectEntriesTableTableManager(
    _$AppDatabase db,
    $ProjectEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectEntityId = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> logicalKind = const Value.absent(),
                Value<String?> rootEntryId = const Value.absent(),
                Value<String?> correctionTargetId = const Value.absent(),
                Value<String?> relatedEntryId = const Value.absent(),
                Value<String?> setupRevisionId = const Value.absent(),
                Value<String?> orderingClaim = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
                Value<DateTime?> occurredAt = const Value.absent(),
                Value<String> localDay = const Value.absent(),
                Value<int?> capturedOffsetMinutes = const Value.absent(),
                Value<String?> focus = const Value.absent(),
                Value<String?> expectedEvidence = const Value.absent(),
                Value<String?> observedResult = const Value.absent(),
                Value<int?> actualMinutes = const Value.absent(),
                Value<String?> blocker = const Value.absent(),
                Value<String?> lesson = const Value.absent(),
                Value<String?> nextStep = const Value.absent(),
                Value<String?> milestoneKey = const Value.absent(),
                Value<String?> taskReference = const Value.absent(),
                Value<Map<String, dynamic>?> setupPayload =
                    const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectEntriesCompanion(
                id: id,
                projectEntityId: projectEntityId,
                kind: kind,
                logicalKind: logicalKind,
                rootEntryId: rootEntryId,
                correctionTargetId: correctionTargetId,
                relatedEntryId: relatedEntryId,
                setupRevisionId: setupRevisionId,
                orderingClaim: orderingClaim,
                recordedAt: recordedAt,
                occurredAt: occurredAt,
                localDay: localDay,
                capturedOffsetMinutes: capturedOffsetMinutes,
                focus: focus,
                expectedEvidence: expectedEvidence,
                observedResult: observedResult,
                actualMinutes: actualMinutes,
                blocker: blocker,
                lesson: lesson,
                nextStep: nextStep,
                milestoneKey: milestoneKey,
                taskReference: taskReference,
                setupPayload: setupPayload,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectEntityId,
                required String kind,
                required String logicalKind,
                Value<String?> rootEntryId = const Value.absent(),
                Value<String?> correctionTargetId = const Value.absent(),
                Value<String?> relatedEntryId = const Value.absent(),
                Value<String?> setupRevisionId = const Value.absent(),
                Value<String?> orderingClaim = const Value.absent(),
                required DateTime recordedAt,
                Value<DateTime?> occurredAt = const Value.absent(),
                required String localDay,
                Value<int?> capturedOffsetMinutes = const Value.absent(),
                Value<String?> focus = const Value.absent(),
                Value<String?> expectedEvidence = const Value.absent(),
                Value<String?> observedResult = const Value.absent(),
                Value<int?> actualMinutes = const Value.absent(),
                Value<String?> blocker = const Value.absent(),
                Value<String?> lesson = const Value.absent(),
                Value<String?> nextStep = const Value.absent(),
                Value<String?> milestoneKey = const Value.absent(),
                Value<String?> taskReference = const Value.absent(),
                Value<Map<String, dynamic>?> setupPayload =
                    const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectEntriesCompanion.insert(
                id: id,
                projectEntityId: projectEntityId,
                kind: kind,
                logicalKind: logicalKind,
                rootEntryId: rootEntryId,
                correctionTargetId: correctionTargetId,
                relatedEntryId: relatedEntryId,
                setupRevisionId: setupRevisionId,
                orderingClaim: orderingClaim,
                recordedAt: recordedAt,
                occurredAt: occurredAt,
                localDay: localDay,
                capturedOffsetMinutes: capturedOffsetMinutes,
                focus: focus,
                expectedEvidence: expectedEvidence,
                observedResult: observedResult,
                actualMinutes: actualMinutes,
                blocker: blocker,
                lesson: lesson,
                nextStep: nextStep,
                milestoneKey: milestoneKey,
                taskReference: taskReference,
                setupPayload: setupPayload,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProjectEntriesTable, ProjectEntry>(table),
                  $$ProjectEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                projectEntityId = false,
                projectEntryEvidenceRefs = false,
                projectReviewEntriesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (projectEntryEvidenceRefs) db.projectEntryEvidence,
                    if (projectReviewEntriesRefs) db.projectReviewEntries,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (projectEntityId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.projectEntityId,
                            referencedTable: $$ProjectEntriesTableReferences
                                ._projectEntityIdTable(db),
                            referencedColumn: $$ProjectEntriesTableReferences
                                ._projectEntityIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (projectEntryEvidenceRefs)
                        await $_getPrefetchedData<
                          ProjectEntry,
                          $ProjectEntriesTable,
                          ProjectEntryEvidenceData
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectEntriesTableReferences
                              ._projectEntryEvidenceRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectEntriesTableReferences(
                                db,
                                table,
                                p0,
                              ).projectEntryEvidenceRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.entryId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (projectReviewEntriesRefs)
                        await $_getPrefetchedData<
                          ProjectEntry,
                          $ProjectEntriesTable,
                          ProjectReviewEntry
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectEntriesTableReferences
                              ._projectReviewEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectEntriesTableReferences(
                                db,
                                table,
                                p0,
                              ).projectReviewEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.entryId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProjectEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProjectEntriesTable,
      ProjectEntry,
      $$ProjectEntriesTableFilterComposer,
      $$ProjectEntriesTableOrderingComposer,
      $$ProjectEntriesTableAnnotationComposer,
      $$ProjectEntriesTableCreateCompanionBuilder,
      $$ProjectEntriesTableUpdateCompanionBuilder,
      (ProjectEntry, $$ProjectEntriesTableReferences),
      ProjectEntry,
      PrefetchHooks Function({
        bool projectEntityId,
        bool projectEntryEvidenceRefs,
        bool projectReviewEntriesRefs,
      })
    >;
typedef $$ProjectEntryEvidenceTableCreateCompanionBuilder =
    ProjectEntryEvidenceCompanion Function({
      required String id,
      required String entryId,
      required String label,
      Value<String?> referenceText,
      Value<String?> httpsUrl,
      Value<int> rowid,
    });
typedef $$ProjectEntryEvidenceTableUpdateCompanionBuilder =
    ProjectEntryEvidenceCompanion Function({
      Value<String> id,
      Value<String> entryId,
      Value<String> label,
      Value<String?> referenceText,
      Value<String?> httpsUrl,
      Value<int> rowid,
    });

final class $$ProjectEntryEvidenceTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProjectEntryEvidenceTable,
          ProjectEntryEvidenceData
        > {
  $$ProjectEntryEvidenceTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProjectEntriesTable _entryIdTable(_$AppDatabase db) => db
      .projectEntries
      .createAlias('project_entry_evidence__entry_id__project_entries__id');

  $$ProjectEntriesTableProcessedTableManager get entryId {
    final $_column = $_itemColumn<String>('entry_id')!;

    final manager = $$ProjectEntriesTableTableManager(
      $_db,
      $_db.projectEntries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_entryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProjectEntryEvidenceTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectEntryEvidenceTable> {
  $$ProjectEntryEvidenceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get referenceText => $composableBuilder(
    column: $table.referenceText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get httpsUrl => $composableBuilder(
    column: $table.httpsUrl,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectEntriesTableFilterComposer get entryId {
    final $$ProjectEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entryId,
      referencedTable: $db.projectEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectEntriesTableFilterComposer(
            $db: $db,
            $table: $db.projectEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProjectEntryEvidenceTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectEntryEvidenceTable> {
  $$ProjectEntryEvidenceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get referenceText => $composableBuilder(
    column: $table.referenceText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get httpsUrl => $composableBuilder(
    column: $table.httpsUrl,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectEntriesTableOrderingComposer get entryId {
    final $$ProjectEntriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entryId,
      referencedTable: $db.projectEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectEntriesTableOrderingComposer(
            $db: $db,
            $table: $db.projectEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProjectEntryEvidenceTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectEntryEvidenceTable> {
  $$ProjectEntryEvidenceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get referenceText => $composableBuilder(
    column: $table.referenceText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get httpsUrl =>
      $composableBuilder(column: $table.httpsUrl, builder: (column) => column);

  $$ProjectEntriesTableAnnotationComposer get entryId {
    final $$ProjectEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entryId,
      referencedTable: $db.projectEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.projectEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProjectEntryEvidenceTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProjectEntryEvidenceTable,
          ProjectEntryEvidenceData,
          $$ProjectEntryEvidenceTableFilterComposer,
          $$ProjectEntryEvidenceTableOrderingComposer,
          $$ProjectEntryEvidenceTableAnnotationComposer,
          $$ProjectEntryEvidenceTableCreateCompanionBuilder,
          $$ProjectEntryEvidenceTableUpdateCompanionBuilder,
          (ProjectEntryEvidenceData, $$ProjectEntryEvidenceTableReferences),
          ProjectEntryEvidenceData,
          PrefetchHooks Function({bool entryId})
        > {
  $$ProjectEntryEvidenceTableTableManager(
    _$AppDatabase db,
    $ProjectEntryEvidenceTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectEntryEvidenceTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectEntryEvidenceTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ProjectEntryEvidenceTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> entryId = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<String?> referenceText = const Value.absent(),
                Value<String?> httpsUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectEntryEvidenceCompanion(
                id: id,
                entryId: entryId,
                label: label,
                referenceText: referenceText,
                httpsUrl: httpsUrl,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String entryId,
                required String label,
                Value<String?> referenceText = const Value.absent(),
                Value<String?> httpsUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectEntryEvidenceCompanion.insert(
                id: id,
                entryId: entryId,
                label: label,
                referenceText: referenceText,
                httpsUrl: httpsUrl,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $ProjectEntryEvidenceTable,
                    ProjectEntryEvidenceData
                  >(table),
                  $$ProjectEntryEvidenceTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({entryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (entryId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.entryId,
                        referencedTable: $$ProjectEntryEvidenceTableReferences
                            ._entryIdTable(db),
                        referencedColumn: $$ProjectEntryEvidenceTableReferences
                            ._entryIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProjectEntryEvidenceTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProjectEntryEvidenceTable,
      ProjectEntryEvidenceData,
      $$ProjectEntryEvidenceTableFilterComposer,
      $$ProjectEntryEvidenceTableOrderingComposer,
      $$ProjectEntryEvidenceTableAnnotationComposer,
      $$ProjectEntryEvidenceTableCreateCompanionBuilder,
      $$ProjectEntryEvidenceTableUpdateCompanionBuilder,
      (ProjectEntryEvidenceData, $$ProjectEntryEvidenceTableReferences),
      ProjectEntryEvidenceData,
      PrefetchHooks Function({bool entryId})
    >;
typedef $$ProjectReviewEntriesTableCreateCompanionBuilder =
    ProjectReviewEntriesCompanion Function({
      required String reviewId,
      required String entryId,
      Value<int> rowid,
    });
typedef $$ProjectReviewEntriesTableUpdateCompanionBuilder =
    ProjectReviewEntriesCompanion Function({
      Value<String> reviewId,
      Value<String> entryId,
      Value<int> rowid,
    });

final class $$ProjectReviewEntriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProjectReviewEntriesTable,
          ProjectReviewEntry
        > {
  $$ProjectReviewEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DecisionReviewsTable _reviewIdTable(_$AppDatabase db) => db
      .decisionReviews
      .createAlias('project_review_entries__review_id__decision_reviews__id');

  $$DecisionReviewsTableProcessedTableManager get reviewId {
    final $_column = $_itemColumn<String>('review_id')!;

    final manager = $$DecisionReviewsTableTableManager(
      $_db,
      $_db.decisionReviews,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_reviewIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProjectEntriesTable _entryIdTable(_$AppDatabase db) => db
      .projectEntries
      .createAlias('project_review_entries__entry_id__project_entries__id');

  $$ProjectEntriesTableProcessedTableManager get entryId {
    final $_column = $_itemColumn<String>('entry_id')!;

    final manager = $$ProjectEntriesTableTableManager(
      $_db,
      $_db.projectEntries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_entryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProjectReviewEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectReviewEntriesTable> {
  $$ProjectReviewEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DecisionReviewsTableFilterComposer get reviewId {
    final $$DecisionReviewsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reviewId,
      referencedTable: $db.decisionReviews,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionReviewsTableFilterComposer(
            $db: $db,
            $table: $db.decisionReviews,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProjectEntriesTableFilterComposer get entryId {
    final $$ProjectEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entryId,
      referencedTable: $db.projectEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectEntriesTableFilterComposer(
            $db: $db,
            $table: $db.projectEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProjectReviewEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectReviewEntriesTable> {
  $$ProjectReviewEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DecisionReviewsTableOrderingComposer get reviewId {
    final $$DecisionReviewsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reviewId,
      referencedTable: $db.decisionReviews,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionReviewsTableOrderingComposer(
            $db: $db,
            $table: $db.decisionReviews,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProjectEntriesTableOrderingComposer get entryId {
    final $$ProjectEntriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entryId,
      referencedTable: $db.projectEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectEntriesTableOrderingComposer(
            $db: $db,
            $table: $db.projectEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProjectReviewEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectReviewEntriesTable> {
  $$ProjectReviewEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DecisionReviewsTableAnnotationComposer get reviewId {
    final $$DecisionReviewsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reviewId,
      referencedTable: $db.decisionReviews,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DecisionReviewsTableAnnotationComposer(
            $db: $db,
            $table: $db.decisionReviews,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProjectEntriesTableAnnotationComposer get entryId {
    final $$ProjectEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entryId,
      referencedTable: $db.projectEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.projectEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProjectReviewEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProjectReviewEntriesTable,
          ProjectReviewEntry,
          $$ProjectReviewEntriesTableFilterComposer,
          $$ProjectReviewEntriesTableOrderingComposer,
          $$ProjectReviewEntriesTableAnnotationComposer,
          $$ProjectReviewEntriesTableCreateCompanionBuilder,
          $$ProjectReviewEntriesTableUpdateCompanionBuilder,
          (ProjectReviewEntry, $$ProjectReviewEntriesTableReferences),
          ProjectReviewEntry,
          PrefetchHooks Function({bool reviewId, bool entryId})
        > {
  $$ProjectReviewEntriesTableTableManager(
    _$AppDatabase db,
    $ProjectReviewEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectReviewEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectReviewEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ProjectReviewEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> reviewId = const Value.absent(),
                Value<String> entryId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectReviewEntriesCompanion(
                reviewId: reviewId,
                entryId: entryId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String reviewId,
                required String entryId,
                Value<int> rowid = const Value.absent(),
              }) => ProjectReviewEntriesCompanion.insert(
                reviewId: reviewId,
                entryId: entryId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProjectReviewEntriesTable, ProjectReviewEntry>(
                    table,
                  ),
                  $$ProjectReviewEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({reviewId = false, entryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (reviewId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.reviewId,
                        referencedTable: $$ProjectReviewEntriesTableReferences
                            ._reviewIdTable(db),
                        referencedColumn: $$ProjectReviewEntriesTableReferences
                            ._reviewIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (entryId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.entryId,
                        referencedTable: $$ProjectReviewEntriesTableReferences
                            ._entryIdTable(db),
                        referencedColumn: $$ProjectReviewEntriesTableReferences
                            ._entryIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProjectReviewEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProjectReviewEntriesTable,
      ProjectReviewEntry,
      $$ProjectReviewEntriesTableFilterComposer,
      $$ProjectReviewEntriesTableOrderingComposer,
      $$ProjectReviewEntriesTableAnnotationComposer,
      $$ProjectReviewEntriesTableCreateCompanionBuilder,
      $$ProjectReviewEntriesTableUpdateCompanionBuilder,
      (ProjectReviewEntry, $$ProjectReviewEntriesTableReferences),
      ProjectReviewEntry,
      PrefetchHooks Function({bool reviewId, bool entryId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DecisionsTableTableManager get decisions =>
      $$DecisionsTableTableManager(_db, _db.decisions);
  $$DecisionVersionsTableTableManager get decisionVersions =>
      $$DecisionVersionsTableTableManager(_db, _db.decisionVersions);
  $$AssumptionsTableTableManager get assumptions =>
      $$AssumptionsTableTableManager(_db, _db.assumptions);
  $$DecisionRisksTableTableManager get decisionRisks =>
      $$DecisionRisksTableTableManager(_db, _db.decisionRisks);
  $$EntitiesTableTableManager get entities =>
      $$EntitiesTableTableManager(_db, _db.entities);
  $$DecisionAdviceTableTableManager get decisionAdvice =>
      $$DecisionAdviceTableTableManager(_db, _db.decisionAdvice);
  $$DecisionReviewsTableTableManager get decisionReviews =>
      $$DecisionReviewsTableTableManager(_db, _db.decisionReviews);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db, _db.goals);
  $$GoalVersionsTableTableManager get goalVersions =>
      $$GoalVersionsTableTableManager(_db, _db.goalVersions);
  $$GoalCheckinsTableTableManager get goalCheckins =>
      $$GoalCheckinsTableTableManager(_db, _db.goalCheckins);
  $$ReviewSchedulesTableTableManager get reviewSchedules =>
      $$ReviewSchedulesTableTableManager(_db, _db.reviewSchedules);
  $$RelationsTableTableManager get relations =>
      $$RelationsTableTableManager(_db, _db.relations);
  $$EventsTableTableManager get events =>
      $$EventsTableTableManager(_db, _db.events);
  $$ReflectionsTableTableManager get reflections =>
      $$ReflectionsTableTableManager(_db, _db.reflections);
  $$ProjectEntriesTableTableManager get projectEntries =>
      $$ProjectEntriesTableTableManager(_db, _db.projectEntries);
  $$ProjectEntryEvidenceTableTableManager get projectEntryEvidence =>
      $$ProjectEntryEvidenceTableTableManager(_db, _db.projectEntryEvidence);
  $$ProjectReviewEntriesTableTableManager get projectReviewEntries =>
      $$ProjectReviewEntriesTableTableManager(_db, _db.projectReviewEntries);
}
