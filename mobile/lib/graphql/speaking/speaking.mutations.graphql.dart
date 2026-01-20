import '../fragments/speaking/speaking_mistake.fragment.graphql.dart';
import '../fragments/speaking/speaking_score.fragment.graphql.dart';
import 'package:gql/ast.dart';
import 'package:http/http.dart';

class Variables_Mutation_SubmitSpeakingTest {
  factory Variables_Mutation_SubmitSpeakingTest({
    required String referenceText,
    required MultipartFile audioFile,
  }) => Variables_Mutation_SubmitSpeakingTest._({
    r'referenceText': referenceText,
    r'audioFile': audioFile,
  });

  Variables_Mutation_SubmitSpeakingTest._(this._$data);

  factory Variables_Mutation_SubmitSpeakingTest.fromJson(
    Map<String, dynamic> data,
  ) {
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
    Variables_Mutation_SubmitSpeakingTest
  >
  get copyWith =>
      CopyWith_Variables_Mutation_SubmitSpeakingTest(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables_Mutation_SubmitSpeakingTest ||
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
    return Object.hashAll([l$referenceText, l$audioFile]);
  }
}

abstract class CopyWith_Variables_Mutation_SubmitSpeakingTest<TRes> {
  factory CopyWith_Variables_Mutation_SubmitSpeakingTest(
    Variables_Mutation_SubmitSpeakingTest instance,
    TRes Function(Variables_Mutation_SubmitSpeakingTest) then,
  ) = _CopyWithImpl_Variables_Mutation_SubmitSpeakingTest;

  factory CopyWith_Variables_Mutation_SubmitSpeakingTest.stub(TRes res) =
      _CopyWithStubImpl_Variables_Mutation_SubmitSpeakingTest;

  TRes call({String? referenceText, MultipartFile? audioFile});
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

