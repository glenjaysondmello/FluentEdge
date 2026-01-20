import '../fragments/typing/typing_mistake.fragment.graphql.dart';
import '../fragments/typing/typing_result.fragment.graphql.dart';
import 'package:gql/ast.dart';

class Variables_Mutation_SubmitTypingTest {
  factory Variables_Mutation_SubmitTypingTest({
    required String referenceText,
    required String userText,
    required double durationSec,
  }) => Variables_Mutation_SubmitTypingTest._({
    r'referenceText': referenceText,
    r'userText': userText,
    r'durationSec': durationSec,
  });

  Variables_Mutation_SubmitTypingTest._(this._$data);

  factory Variables_Mutation_SubmitTypingTest.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$referenceText = data['referenceText'];
    result$data['referenceText'] = (l$referenceText as String);
    final l$userText = data['userText'];
    result$data['userText'] = (l$userText as String);
    final l$durationSec = data['durationSec'];
    result$data['durationSec'] = (l$durationSec as num).toDouble();
    return Variables_Mutation_SubmitTypingTest._(result$data);
  }

  Map<String, dynamic> _$data;

  String get referenceText => (_$data['referenceText'] as String);

  String get userText => (_$data['userText'] as String);

  double get durationSec => (_$data['durationSec'] as double);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$referenceText = referenceText;
    result$data['referenceText'] = l$referenceText;
    final l$userText = userText;
    result$data['userText'] = l$userText;
    final l$durationSec = durationSec;
    result$data['durationSec'] = l$durationSec;
    return result$data;
  }

  CopyWith_Variables_Mutation_SubmitTypingTest<
    Variables_Mutation_SubmitTypingTest
  >
  get copyWith => CopyWith_Variables_Mutation_SubmitTypingTest(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables_Mutation_SubmitTypingTest ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$referenceText = referenceText;
    final lOther$referenceText = other.referenceText;
    if (l$referenceText != lOther$referenceText) {
      return false;
    }
    final l$userText = userText;
    final lOther$userText = other.userText;
    if (l$userText != lOther$userText) {
      return false;
    }
    final l$durationSec = durationSec;
    final lOther$durationSec = other.durationSec;
    if (l$durationSec != lOther$durationSec) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$referenceText = referenceText;
    final l$userText = userText;
    final l$durationSec = durationSec;
    return Object.hashAll([l$referenceText, l$userText, l$durationSec]);
  }
}

abstract class CopyWith_Variables_Mutation_SubmitTypingTest<TRes> {
  factory CopyWith_Variables_Mutation_SubmitTypingTest(
    Variables_Mutation_SubmitTypingTest instance,
    TRes Function(Variables_Mutation_SubmitTypingTest) then,
  ) = _CopyWithImpl_Variables_Mutation_SubmitTypingTest;

  factory CopyWith_Variables_Mutation_SubmitTypingTest.stub(TRes res) =
      _CopyWithStubImpl_Variables_Mutation_SubmitTypingTest;

  TRes call({String? referenceText, String? userText, double? durationSec});
}

class _CopyWithImpl_Variables_Mutation_SubmitTypingTest<TRes>
    implements CopyWith_Variables_Mutation_SubmitTypingTest<TRes> {
  _CopyWithImpl_Variables_Mutation_SubmitTypingTest(this._instance, this._then);

  final Variables_Mutation_SubmitTypingTest _instance;

  final TRes Function(Variables_Mutation_SubmitTypingTest) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? referenceText = _undefined,
    Object? userText = _undefined,
    Object? durationSec = _undefined,
  }) => _then(
    Variables_Mutation_SubmitTypingTest._({
      ..._instance._$data,
      if (referenceText != _undefined && referenceText != null)
        'referenceText': (referenceText as String),
      if (userText != _undefined && userText != null)
        'userText': (userText as String),
      if (durationSec != _undefined && durationSec != null)
        'durationSec': (durationSec as double),
    }),
  );
}

class _CopyWithStubImpl_Variables_Mutation_SubmitTypingTest<TRes>
    implements CopyWith_Variables_Mutation_SubmitTypingTest<TRes> {
  _CopyWithStubImpl_Variables_Mutation_SubmitTypingTest(this._res);

  final TRes _res;

  @override
  call({String? referenceText, String? userText, double? durationSec}) => _res;
}

class Mutation_SubmitTypingTest {
  Mutation_SubmitTypingTest({
    required this.submitTypingTest,
    this.$__typename = 'Mutation',
  });

