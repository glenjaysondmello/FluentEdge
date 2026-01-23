import '../fragments/speaking/speaking_mistake.fragment.graphql.dart';
import '../fragments/speaking/speaking_score.fragment.graphql.dart';
import '../schema.graphql.dart';
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
            name: NameNode(value: 'status'),
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
    this.transcript,
    required this.createdAt,
    this.scores,
    required this.status,
    this.$__typename = 'SpeakingTest',
  });

  factory Query_GetSpeakingTests_getSpeakingTests.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$transcript = json['transcript'];
    final l$createdAt = json['createdAt'];
    final l$scores = json['scores'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Query_GetSpeakingTests_getSpeakingTests(
      id: (l$id as String),
      transcript: (l$transcript as String?),
      createdAt: (l$createdAt as String),
      scores: l$scores == null
          ? null
          : Fragment_SpeakingScoreFields.fromJson(
              (l$scores as Map<String, dynamic>)),
      status: fromJson_Enum_SpeakingTestStatus((l$status as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? transcript;

  final String createdAt;

  final Fragment_SpeakingScoreFields? scores;

  final Enum_SpeakingTestStatus status;

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
    _resultData['scores'] = l$scores?.toJson();
    final l$status = status;
    _resultData['status'] = toJson_Enum_SpeakingTestStatus(l$status);
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
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$transcript,
      l$createdAt,
      l$scores,
      l$status,
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
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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
    Enum_SpeakingTestStatus? status,
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
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query_GetSpeakingTests_getSpeakingTests(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        transcript: transcript == _undefined
            ? _instance.transcript
            : (transcript as String?),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        scores: scores == _undefined
            ? _instance.scores
            : (scores as Fragment_SpeakingScoreFields?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum_SpeakingTestStatus),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith_Fragment_SpeakingScoreFields<TRes> get scores {
    final local$scores = _instance.scores;
    return local$scores == null
        ? CopyWith_Fragment_SpeakingScoreFields.stub(_then(_instance))
        : CopyWith_Fragment_SpeakingScoreFields(
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
    Enum_SpeakingTestStatus? status,
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

class Variables_Query_GetResultById {
  factory Variables_Query_GetResultById({required String resultId}) =>
      Variables_Query_GetResultById._({
        r'resultId': resultId,
      });

  Variables_Query_GetResultById._(this._$data);

  factory Variables_Query_GetResultById.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$resultId = data['resultId'];
    result$data['resultId'] = (l$resultId as String);
    return Variables_Query_GetResultById._(result$data);
  }

  Map<String, dynamic> _$data;

  String get resultId => (_$data['resultId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$resultId = resultId;
    result$data['resultId'] = l$resultId;
    return result$data;
  }

  CopyWith_Variables_Query_GetResultById<Variables_Query_GetResultById>
      get copyWith => CopyWith_Variables_Query_GetResultById(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables_Query_GetResultById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$resultId = resultId;
    final lOther$resultId = other.resultId;
    if (l$resultId != lOther$resultId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$resultId = resultId;
    return Object.hashAll([l$resultId]);
  }
}

abstract class CopyWith_Variables_Query_GetResultById<TRes> {
  factory CopyWith_Variables_Query_GetResultById(
    Variables_Query_GetResultById instance,
    TRes Function(Variables_Query_GetResultById) then,
  ) = _CopyWithImpl_Variables_Query_GetResultById;

  factory CopyWith_Variables_Query_GetResultById.stub(TRes res) =
      _CopyWithStubImpl_Variables_Query_GetResultById;

  TRes call({String? resultId});
}

class _CopyWithImpl_Variables_Query_GetResultById<TRes>
    implements CopyWith_Variables_Query_GetResultById<TRes> {
  _CopyWithImpl_Variables_Query_GetResultById(
    this._instance,
    this._then,
  );

  final Variables_Query_GetResultById _instance;

  final TRes Function(Variables_Query_GetResultById) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? resultId = _undefined}) =>
      _then(Variables_Query_GetResultById._({
        ..._instance._$data,
        if (resultId != _undefined && resultId != null)
          'resultId': (resultId as String),
      }));
}

class _CopyWithStubImpl_Variables_Query_GetResultById<TRes>
    implements CopyWith_Variables_Query_GetResultById<TRes> {
  _CopyWithStubImpl_Variables_Query_GetResultById(this._res);

  TRes _res;

  call({String? resultId}) => _res;
}

class Query_GetResultById {
  Query_GetResultById({
    required this.getResultById,
    this.$__typename = 'Query',
  });

  factory Query_GetResultById.fromJson(Map<String, dynamic> json) {
    final l$getResultById = json['getResultById'];
    final l$$__typename = json['__typename'];
    return Query_GetResultById(
      getResultById: Query_GetResultById_getResultById.fromJson(
          (l$getResultById as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query_GetResultById_getResultById getResultById;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getResultById = getResultById;
    _resultData['getResultById'] = l$getResultById.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getResultById = getResultById;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getResultById,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query_GetResultById) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getResultById = getResultById;
    final lOther$getResultById = other.getResultById;
    if (l$getResultById != lOther$getResultById) {
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

extension UtilityExtension_Query_GetResultById on Query_GetResultById {
  CopyWith_Query_GetResultById<Query_GetResultById> get copyWith =>
      CopyWith_Query_GetResultById(
        this,
        (i) => i,
      );
}

abstract class CopyWith_Query_GetResultById<TRes> {
  factory CopyWith_Query_GetResultById(
    Query_GetResultById instance,
    TRes Function(Query_GetResultById) then,
  ) = _CopyWithImpl_Query_GetResultById;

  factory CopyWith_Query_GetResultById.stub(TRes res) =
      _CopyWithStubImpl_Query_GetResultById;

  TRes call({
    Query_GetResultById_getResultById? getResultById,
    String? $__typename,
  });
  CopyWith_Query_GetResultById_getResultById<TRes> get getResultById;
}

class _CopyWithImpl_Query_GetResultById<TRes>
    implements CopyWith_Query_GetResultById<TRes> {
  _CopyWithImpl_Query_GetResultById(
    this._instance,
    this._then,
  );

  final Query_GetResultById _instance;

  final TRes Function(Query_GetResultById) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getResultById = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query_GetResultById(
        getResultById: getResultById == _undefined || getResultById == null
            ? _instance.getResultById
            : (getResultById as Query_GetResultById_getResultById),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith_Query_GetResultById_getResultById<TRes> get getResultById {
    final local$getResultById = _instance.getResultById;
    return CopyWith_Query_GetResultById_getResultById(
        local$getResultById, (e) => call(getResultById: e));
  }
}

class _CopyWithStubImpl_Query_GetResultById<TRes>
    implements CopyWith_Query_GetResultById<TRes> {
  _CopyWithStubImpl_Query_GetResultById(this._res);

  TRes _res;

  call({
    Query_GetResultById_getResultById? getResultById,
    String? $__typename,
  }) =>
      _res;

  CopyWith_Query_GetResultById_getResultById<TRes> get getResultById =>
      CopyWith_Query_GetResultById_getResultById.stub(_res);
}

const documentNodeQueryGetResultById = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetResultById'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'resultId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getResultById'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'resultId'),
            value: VariableNode(name: NameNode(value: 'resultId')),
          )
        ],
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
            name: NameNode(value: 'encouragement'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'mistakes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'SpeakingMistakeFields'),
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
            name: NameNode(value: 'suggestions'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
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
  fragmentDefinitionSpeakingMistakeFields,
]);

class Query_GetResultById_getResultById {
  Query_GetResultById_getResultById({
    required this.id,
    this.transcript,
    this.scores,
    this.encouragement,
    this.mistakes,
    this.suggestions,
    required this.status,
    this.$__typename = 'SpeakingTest',
  });

  factory Query_GetResultById_getResultById.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$transcript = json['transcript'];
    final l$scores = json['scores'];
    final l$encouragement = json['encouragement'];
    final l$mistakes = json['mistakes'];
    final l$suggestions = json['suggestions'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Query_GetResultById_getResultById(
      id: (l$id as String),
      transcript: (l$transcript as String?),
      scores: l$scores == null
          ? null
          : Fragment_SpeakingScoreFields.fromJson(
              (l$scores as Map<String, dynamic>)),
      encouragement: (l$encouragement as String?),
      mistakes: (l$mistakes as List<dynamic>?)
          ?.map((e) => Fragment_SpeakingMistakeFields.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      suggestions:
          (l$suggestions as List<dynamic>?)?.map((e) => (e as String)).toList(),
      status: fromJson_Enum_SpeakingTestStatus((l$status as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? transcript;

  final Fragment_SpeakingScoreFields? scores;

  final String? encouragement;

  final List<Fragment_SpeakingMistakeFields>? mistakes;

  final List<String>? suggestions;

  final Enum_SpeakingTestStatus status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$transcript = transcript;
    _resultData['transcript'] = l$transcript;
    final l$scores = scores;
    _resultData['scores'] = l$scores?.toJson();
    final l$encouragement = encouragement;
    _resultData['encouragement'] = l$encouragement;
    final l$mistakes = mistakes;
    _resultData['mistakes'] = l$mistakes?.map((e) => e.toJson()).toList();
    final l$suggestions = suggestions;
    _resultData['suggestions'] = l$suggestions?.map((e) => e).toList();
    final l$status = status;
    _resultData['status'] = toJson_Enum_SpeakingTestStatus(l$status);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$transcript = transcript;
    final l$scores = scores;
    final l$encouragement = encouragement;
    final l$mistakes = mistakes;
    final l$suggestions = suggestions;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$transcript,
      l$scores,
      l$encouragement,
      l$mistakes == null ? null : Object.hashAll(l$mistakes.map((v) => v)),
      l$suggestions == null
          ? null
          : Object.hashAll(l$suggestions.map((v) => v)),
      l$status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query_GetResultById_getResultById) ||
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
    final l$scores = scores;
    final lOther$scores = other.scores;
    if (l$scores != lOther$scores) {
      return false;
    }
    final l$encouragement = encouragement;
    final lOther$encouragement = other.encouragement;
    if (l$encouragement != lOther$encouragement) {
      return false;
    }
    final l$mistakes = mistakes;
    final lOther$mistakes = other.mistakes;
    if (l$mistakes != null && lOther$mistakes != null) {
      if (l$mistakes.length != lOther$mistakes.length) {
        return false;
      }
      for (int i = 0; i < l$mistakes.length; i++) {
        final l$mistakes$entry = l$mistakes[i];
        final lOther$mistakes$entry = lOther$mistakes[i];
        if (l$mistakes$entry != lOther$mistakes$entry) {
          return false;
        }
      }
    } else if (l$mistakes != lOther$mistakes) {
      return false;
    }
    final l$suggestions = suggestions;
    final lOther$suggestions = other.suggestions;
    if (l$suggestions != null && lOther$suggestions != null) {
      if (l$suggestions.length != lOther$suggestions.length) {
        return false;
      }
      for (int i = 0; i < l$suggestions.length; i++) {
        final l$suggestions$entry = l$suggestions[i];
        final lOther$suggestions$entry = lOther$suggestions[i];
        if (l$suggestions$entry != lOther$suggestions$entry) {
          return false;
        }
      }
    } else if (l$suggestions != lOther$suggestions) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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

extension UtilityExtension_Query_GetResultById_getResultById
    on Query_GetResultById_getResultById {
  CopyWith_Query_GetResultById_getResultById<Query_GetResultById_getResultById>
      get copyWith => CopyWith_Query_GetResultById_getResultById(
            this,
            (i) => i,
          );
}

abstract class CopyWith_Query_GetResultById_getResultById<TRes> {
  factory CopyWith_Query_GetResultById_getResultById(
    Query_GetResultById_getResultById instance,
    TRes Function(Query_GetResultById_getResultById) then,
  ) = _CopyWithImpl_Query_GetResultById_getResultById;

  factory CopyWith_Query_GetResultById_getResultById.stub(TRes res) =
      _CopyWithStubImpl_Query_GetResultById_getResultById;

  TRes call({
    String? id,
    String? transcript,
    Fragment_SpeakingScoreFields? scores,
    String? encouragement,
    List<Fragment_SpeakingMistakeFields>? mistakes,
    List<String>? suggestions,
    Enum_SpeakingTestStatus? status,
    String? $__typename,
  });
  CopyWith_Fragment_SpeakingScoreFields<TRes> get scores;
  TRes mistakes(
      Iterable<Fragment_SpeakingMistakeFields>? Function(
              Iterable<
                  CopyWith_Fragment_SpeakingMistakeFields<
                      Fragment_SpeakingMistakeFields>>?)
          _fn);
}

class _CopyWithImpl_Query_GetResultById_getResultById<TRes>
    implements CopyWith_Query_GetResultById_getResultById<TRes> {
  _CopyWithImpl_Query_GetResultById_getResultById(
    this._instance,
    this._then,
  );

  final Query_GetResultById_getResultById _instance;

  final TRes Function(Query_GetResultById_getResultById) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? transcript = _undefined,
    Object? scores = _undefined,
    Object? encouragement = _undefined,
    Object? mistakes = _undefined,
    Object? suggestions = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query_GetResultById_getResultById(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        transcript: transcript == _undefined
            ? _instance.transcript
            : (transcript as String?),
        scores: scores == _undefined
            ? _instance.scores
            : (scores as Fragment_SpeakingScoreFields?),
        encouragement: encouragement == _undefined
            ? _instance.encouragement
            : (encouragement as String?),
        mistakes: mistakes == _undefined
            ? _instance.mistakes
            : (mistakes as List<Fragment_SpeakingMistakeFields>?),
        suggestions: suggestions == _undefined
            ? _instance.suggestions
            : (suggestions as List<String>?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum_SpeakingTestStatus),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith_Fragment_SpeakingScoreFields<TRes> get scores {
    final local$scores = _instance.scores;
    return local$scores == null
        ? CopyWith_Fragment_SpeakingScoreFields.stub(_then(_instance))
        : CopyWith_Fragment_SpeakingScoreFields(
            local$scores, (e) => call(scores: e));
  }

  TRes mistakes(
          Iterable<Fragment_SpeakingMistakeFields>? Function(
                  Iterable<
                      CopyWith_Fragment_SpeakingMistakeFields<
                          Fragment_SpeakingMistakeFields>>?)
              _fn) =>
      call(
          mistakes: _fn(_instance.mistakes
              ?.map((e) => CopyWith_Fragment_SpeakingMistakeFields(
                    e,
                    (i) => i,
                  )))?.toList());
}

class _CopyWithStubImpl_Query_GetResultById_getResultById<TRes>
    implements CopyWith_Query_GetResultById_getResultById<TRes> {
  _CopyWithStubImpl_Query_GetResultById_getResultById(this._res);

  TRes _res;

  call({
    String? id,
    String? transcript,
    Fragment_SpeakingScoreFields? scores,
    String? encouragement,
    List<Fragment_SpeakingMistakeFields>? mistakes,
    List<String>? suggestions,
    Enum_SpeakingTestStatus? status,
    String? $__typename,
  }) =>
      _res;

  CopyWith_Fragment_SpeakingScoreFields<TRes> get scores =>
      CopyWith_Fragment_SpeakingScoreFields.stub(_res);

  mistakes(_fn) => _res;
}
