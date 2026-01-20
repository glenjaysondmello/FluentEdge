import 'package:gql/ast.dart';

class Fragment_SpeakingScoreFields {
  Fragment_SpeakingScoreFields({
    required this.fluency,
    required this.pronunciation,
    required this.grammar,
    required this.vocabulary,
    required this.overall,
    this.$__typename = 'SpeakingScore',
  });

  factory Fragment_SpeakingScoreFields.fromJson(Map<String, dynamic> json) {
    final l$fluency = json['fluency'];
    final l$pronunciation = json['pronunciation'];
    final l$grammar = json['grammar'];
    final l$vocabulary = json['vocabulary'];
    final l$overall = json['overall'];
    final l$$__typename = json['__typename'];
    return Fragment_SpeakingScoreFields(
      fluency: (l$fluency as num).toDouble(),
      pronunciation: (l$pronunciation as num).toDouble(),
      grammar: (l$grammar as num).toDouble(),
      vocabulary: (l$vocabulary as num).toDouble(),
      overall: (l$overall as num).toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final double fluency;

  final double pronunciation;

  final double grammar;

  final double vocabulary;

  final double overall;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$fluency = fluency;
    resultData['fluency'] = l$fluency;
    final l$pronunciation = pronunciation;
    resultData['pronunciation'] = l$pronunciation;
    final l$grammar = grammar;
    resultData['grammar'] = l$grammar;
    final l$vocabulary = vocabulary;
    resultData['vocabulary'] = l$vocabulary;
    final l$overall = overall;
    resultData['overall'] = l$overall;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$fluency = fluency;
    final l$pronunciation = pronunciation;
    final l$grammar = grammar;
    final l$vocabulary = vocabulary;
    final l$overall = overall;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$fluency,
      l$pronunciation,
      l$grammar,
      l$vocabulary,
      l$overall,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment_SpeakingScoreFields ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$fluency = fluency;
    final lOther$fluency = other.fluency;
    if (l$fluency != lOther$fluency) {
      return false;
    }
    final l$pronunciation = pronunciation;
    final lOther$pronunciation = other.pronunciation;
    if (l$pronunciation != lOther$pronunciation) {
      return false;
    }
    final l$grammar = grammar;
    final lOther$grammar = other.grammar;
    if (l$grammar != lOther$grammar) {
      return false;
    }
    final l$vocabulary = vocabulary;
    final lOther$vocabulary = other.vocabulary;
    if (l$vocabulary != lOther$vocabulary) {
      return false;
    }
    final l$overall = overall;
    final lOther$overall = other.overall;
    if (l$overall != lOther$overall) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension_Fragment_SpeakingScoreFields
    on Fragment_SpeakingScoreFields {
  CopyWith_Fragment_SpeakingScoreFields<Fragment_SpeakingScoreFields>
  get copyWith => CopyWith_Fragment_SpeakingScoreFields(this, (i) => i);
}

abstract class CopyWith_Fragment_SpeakingScoreFields<TRes> {
  factory CopyWith_Fragment_SpeakingScoreFields(
    Fragment_SpeakingScoreFields instance,
    TRes Function(Fragment_SpeakingScoreFields) then,
  ) = _CopyWithImpl_Fragment_SpeakingScoreFields;

  factory CopyWith_Fragment_SpeakingScoreFields.stub(TRes res) =
      _CopyWithStubImpl_Fragment_SpeakingScoreFields;

  TRes call({
    double? fluency,
    double? pronunciation,
    double? grammar,
    double? vocabulary,
    double? overall,
    String? $__typename,
  });
}

class _CopyWithImpl_Fragment_SpeakingScoreFields<TRes>
    implements CopyWith_Fragment_SpeakingScoreFields<TRes> {
  _CopyWithImpl_Fragment_SpeakingScoreFields(this._instance, this._then);

  final Fragment_SpeakingScoreFields _instance;

  final TRes Function(Fragment_SpeakingScoreFields) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? fluency = _undefined,
    Object? pronunciation = _undefined,
    Object? grammar = _undefined,
    Object? vocabulary = _undefined,
    Object? overall = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment_SpeakingScoreFields(
      fluency: fluency == _undefined || fluency == null
          ? _instance.fluency
          : (fluency as double),
      pronunciation: pronunciation == _undefined || pronunciation == null
          ? _instance.pronunciation
          : (pronunciation as double),
      grammar: grammar == _undefined || grammar == null
          ? _instance.grammar
          : (grammar as double),
      vocabulary: vocabulary == _undefined || vocabulary == null
          ? _instance.vocabulary
          : (vocabulary as double),
      overall: overall == _undefined || overall == null
          ? _instance.overall
          : (overall as double),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl_Fragment_SpeakingScoreFields<TRes>
    implements CopyWith_Fragment_SpeakingScoreFields<TRes> {
  _CopyWithStubImpl_Fragment_SpeakingScoreFields(this._res);

  final TRes _res;

  @override
  call({
    double? fluency,
    double? pronunciation,
    double? grammar,
    double? vocabulary,
    double? overall,
    String? $__typename,
  }) => _res;
}

const fragmentDefinitionSpeakingScoreFields = FragmentDefinitionNode(
  name: NameNode(value: 'SpeakingScoreFields'),
  typeCondition: TypeConditionNode(
    on: NamedTypeNode(name: NameNode(value: 'SpeakingScore'), isNonNull: false),
  ),
  directives: [],
  selectionSet: SelectionSetNode(
    selections: [
      FieldNode(
        name: NameNode(value: 'fluency'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'pronunciation'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'grammar'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'vocabulary'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'overall'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ],
  ),
);
const documentNodeFragmentSpeakingScoreFields = DocumentNode(
  definitions: [fragmentDefinitionSpeakingScoreFields],
);
