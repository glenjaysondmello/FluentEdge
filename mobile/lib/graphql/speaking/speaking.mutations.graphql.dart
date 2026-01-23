import 'package:gql/ast.dart';
import 'package:http/http.dart';

class Variables_Mutation_SubmitSpeakingTest {
  factory Variables_Mutation_SubmitSpeakingTest({
    required String referenceText,
    required MultipartFile audioFile,
  }) =>
      Variables_Mutation_SubmitSpeakingTest._({
        r'referenceText': referenceText,
        r'audioFile': audioFile,
      });

  Variables_Mutation_SubmitSpeakingTest._(this._$data);

  factory Variables_Mutation_SubmitSpeakingTest.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$referenceText = data['referenceText'];
    result$data['referenceText'] = (l$referenceText as String);
    final l$audioFile = data['audioFile'];
    result$data['audioFile'] = (l$audioFile as MultipartFile);
    return Variables_Mutation_SubmitSpeakingTest._(result$data);
  }

  Map<String, dynamic> _$data;

  String get referenceText => (_$data['referenceText'] as String);

  MultipartFile get audioFile => (_$data['audioFile'] as MultipartFile);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$referenceText = referenceText;
    result$data['referenceText'] = l$referenceText;
    final l$audioFile = audioFile;
    result$data['audioFile'] = l$audioFile;
    return result$data;
  }

  CopyWith_Variables_Mutation_SubmitSpeakingTest<
          Variables_Mutation_SubmitSpeakingTest>
      get copyWith => CopyWith_Variables_Mutation_SubmitSpeakingTest(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables_Mutation_SubmitSpeakingTest) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$referenceText = referenceText;
    final lOther$referenceText = other.referenceText;
    if (l$referenceText != lOther$referenceText) {
      return false;
    }
    final l$audioFile = audioFile;
    final lOther$audioFile = other.audioFile;
    if (l$audioFile != lOther$audioFile) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$referenceText = referenceText;
    final l$audioFile = audioFile;
    return Object.hashAll([
      l$referenceText,
      l$audioFile,
    ]);
  }
}

abstract class CopyWith_Variables_Mutation_SubmitSpeakingTest<TRes> {
  factory CopyWith_Variables_Mutation_SubmitSpeakingTest(
    Variables_Mutation_SubmitSpeakingTest instance,
    TRes Function(Variables_Mutation_SubmitSpeakingTest) then,
  ) = _CopyWithImpl_Variables_Mutation_SubmitSpeakingTest;

  factory CopyWith_Variables_Mutation_SubmitSpeakingTest.stub(TRes res) =
      _CopyWithStubImpl_Variables_Mutation_SubmitSpeakingTest;

  TRes call({
    String? referenceText,
    MultipartFile? audioFile,
  });
}

class _CopyWithImpl_Variables_Mutation_SubmitSpeakingTest<TRes>
    implements CopyWith_Variables_Mutation_SubmitSpeakingTest<TRes> {
  _CopyWithImpl_Variables_Mutation_SubmitSpeakingTest(
    this._instance,
    this._then,
  );

  final Variables_Mutation_SubmitSpeakingTest _instance;

  final TRes Function(Variables_Mutation_SubmitSpeakingTest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? referenceText = _undefined,
    Object? audioFile = _undefined,
  }) =>
      _then(Variables_Mutation_SubmitSpeakingTest._({
        ..._instance._$data,
        if (referenceText != _undefined && referenceText != null)
          'referenceText': (referenceText as String),
        if (audioFile != _undefined && audioFile != null)
          'audioFile': (audioFile as MultipartFile),
      }));
}

class _CopyWithStubImpl_Variables_Mutation_SubmitSpeakingTest<TRes>
    implements CopyWith_Variables_Mutation_SubmitSpeakingTest<TRes> {
  _CopyWithStubImpl_Variables_Mutation_SubmitSpeakingTest(this._res);

  TRes _res;

  call({
    String? referenceText,
    MultipartFile? audioFile,
  }) =>
      _res;
}

class Mutation_SubmitSpeakingTest {
  Mutation_SubmitSpeakingTest({
    required this.submitSpeakingTest,
    this.$__typename = 'Mutation',
  });

  factory Mutation_SubmitSpeakingTest.fromJson(Map<String, dynamic> json) {
    final l$submitSpeakingTest = json['submitSpeakingTest'];
    final l$$__typename = json['__typename'];
    return Mutation_SubmitSpeakingTest(
      submitSpeakingTest: (l$submitSpeakingTest as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String submitSpeakingTest;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$submitSpeakingTest = submitSpeakingTest;
    _resultData['submitSpeakingTest'] = l$submitSpeakingTest;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$submitSpeakingTest = submitSpeakingTest;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$submitSpeakingTest,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation_SubmitSpeakingTest) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$submitSpeakingTest = submitSpeakingTest;
    final lOther$submitSpeakingTest = other.submitSpeakingTest;
    if (l$submitSpeakingTest != lOther$submitSpeakingTest) {
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

extension UtilityExtension_Mutation_SubmitSpeakingTest
    on Mutation_SubmitSpeakingTest {
  CopyWith_Mutation_SubmitSpeakingTest<Mutation_SubmitSpeakingTest>
      get copyWith => CopyWith_Mutation_SubmitSpeakingTest(
            this,
            (i) => i,
          );
}

abstract class CopyWith_Mutation_SubmitSpeakingTest<TRes> {
  factory CopyWith_Mutation_SubmitSpeakingTest(
    Mutation_SubmitSpeakingTest instance,
    TRes Function(Mutation_SubmitSpeakingTest) then,
  ) = _CopyWithImpl_Mutation_SubmitSpeakingTest;

  factory CopyWith_Mutation_SubmitSpeakingTest.stub(TRes res) =
      _CopyWithStubImpl_Mutation_SubmitSpeakingTest;

  TRes call({
    String? submitSpeakingTest,
    String? $__typename,
  });
}

class _CopyWithImpl_Mutation_SubmitSpeakingTest<TRes>
    implements CopyWith_Mutation_SubmitSpeakingTest<TRes> {
  _CopyWithImpl_Mutation_SubmitSpeakingTest(
    this._instance,
    this._then,
  );

  final Mutation_SubmitSpeakingTest _instance;

  final TRes Function(Mutation_SubmitSpeakingTest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? submitSpeakingTest = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation_SubmitSpeakingTest(
        submitSpeakingTest:
            submitSpeakingTest == _undefined || submitSpeakingTest == null
                ? _instance.submitSpeakingTest
                : (submitSpeakingTest as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl_Mutation_SubmitSpeakingTest<TRes>
    implements CopyWith_Mutation_SubmitSpeakingTest<TRes> {
  _CopyWithStubImpl_Mutation_SubmitSpeakingTest(this._res);

  TRes _res;

  call({
    String? submitSpeakingTest,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationSubmitSpeakingTest = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SubmitSpeakingTest'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'referenceText')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'audioFile')),
        type: NamedTypeNode(
          name: NameNode(value: 'Upload'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'submitSpeakingTest'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'referenceText'),
            value: VariableNode(name: NameNode(value: 'referenceText')),
          ),
          ArgumentNode(
            name: NameNode(value: 'audioFile'),
            value: VariableNode(name: NameNode(value: 'audioFile')),
          ),
        ],
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
