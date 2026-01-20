import 'package:gql/ast.dart';

class Fragment_TypingResultFields {
  Fragment_TypingResultFields({
    required this.id,
    required this.referenceText,
    required this.wpm,
    required this.cpm,
    required this.accuracy,
    required this.score,
    required this.createdAt,
    this.$__typename = 'TypingTest',
  });

  factory Fragment_TypingResultFields.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$referenceText = json['referenceText'];
    final l$wpm = json['wpm'];
    final l$cpm = json['cpm'];
    final l$accuracy = json['accuracy'];
    final l$score = json['score'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Fragment_TypingResultFields(
      id: (l$id as String),
      referenceText: (l$referenceText as String),
      wpm: (l$wpm as num).toDouble(),
      cpm: (l$cpm as num).toDouble(),
      accuracy: (l$accuracy as num).toDouble(),
      score: (l$score as num).toDouble(),
      createdAt: (l$createdAt as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String referenceText;

  final double wpm;

  final double cpm;

  final double accuracy;

  final double score;

  final String createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$id = id;
    resultData['id'] = l$id;
    final l$referenceText = referenceText;
    resultData['referenceText'] = l$referenceText;
    final l$wpm = wpm;
    resultData['wpm'] = l$wpm;
    final l$cpm = cpm;
    resultData['cpm'] = l$cpm;
    final l$accuracy = accuracy;
    resultData['accuracy'] = l$accuracy;
    final l$score = score;
    resultData['score'] = l$score;
    final l$createdAt = createdAt;
    resultData['createdAt'] = l$createdAt;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$referenceText = referenceText;
    final l$wpm = wpm;
    final l$cpm = cpm;
    final l$accuracy = accuracy;
    final l$score = score;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$referenceText,
      l$wpm,
      l$cpm,
      l$accuracy,
      l$score,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment_TypingResultFields ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$referenceText = referenceText;
    final lOther$referenceText = other.referenceText;
    if (l$referenceText != lOther$referenceText) {
      return false;
    }
    final l$wpm = wpm;
    final lOther$wpm = other.wpm;
    if (l$wpm != lOther$wpm) {
      return false;
    }
    final l$cpm = cpm;
    final lOther$cpm = other.cpm;
    if (l$cpm != lOther$cpm) {
      return false;
    }
    final l$accuracy = accuracy;
    final lOther$accuracy = other.accuracy;
    if (l$accuracy != lOther$accuracy) {
      return false;
    }
    final l$score = score;
    final lOther$score = other.score;
    if (l$score != lOther$score) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
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

extension UtilityExtension_Fragment_TypingResultFields
    on Fragment_TypingResultFields {
  CopyWith_Fragment_TypingResultFields<Fragment_TypingResultFields>
  get copyWith => CopyWith_Fragment_TypingResultFields(this, (i) => i);
}

abstract class CopyWith_Fragment_TypingResultFields<TRes> {
  factory CopyWith_Fragment_TypingResultFields(
    Fragment_TypingResultFields instance,
    TRes Function(Fragment_TypingResultFields) then,
  ) = _CopyWithImpl_Fragment_TypingResultFields;

  factory CopyWith_Fragment_TypingResultFields.stub(TRes res) =
      _CopyWithStubImpl_Fragment_TypingResultFields;

  TRes call({
    String? id,
    String? referenceText,
    double? wpm,
    double? cpm,
    double? accuracy,
    double? score,
    String? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl_Fragment_TypingResultFields<TRes>
    implements CopyWith_Fragment_TypingResultFields<TRes> {
  _CopyWithImpl_Fragment_TypingResultFields(this._instance, this._then);

  final Fragment_TypingResultFields _instance;

  final TRes Function(Fragment_TypingResultFields) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? referenceText = _undefined,
    Object? wpm = _undefined,
    Object? cpm = _undefined,
    Object? accuracy = _undefined,
    Object? score = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment_TypingResultFields(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      referenceText: referenceText == _undefined || referenceText == null
          ? _instance.referenceText
          : (referenceText as String),
      wpm: wpm == _undefined || wpm == null ? _instance.wpm : (wpm as double),
      cpm: cpm == _undefined || cpm == null ? _instance.cpm : (cpm as double),
      accuracy: accuracy == _undefined || accuracy == null
          ? _instance.accuracy
          : (accuracy as double),
      score: score == _undefined || score == null
          ? _instance.score
          : (score as double),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl_Fragment_TypingResultFields<TRes>
    implements CopyWith_Fragment_TypingResultFields<TRes> {
  _CopyWithStubImpl_Fragment_TypingResultFields(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? referenceText,
    double? wpm,
    double? cpm,
    double? accuracy,
    double? score,
    String? createdAt,
    String? $__typename,
  }) => _res;
}

const fragmentDefinitionTypingResultFields = FragmentDefinitionNode(
  name: NameNode(value: 'TypingResultFields'),
  typeCondition: TypeConditionNode(
    on: NamedTypeNode(name: NameNode(value: 'TypingTest'), isNonNull: false),
  ),
  directives: [],
  selectionSet: SelectionSetNode(
    selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'referenceText'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'wpm'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'cpm'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'accuracy'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'score'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
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
const documentNodeFragmentTypingResultFields = DocumentNode(
  definitions: [fragmentDefinitionTypingResultFields],
);
