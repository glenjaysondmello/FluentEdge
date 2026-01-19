import '../fragments/typing/typing_result.fragment.graphql.dart';
import 'package:gql/ast.dart';

class Query_GetTypingTests {
  Query_GetTypingTests({
    required this.getTypingTests,
    this.$__typename = 'Query',
  });

  factory Query_GetTypingTests.fromJson(Map<String, dynamic> json) {
    final l$getTypingTests = json['getTypingTests'];
    final l$$__typename = json['__typename'];
    return Query_GetTypingTests(
      getTypingTests: (l$getTypingTests as List<dynamic>)
          .map((e) =>
              Fragment_TypingResultFields.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment_TypingResultFields> getTypingTests;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getTypingTests = getTypingTests;
    _resultData['getTypingTests'] =
        l$getTypingTests.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getTypingTests = getTypingTests;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$getTypingTests.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query_GetTypingTests) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getTypingTests = getTypingTests;
    final lOther$getTypingTests = other.getTypingTests;
    if (l$getTypingTests.length != lOther$getTypingTests.length) {
      return false;
    }
    for (int i = 0; i < l$getTypingTests.length; i++) {
      final l$getTypingTests$entry = l$getTypingTests[i];
      final lOther$getTypingTests$entry = lOther$getTypingTests[i];
      if (l$getTypingTests$entry != lOther$getTypingTests$entry) {
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

extension UtilityExtension_Query_GetTypingTests on Query_GetTypingTests {
  CopyWith_Query_GetTypingTests<Query_GetTypingTests> get copyWith =>
      CopyWith_Query_GetTypingTests(
        this,
        (i) => i,
      );
}

abstract class CopyWith_Query_GetTypingTests<TRes> {
  factory CopyWith_Query_GetTypingTests(
    Query_GetTypingTests instance,
    TRes Function(Query_GetTypingTests) then,
  ) = _CopyWithImpl_Query_GetTypingTests;

  factory CopyWith_Query_GetTypingTests.stub(TRes res) =
      _CopyWithStubImpl_Query_GetTypingTests;

  TRes call({
    List<Fragment_TypingResultFields>? getTypingTests,
    String? $__typename,
  });
  TRes getTypingTests(
      Iterable<Fragment_TypingResultFields> Function(
              Iterable<
                  CopyWith_Fragment_TypingResultFields<
                      Fragment_TypingResultFields>>)
          _fn);
}

class _CopyWithImpl_Query_GetTypingTests<TRes>
    implements CopyWith_Query_GetTypingTests<TRes> {
  _CopyWithImpl_Query_GetTypingTests(
    this._instance,
    this._then,
  );

  final Query_GetTypingTests _instance;

  final TRes Function(Query_GetTypingTests) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getTypingTests = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query_GetTypingTests(
        getTypingTests: getTypingTests == _undefined || getTypingTests == null
            ? _instance.getTypingTests
            : (getTypingTests as List<Fragment_TypingResultFields>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getTypingTests(
          Iterable<Fragment_TypingResultFields> Function(
                  Iterable<
                      CopyWith_Fragment_TypingResultFields<
                          Fragment_TypingResultFields>>)
              _fn) =>
      call(
          getTypingTests: _fn(_instance.getTypingTests
              .map((e) => CopyWith_Fragment_TypingResultFields(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl_Query_GetTypingTests<TRes>
    implements CopyWith_Query_GetTypingTests<TRes> {
  _CopyWithStubImpl_Query_GetTypingTests(this._res);

  TRes _res;

  call({
    List<Fragment_TypingResultFields>? getTypingTests,
    String? $__typename,
  }) =>
      _res;

  getTypingTests(_fn) => _res;
}

const documentNodeQueryGetTypingTests = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetTypingTests'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getTypingTests'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'TypingResultFields'),
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
  fragmentDefinitionTypingResultFields,
]);

class Query_GetTypingTestText {
  Query_GetTypingTestText({
    required this.getTypingTestText,
    this.$__typename = 'Query',
  });

  factory Query_GetTypingTestText.fromJson(Map<String, dynamic> json) {
    final l$getTypingTestText = json['getTypingTestText'];
    final l$$__typename = json['__typename'];
    return Query_GetTypingTestText(
      getTypingTestText: (l$getTypingTestText as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String getTypingTestText;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getTypingTestText = getTypingTestText;
    _resultData['getTypingTestText'] = l$getTypingTestText;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getTypingTestText = getTypingTestText;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getTypingTestText,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query_GetTypingTestText) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getTypingTestText = getTypingTestText;
    final lOther$getTypingTestText = other.getTypingTestText;
    if (l$getTypingTestText != lOther$getTypingTestText) {
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

extension UtilityExtension_Query_GetTypingTestText on Query_GetTypingTestText {
  CopyWith_Query_GetTypingTestText<Query_GetTypingTestText> get copyWith =>
      CopyWith_Query_GetTypingTestText(
        this,
        (i) => i,
      );
}

abstract class CopyWith_Query_GetTypingTestText<TRes> {
  factory CopyWith_Query_GetTypingTestText(
    Query_GetTypingTestText instance,
    TRes Function(Query_GetTypingTestText) then,
  ) = _CopyWithImpl_Query_GetTypingTestText;

  factory CopyWith_Query_GetTypingTestText.stub(TRes res) =
      _CopyWithStubImpl_Query_GetTypingTestText;

  TRes call({
    String? getTypingTestText,
    String? $__typename,
  });
}

class _CopyWithImpl_Query_GetTypingTestText<TRes>
    implements CopyWith_Query_GetTypingTestText<TRes> {
  _CopyWithImpl_Query_GetTypingTestText(
    this._instance,
    this._then,
  );

  final Query_GetTypingTestText _instance;

  final TRes Function(Query_GetTypingTestText) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getTypingTestText = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query_GetTypingTestText(
        getTypingTestText:
            getTypingTestText == _undefined || getTypingTestText == null
                ? _instance.getTypingTestText
                : (getTypingTestText as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl_Query_GetTypingTestText<TRes>
    implements CopyWith_Query_GetTypingTestText<TRes> {
  _CopyWithStubImpl_Query_GetTypingTestText(this._res);

  TRes _res;

  call({
    String? getTypingTestText,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeQueryGetTypingTestText = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetTypingTestText'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getTypingTestText'),
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