  factory Mutation_SubmitTypingTest.fromJson(Map<String, dynamic> json) {
    final l$submitTypingTest = json['submitTypingTest'];
    final l$$__typename = json['__typename'];
    return Mutation_SubmitTypingTest(
      submitTypingTest: Mutation_SubmitTypingTest_submitTypingTest.fromJson(
        (l$submitTypingTest as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation_SubmitTypingTest_submitTypingTest submitTypingTest;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$submitTypingTest = submitTypingTest;
    resultData['submitTypingTest'] = l$submitTypingTest.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$submitTypingTest = submitTypingTest;
    final l$$__typename = $__typename;
    return Object.hashAll([l$submitTypingTest, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation_SubmitTypingTest ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$submitTypingTest = submitTypingTest;
    final lOther$submitTypingTest = other.submitTypingTest;
    if (l$submitTypingTest != lOther$submitTypingTest) {
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

extension UtilityExtension_Mutation_SubmitTypingTest
    on Mutation_SubmitTypingTest {
  CopyWith_Mutation_SubmitTypingTest<Mutation_SubmitTypingTest> get copyWith =>
      CopyWith_Mutation_SubmitTypingTest(this, (i) => i);
}

abstract class CopyWith_Mutation_SubmitTypingTest<TRes> {
  factory CopyWith_Mutation_SubmitTypingTest(
    Mutation_SubmitTypingTest instance,
    TRes Function(Mutation_SubmitTypingTest) then,
  ) = _CopyWithImpl_Mutation_SubmitTypingTest;

  factory CopyWith_Mutation_SubmitTypingTest.stub(TRes res) =
      _CopyWithStubImpl_Mutation_SubmitTypingTest;

  TRes call({
    Mutation_SubmitTypingTest_submitTypingTest? submitTypingTest,
    String? $__typename,
  });
  CopyWith_Mutation_SubmitTypingTest_submitTypingTest<TRes>
  get submitTypingTest;
}

class _CopyWithImpl_Mutation_SubmitTypingTest<TRes>
    implements CopyWith_Mutation_SubmitTypingTest<TRes> {
  _CopyWithImpl_Mutation_SubmitTypingTest(this._instance, this._then);

  final Mutation_SubmitTypingTest _instance;

  final TRes Function(Mutation_SubmitTypingTest) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? submitTypingTest = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation_SubmitTypingTest(
      submitTypingTest:
          submitTypingTest == _undefined || submitTypingTest == null
          ? _instance.submitTypingTest
          : (submitTypingTest as Mutation_SubmitTypingTest_submitTypingTest),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  @override
  CopyWith_Mutation_SubmitTypingTest_submitTypingTest<TRes>
  get submitTypingTest {
    final local$submitTypingTest = _instance.submitTypingTest;
    return CopyWith_Mutation_SubmitTypingTest_submitTypingTest(
      local$submitTypingTest,
      (e) => call(submitTypingTest: e),
    );
  }
}

class _CopyWithStubImpl_Mutation_SubmitTypingTest<TRes>
    implements CopyWith_Mutation_SubmitTypingTest<TRes> {
  _CopyWithStubImpl_Mutation_SubmitTypingTest(this._res);

  final TRes _res;

  @override
  call({
    Mutation_SubmitTypingTest_submitTypingTest? submitTypingTest,
    String? $__typename,
  }) => _res;

  @override
  CopyWith_Mutation_SubmitTypingTest_submitTypingTest<TRes>
  get submitTypingTest =>
      CopyWith_Mutation_SubmitTypingTest_submitTypingTest.stub(_res);
}

const documentNodeMutationSubmitTypingTest = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SubmitTypingTest'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'referenceText')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'userText')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'durationSec')),
          type: NamedTypeNode(name: NameNode(value: 'Float'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'submitTypingTest'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'referenceText'),
                value: VariableNode(name: NameNode(value: 'referenceText')),
              ),
              ArgumentNode(
                name: NameNode(value: 'userText'),
                value: VariableNode(name: NameNode(value: 'userText')),
              ),
              ArgumentNode(
                name: NameNode(value: 'durationSec'),
                value: VariableNode(name: NameNode(value: 'durationSec')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'TypingResultFields'),
                  directives: [],
                ),
                FieldNode(
                  name: NameNode(value: 'mistakes'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FragmentSpreadNode(
                        name: NameNode(value: 'TypingMistakeFields'),
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
                  name: NameNode(value: 'encouragement'),
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
    fragmentDefinitionTypingResultFields,
    fragmentDefinitionTypingMistakeFields,
  ],
);

class Mutation_SubmitTypingTest_submitTypingTest
    implements Fragment_TypingResultFields {
  Mutation_SubmitTypingTest_submitTypingTest({
    required this.id,
    required this.referenceText,
    required this.wpm,
    required this.cpm,
    required this.accuracy,
    required this.score,
    required this.createdAt,
    this.$__typename = 'TypingTest',
    required this.mistakes,
    this.suggestions,
    this.encouragement,
  });

  factory Mutation_SubmitTypingTest_submitTypingTest.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$referenceText = json['referenceText'];
    final l$wpm = json['wpm'];
    final l$cpm = json['cpm'];
    final l$accuracy = json['accuracy'];
    final l$score = json['score'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    final l$mistakes = json['mistakes'];
    final l$suggestions = json['suggestions'];
    final l$encouragement = json['encouragement'];
    return Mutation_SubmitTypingTest_submitTypingTest(
      id: (l$id as String),
      referenceText: (l$referenceText as String),
      wpm: (l$wpm as num).toDouble(),
      cpm: (l$cpm as num).toDouble(),
      accuracy: (l$accuracy as num).toDouble(),
      score: (l$score as num).toDouble(),
      createdAt: (l$createdAt as String),
      $__typename: (l$$__typename as String),
      mistakes: (l$mistakes as List<dynamic>)
          .map(
            (e) => Fragment_TypingMistakeFields.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      suggestions: (l$suggestions as String?),
      encouragement: (l$encouragement as String?),
    );
  }

  @override
  final String id;

  @override
  final String referenceText;

  @override
  final double wpm;

  @override
  final double cpm;

  @override
  final double accuracy;

  @override
  final double score;

  @override
  final String createdAt;

  @override
  final String $__typename;

  final List<Fragment_TypingMistakeFields> mistakes;

  final String? suggestions;

  final String? encouragement;

  @override
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
    final l$mistakes = mistakes;
    resultData['mistakes'] = l$mistakes.map((e) => e.toJson()).toList();
    final l$suggestions = suggestions;
    resultData['suggestions'] = l$suggestions;
    final l$encouragement = encouragement;
    resultData['encouragement'] = l$encouragement;
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
    final l$mistakes = mistakes;
    final l$suggestions = suggestions;
    final l$encouragement = encouragement;
    return Object.hashAll([
      l$id,
      l$referenceText,
      l$wpm,
      l$cpm,
      l$accuracy,
      l$score,
      l$createdAt,
      l$$__typename,
      Object.hashAll(l$mistakes.map((v) => v)),
      l$suggestions,
      l$encouragement,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation_SubmitTypingTest_submitTypingTest ||
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
    final l$encouragement = encouragement;
    final lOther$encouragement = other.encouragement;
    if (l$encouragement != lOther$encouragement) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension_Mutation_SubmitTypingTest_submitTypingTest
    on Mutation_SubmitTypingTest_submitTypingTest {
  CopyWith_Mutation_SubmitTypingTest_submitTypingTest<
    Mutation_SubmitTypingTest_submitTypingTest
  >
  get copyWith =>
      CopyWith_Mutation_SubmitTypingTest_submitTypingTest(this, (i) => i);
}

abstract class CopyWith_Mutation_SubmitTypingTest_submitTypingTest<TRes> {
  factory CopyWith_Mutation_SubmitTypingTest_submitTypingTest(
    Mutation_SubmitTypingTest_submitTypingTest instance,
    TRes Function(Mutation_SubmitTypingTest_submitTypingTest) then,
  ) = _CopyWithImpl_Mutation_SubmitTypingTest_submitTypingTest;

  factory CopyWith_Mutation_SubmitTypingTest_submitTypingTest.stub(TRes res) =
      _CopyWithStubImpl_Mutation_SubmitTypingTest_submitTypingTest;

  TRes call({
    String? id,
    String? referenceText,
    double? wpm,
    double? cpm,
    double? accuracy,
    double? score,
    String? createdAt,
    String? $__typename,
    List<Fragment_TypingMistakeFields>? mistakes,
    String? suggestions,
    String? encouragement,
  });
  TRes mistakes(
    Iterable<Fragment_TypingMistakeFields> Function(
      Iterable<
        CopyWith_Fragment_TypingMistakeFields<Fragment_TypingMistakeFields>
      >,
    )
    fn,
  );
}

class _CopyWithImpl_Mutation_SubmitTypingTest_submitTypingTest<TRes>
    implements CopyWith_Mutation_SubmitTypingTest_submitTypingTest<TRes> {
  _CopyWithImpl_Mutation_SubmitTypingTest_submitTypingTest(
    this._instance,
    this._then,
  );

  final Mutation_SubmitTypingTest_submitTypingTest _instance;

  final TRes Function(Mutation_SubmitTypingTest_submitTypingTest) _then;

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
    Object? mistakes = _undefined,
    Object? suggestions = _undefined,
    Object? encouragement = _undefined,
  }) => _then(
    Mutation_SubmitTypingTest_submitTypingTest(
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
      mistakes: mistakes == _undefined || mistakes == null
          ? _instance.mistakes
          : (mistakes as List<Fragment_TypingMistakeFields>),
      suggestions: suggestions == _undefined
          ? _instance.suggestions
          : (suggestions as String?),
      encouragement: encouragement == _undefined
          ? _instance.encouragement
          : (encouragement as String?),
    ),
  );

  @override
  TRes mistakes(
    Iterable<Fragment_TypingMistakeFields> Function(
      Iterable<
        CopyWith_Fragment_TypingMistakeFields<Fragment_TypingMistakeFields>
      >,
    )
    fn,
  ) => call(
    mistakes: fn(
      _instance.mistakes.map(
        (e) => CopyWith_Fragment_TypingMistakeFields(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl_Mutation_SubmitTypingTest_submitTypingTest<TRes>
    implements CopyWith_Mutation_SubmitTypingTest_submitTypingTest<TRes> {
  _CopyWithStubImpl_Mutation_SubmitTypingTest_submitTypingTest(this._res);

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
    List<Fragment_TypingMistakeFields>? mistakes,
    String? suggestions,
    String? encouragement,
  }) => _res;

  @override
  mistakes(fn) => _res;
}
