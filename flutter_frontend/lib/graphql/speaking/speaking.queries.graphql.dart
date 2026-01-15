import '../fragments/speaking/speaking_score.fragment.graphql.dart';
import 'package:gql/ast.dart';

class Query_GetSpeakingTests {
  Query_GetSpeakingTests({
    required this.getSpeakingTests,
    this.$__typename = 'Query',
  });

  factory Query_GetSpeakingTests.fromJson(Map<String, dynamic> json) {
    final l$getSpeakingTests = json['getSpeakingTests'];
    final l$$__typename = json['__typename'];
    return Query_GetSpeakingTests(
      getSpeakingTests: (l$getSpeakingTests as List<dynamic>)
          .map((e) => Query_GetSpeakingTests_getSpeakingTests.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query_GetSpeakingTests_getSpeakingTests> getSpeakingTests;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getSpeakingTests = getSpeakingTests;
    _resultData['getSpeakingTests'] =
        l$getSpeakingTests.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getSpeakingTests = getSpeakingTests;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$getSpeakingTests.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query_GetSpeakingTests) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getSpeakingTests = getSpeakingTests;
    final lOther$getSpeakingTests = other.getSpeakingTests;
    if (l$getSpeakingTests.length != lOther$getSpeakingTests.length) {
      return false;
    }
    for (int i = 0; i < l$getSpeakingTests.length; i++) {
      final l$getSpeakingTests$entry = l$getSpeakingTests[i];
      final lOther$getSpeakingTests$entry = lOther$getSpeakingTests[i];
      if (l$getSpeakingTests$entry != lOther$getSpeakingTests$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension_Query_GetSpeakingTests on Query_GetSpeakingTests {
  CopyWith_Query_GetSpeakingTests<Query_GetSpeakingTests> get copyWith =>
      CopyWith_Query_GetSpeakingTests(
        this,
        (i) => i,
      );
}

abstract class CopyWith_Query_GetSpeakingTests<TRes> {
  factory CopyWith_Query_GetSpeakingTests(
    Query_GetSpeakingTests instance,
    TRes Function(Query_GetSpeakingTests) then,
  ) = _CopyWithImpl_Query_GetSpeakingTests;

  factory CopyWith_Query_GetSpeakingTests.stub(TRes res) =
      _CopyWithStubImpl_Query_GetSpeakingTests;

  TRes call({
    List<Query_GetSpeakingTests_getSpeakingTests>? getSpeakingTests,
    String? $__typename,
  });
  TRes getSpeakingTests(
      Iterable<Query_GetSpeakingTests_getSpeakingTests> Function(
              Iterable<
                  CopyWith_Query_GetSpeakingTests_getSpeakingTests<
                      Query_GetSpeakingTests_getSpeakingTests>>)
          _fn);
}

class _CopyWithImpl_Query_GetSpeakingTests<TRes>
    implements CopyWith_Query_GetSpeakingTests<TRes> {
  _CopyWithImpl_Query_GetSpeakingTests(
    this._instance,
    this._then,
  );

  final Query_GetSpeakingTests _instance;

  final TRes Function(Query_GetSpeakingTests) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getSpeakingTests = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query_GetSpeakingTests(
        getSpeakingTests:
            getSpeakingTests == _undefined || getSpeakingTests == null
                ? _instance.getSpeakingTests
                : (getSpeakingTests
                    as List<Query_GetSpeakingTests_getSpeakingTests>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getSpeakingTests(
          Iterable<Query_GetSpeakingTests_getSpeakingTests> Function(
                  Iterable<
                      CopyWith_Query_GetSpeakingTests_getSpeakingTests<
                          Query_GetSpeakingTests_getSpeakingTests>>)
              _fn) =>
      call(
          getSpeakingTests: _fn(_instance.getSpeakingTests
              .map((e) => CopyWith_Query_GetSpeakingTests_getSpeakingTests(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl_Query_GetSpeakingTests<TRes>
    implements CopyWith_Query_GetSpeakingTests<TRes> {
  _CopyWithStubImpl_Query_GetSpeakingTests(this._res);

  TRes _res;

  call({
    List<Query_GetSpeakingTests_getSpeakingTests>? getSpeakingTests,
    String? $__typename,
  }) =>
      _res;

  getSpeakingTests(_fn) => _res;
}

const documentNodeQueryGetSpeakingTests = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetSpeakingTests'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getSpeakingTests'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'transcript'),
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
            name: NameNode(value: 'scores'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'SpeakingScoreFields'),
                directives: [],
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionSpeakingScoreFields,
]);

class Query_GetSpeakingTests_getSpeakingTests {
  Query_GetSpeakingTests_getSpeakingTests({
    required this.id,
    required this.transcript,
    required this.createdAt,
    required this.scores,
    this.$__typename = 'SpeakingTest',
  });

  factory Query_GetSpeakingTests_getSpeakingTests.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$transcript = json['transcript'];
    final l$createdAt = json['createdAt'];
    final l$scores = json['scores'];
    final l$$__typename = json['__typename'];
    return Query_GetSpeakingTests_getSpeakingTests(
      id: (l$id as String),
      transcript: (l$transcript as String),
      createdAt: (l$createdAt as String),
      scores: Fragment_SpeakingScoreFields.fromJson(
          (l$scores as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String transcript;

  final String createdAt;

  final Fragment_SpeakingScoreFields scores;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$transcript = transcript;
    _resultData['transcript'] = l$transcript;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$scores = scores;
    _resultData['scores'] = l$scores.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$transcript = transcript;
    final l$createdAt = createdAt;
    final l$scores = scores;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$transcript,
      l$createdAt,
      l$scores,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query_GetSpeakingTests_getSpeakingTests) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$transcript = transcript;
    final lOther$transcript = other.transcript;
    if (l$transcript != lOther$transcript) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$scores = scores;
    final lOther$scores = other.scores;
    if (l$scores != lOther$scores) {
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

extension UtilityExtension_Query_GetSpeakingTests_getSpeakingTests
    on Query_GetSpeakingTests_getSpeakingTests {
  CopyWith_Query_GetSpeakingTests_getSpeakingTests<
          Query_GetSpeakingTests_getSpeakingTests>
      get copyWith => CopyWith_Query_GetSpeakingTests_getSpeakingTests(
            this,
            (i) => i,
          );
}

abstract class CopyWith_Query_GetSpeakingTests_getSpeakingTests<TRes> {
  factory CopyWith_Query_GetSpeakingTests_getSpeakingTests(
    Query_GetSpeakingTests_getSpeakingTests instance,
    TRes Function(Query_GetSpeakingTests_getSpeakingTests) then,
  ) = _CopyWithImpl_Query_GetSpeakingTests_getSpeakingTests;

  factory CopyWith_Query_GetSpeakingTests_getSpeakingTests.stub(TRes res) =
      _CopyWithStubImpl_Query_GetSpeakingTests_getSpeakingTests;

  TRes call({
    String? id,
    String? transcript,
    String? createdAt,
    Fragment_SpeakingScoreFields? scores,
    String? $__typename,
  });
  CopyWith_Fragment_SpeakingScoreFields<TRes> get scores;
}

class _CopyWithImpl_Query_GetSpeakingTests_getSpeakingTests<TRes>
    implements CopyWith_Query_GetSpeakingTests_getSpeakingTests<TRes> {
  _CopyWithImpl_Query_GetSpeakingTests_getSpeakingTests(
    this._instance,
    this._then,
  );

  final Query_GetSpeakingTests_getSpeakingTests _instance;

  final TRes Function(Query_GetSpeakingTests_getSpeakingTests) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? transcript = _undefined,
    Object? createdAt = _undefined,
    Object? scores = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query_GetSpeakingTests_getSpeakingTests(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        transcript: transcript == _undefined || transcript == null
            ? _instance.transcript
            : (transcript as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        scores: scores == _undefined || scores == null
            ? _instance.scores
            : (scores as Fragment_SpeakingScoreFields),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith_Fragment_SpeakingScoreFields<TRes> get scores {
    final local$scores = _instance.scores;
    return CopyWith_Fragment_SpeakingScoreFields(
        local$scores, (e) => call(scores: e));
  }
}

class _CopyWithStubImpl_Query_GetSpeakingTests_getSpeakingTests<TRes>
    implements CopyWith_Query_GetSpeakingTests_getSpeakingTests<TRes> {
  _CopyWithStubImpl_Query_GetSpeakingTests_getSpeakingTests(this._res);

  TRes _res;

  call({
    String? id,
    String? transcript,
    String? createdAt,
    Fragment_SpeakingScoreFields? scores,
    String? $__typename,
  }) =>
      _res;

  CopyWith_Fragment_SpeakingScoreFields<TRes> get scores =>
      CopyWith_Fragment_SpeakingScoreFields.stub(_res);
}

class Query_GetSpeakingTestText {
  Query_GetSpeakingTestText({
    required this.getSpeakingTestText,
    this.$__typename = 'Query',
  });

  factory Query_GetSpeakingTestText.fromJson(Map<String, dynamic> json) {
    final l$getSpeakingTestText = json['getSpeakingTestText'];
    final l$$__typename = json['__typename'];
    return Query_GetSpeakingTestText(
      getSpeakingTestText: (l$getSpeakingTestText as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String getSpeakingTestText;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getSpeakingTestText = getSpeakingTestText;
    _resultData['getSpeakingTestText'] = l$getSpeakingTestText;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getSpeakingTestText = getSpeakingTestText;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getSpeakingTestText,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query_GetSpeakingTestText) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getSpeakingTestText = getSpeakingTestText;
    final lOther$getSpeakingTestText = other.getSpeakingTestText;
    if (l$getSpeakingTestText != lOther$getSpeakingTestText) {
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

extension UtilityExtension_Query_GetSpeakingTestText
    on Query_GetSpeakingTestText {
  CopyWith_Query_GetSpeakingTestText<Query_GetSpeakingTestText> get copyWith =>
      CopyWith_Query_GetSpeakingTestText(
        this,
        (i) => i,
      );
}

abstract class CopyWith_Query_GetSpeakingTestText<TRes> {
  factory CopyWith_Query_GetSpeakingTestText(
    Query_GetSpeakingTestText instance,
    TRes Function(Query_GetSpeakingTestText) then,
  ) = _CopyWithImpl_Query_GetSpeakingTestText;

  factory CopyWith_Query_GetSpeakingTestText.stub(TRes res) =
      _CopyWithStubImpl_Query_GetSpeakingTestText;

  TRes call({
    String? getSpeakingTestText,
    String? $__typename,
  });
}

class _CopyWithImpl_Query_GetSpeakingTestText<TRes>
    implements CopyWith_Query_GetSpeakingTestText<TRes> {
  _CopyWithImpl_Query_GetSpeakingTestText(
    this._instance,
    this._then,
  );

  final Query_GetSpeakingTestText _instance;

  final TRes Function(Query_GetSpeakingTestText) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getSpeakingTestText = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query_GetSpeakingTestText(
        getSpeakingTestText:
            getSpeakingTestText == _undefined || getSpeakingTestText == null
                ? _instance.getSpeakingTestText
                : (getSpeakingTestText as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl_Query_GetSpeakingTestText<TRes>
    implements CopyWith_Query_GetSpeakingTestText<TRes> {
  _CopyWithStubImpl_Query_GetSpeakingTestText(this._res);

  TRes _res;

  call({
    String? getSpeakingTestText,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeQueryGetSpeakingTestText = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetSpeakingTestText'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getSpeakingTestText'),
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
    ]),
  ),
]);