  @override
  TRes call({
    Object? referenceText = _undefined,
    Object? audioFile = _undefined,
  }) => _then(
    Variables_Mutation_SubmitSpeakingTest._({
      ..._instance._$data,
      if (referenceText != _undefined && referenceText != null)
        'referenceText': (referenceText as String),
      if (audioFile != _undefined && audioFile != null)
        'audioFile': (audioFile as MultipartFile),
    }),
  );
}

class _CopyWithStubImpl_Variables_Mutation_SubmitSpeakingTest<TRes>
    implements CopyWith_Variables_Mutation_SubmitSpeakingTest<TRes> {
  _CopyWithStubImpl_Variables_Mutation_SubmitSpeakingTest(this._res);

  final TRes _res;

  @override
  call({String? referenceText, MultipartFile? audioFile}) => _res;
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
      submitSpeakingTest:
          Mutation_SubmitSpeakingTest_submitSpeakingTest.fromJson(
            (l$submitSpeakingTest as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation_SubmitSpeakingTest_submitSpeakingTest submitSpeakingTest;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$submitSpeakingTest = submitSpeakingTest;
    resultData['submitSpeakingTest'] = l$submitSpeakingTest.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$submitSpeakingTest = submitSpeakingTest;
    final l$$__typename = $__typename;
    return Object.hashAll([l$submitSpeakingTest, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation_SubmitSpeakingTest ||
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
  get copyWith => CopyWith_Mutation_SubmitSpeakingTest(this, (i) => i);
}

abstract class CopyWith_Mutation_SubmitSpeakingTest<TRes> {
  factory CopyWith_Mutation_SubmitSpeakingTest(
    Mutation_SubmitSpeakingTest instance,
    TRes Function(Mutation_SubmitSpeakingTest) then,
  ) = _CopyWithImpl_Mutation_SubmitSpeakingTest;

  factory CopyWith_Mutation_SubmitSpeakingTest.stub(TRes res) =
      _CopyWithStubImpl_Mutation_SubmitSpeakingTest;

  TRes call({
    Mutation_SubmitSpeakingTest_submitSpeakingTest? submitSpeakingTest,
    String? $__typename,
  });
  CopyWith_Mutation_SubmitSpeakingTest_submitSpeakingTest<TRes>
  get submitSpeakingTest;
}

class _CopyWithImpl_Mutation_SubmitSpeakingTest<TRes>
    implements CopyWith_Mutation_SubmitSpeakingTest<TRes> {
  _CopyWithImpl_Mutation_SubmitSpeakingTest(this._instance, this._then);

  final Mutation_SubmitSpeakingTest _instance;

  final TRes Function(Mutation_SubmitSpeakingTest) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? submitSpeakingTest = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation_SubmitSpeakingTest(
      submitSpeakingTest:
          submitSpeakingTest == _undefined || submitSpeakingTest == null
          ? _instance.submitSpeakingTest
          : (submitSpeakingTest
                as Mutation_SubmitSpeakingTest_submitSpeakingTest),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  @override
  CopyWith_Mutation_SubmitSpeakingTest_submitSpeakingTest<TRes>
  get submitSpeakingTest {
    final local$submitSpeakingTest = _instance.submitSpeakingTest;
    return CopyWith_Mutation_SubmitSpeakingTest_submitSpeakingTest(
      local$submitSpeakingTest,
      (e) => call(submitSpeakingTest: e),
    );
  }
}

class _CopyWithStubImpl_Mutation_SubmitSpeakingTest<TRes>
    implements CopyWith_Mutation_SubmitSpeakingTest<TRes> {
  _CopyWithStubImpl_Mutation_SubmitSpeakingTest(this._res);

  final TRes _res;

  @override
  call({
    Mutation_SubmitSpeakingTest_submitSpeakingTest? submitSpeakingTest,
    String? $__typename,
  }) => _res;

  @override
  CopyWith_Mutation_SubmitSpeakingTest_submitSpeakingTest<TRes>
  get submitSpeakingTest =>
      CopyWith_Mutation_SubmitSpeakingTest_submitSpeakingTest.stub(_res);
}

const documentNodeMutationSubmitSpeakingTest = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SubmitSpeakingTest'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'referenceText')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'audioFile')),
          type: NamedTypeNode(name: NameNode(value: 'Upload'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
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
                  selectionSet: SelectionSetNode(
                    selections: [
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
                    ],
                  ),
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
                  selectionSet: SelectionSetNode(
                    selections: [
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
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: 'suggestions'),
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
    ),
    fragmentDefinitionSpeakingScoreFields,
    fragmentDefinitionSpeakingMistakeFields,
  ],
);

class Mutation_SubmitSpeakingTest_submitSpeakingTest {
  Mutation_SubmitSpeakingTest_submitSpeakingTest({
    required this.id,
    required this.transcript,
    required this.scores,
    this.encouragement,
    required this.mistakes,
    this.suggestions,
    this.$__typename = 'SpeakingTest',
  });

  factory Mutation_SubmitSpeakingTest_submitSpeakingTest.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$transcript = json['transcript'];
    final l$scores = json['scores'];
    final l$encouragement = json['encouragement'];
    final l$mistakes = json['mistakes'];
    final l$suggestions = json['suggestions'];
    final l$$__typename = json['__typename'];
    return Mutation_SubmitSpeakingTest_submitSpeakingTest(
      id: (l$id as String),
      transcript: (l$transcript as String),
      scores: Fragment_SpeakingScoreFields.fromJson(
        (l$scores as Map<String, dynamic>),
      ),
      encouragement: (l$encouragement as String?),
      mistakes: (l$mistakes as List<dynamic>)
          .map(
            (e) => Fragment_SpeakingMistakeFields.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      suggestions: (l$suggestions as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String transcript;

  final Fragment_SpeakingScoreFields scores;

  final String? encouragement;

  final List<Fragment_SpeakingMistakeFields> mistakes;

  final String? suggestions;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$id = id;
    resultData['id'] = l$id;
    final l$transcript = transcript;
    resultData['transcript'] = l$transcript;
    final l$scores = scores;
    resultData['scores'] = l$scores.toJson();
    final l$encouragement = encouragement;
    resultData['encouragement'] = l$encouragement;
    final l$mistakes = mistakes;
    resultData['mistakes'] = l$mistakes.map((e) => e.toJson()).toList();
    final l$suggestions = suggestions;
    resultData['suggestions'] = l$suggestions;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$transcript = transcript;
    final l$scores = scores;
    final l$encouragement = encouragement;
    final l$mistakes = mistakes;
    final l$suggestions = suggestions;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$transcript,
      l$scores,
      l$encouragement,
      Object.hashAll(l$mistakes.map((v) => v)),
      l$suggestions,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation_SubmitSpeakingTest_submitSpeakingTest ||
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
    final l$suggestions = suggestions;
    final lOther$suggestions = other.suggestions;
    if (l$suggestions != lOther$suggestions) {
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

extension UtilityExtension_Mutation_SubmitSpeakingTest_submitSpeakingTest
    on Mutation_SubmitSpeakingTest_submitSpeakingTest {
  CopyWith_Mutation_SubmitSpeakingTest_submitSpeakingTest<
    Mutation_SubmitSpeakingTest_submitSpeakingTest
  >
  get copyWith =>
      CopyWith_Mutation_SubmitSpeakingTest_submitSpeakingTest(this, (i) => i);
}

abstract class CopyWith_Mutation_SubmitSpeakingTest_submitSpeakingTest<TRes> {
  factory CopyWith_Mutation_SubmitSpeakingTest_submitSpeakingTest(
    Mutation_SubmitSpeakingTest_submitSpeakingTest instance,
    TRes Function(Mutation_SubmitSpeakingTest_submitSpeakingTest) then,
  ) = _CopyWithImpl_Mutation_SubmitSpeakingTest_submitSpeakingTest;

  factory CopyWith_Mutation_SubmitSpeakingTest_submitSpeakingTest.stub(
    TRes res,
  ) = _CopyWithStubImpl_Mutation_SubmitSpeakingTest_submitSpeakingTest;

  TRes call({
    String? id,
    String? transcript,
    Fragment_SpeakingScoreFields? scores,
    String? encouragement,
    List<Fragment_SpeakingMistakeFields>? mistakes,
    String? suggestions,
    String? $__typename,
  });
  CopyWith_Fragment_SpeakingScoreFields<TRes> get scores;
  TRes mistakes(
    Iterable<Fragment_SpeakingMistakeFields> Function(
      Iterable<
        CopyWith_Fragment_SpeakingMistakeFields<Fragment_SpeakingMistakeFields>
      >,
    )
    fn,
  );
}

class _CopyWithImpl_Mutation_SubmitSpeakingTest_submitSpeakingTest<TRes>
    implements CopyWith_Mutation_SubmitSpeakingTest_submitSpeakingTest<TRes> {
  _CopyWithImpl_Mutation_SubmitSpeakingTest_submitSpeakingTest(
    this._instance,
    this._then,
  );

  final Mutation_SubmitSpeakingTest_submitSpeakingTest _instance;

  final TRes Function(Mutation_SubmitSpeakingTest_submitSpeakingTest) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? transcript = _undefined,
    Object? scores = _undefined,
    Object? encouragement = _undefined,
    Object? mistakes = _undefined,
    Object? suggestions = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation_SubmitSpeakingTest_submitSpeakingTest(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      transcript: transcript == _undefined || transcript == null
          ? _instance.transcript
          : (transcript as String),
      scores: scores == _undefined || scores == null
          ? _instance.scores
          : (scores as Fragment_SpeakingScoreFields),
      encouragement: encouragement == _undefined
          ? _instance.encouragement
          : (encouragement as String?),
      mistakes: mistakes == _undefined || mistakes == null
          ? _instance.mistakes
          : (mistakes as List<Fragment_SpeakingMistakeFields>),
      suggestions: suggestions == _undefined
          ? _instance.suggestions
          : (suggestions as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  @override
  CopyWith_Fragment_SpeakingScoreFields<TRes> get scores {
    final local$scores = _instance.scores;
    return CopyWith_Fragment_SpeakingScoreFields(
      local$scores,
      (e) => call(scores: e),
    );
  }

  @override
  TRes mistakes(
    Iterable<Fragment_SpeakingMistakeFields> Function(
      Iterable<
        CopyWith_Fragment_SpeakingMistakeFields<Fragment_SpeakingMistakeFields>
      >,
    )
    fn,
  ) => call(
    mistakes: fn(
      _instance.mistakes.map(
        (e) => CopyWith_Fragment_SpeakingMistakeFields(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl_Mutation_SubmitSpeakingTest_submitSpeakingTest<TRes>
    implements CopyWith_Mutation_SubmitSpeakingTest_submitSpeakingTest<TRes> {
  _CopyWithStubImpl_Mutation_SubmitSpeakingTest_submitSpeakingTest(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? transcript,
    Fragment_SpeakingScoreFields? scores,
    String? encouragement,
    List<Fragment_SpeakingMistakeFields>? mistakes,
    String? suggestions,
    String? $__typename,
  }) => _res;

  @override
  CopyWith_Fragment_SpeakingScoreFields<TRes> get scores =>
      CopyWith_Fragment_SpeakingScoreFields.stub(_res);

  @override
  mistakes(fn) => _res;
}
