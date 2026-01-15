import 'package:gql/ast.dart';

class Fragment_TypingMistakeFields {
  Fragment_TypingMistakeFields({
    required this.error,
    required this.correction,
    required this.type,
    this.$__typename = 'TypingMistake',
  });

  factory Fragment_TypingMistakeFields.fromJson(Map<String, dynamic> json) {
    final l$error = json['error'];
    final l$correction = json['correction'];
    final l$type = json['type'];
    final l$$__typename = json['__typename'];
    return Fragment_TypingMistakeFields(
      error: (l$error as String),
      correction: (l$correction as String),
      type: (l$type as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String error;

  final String correction;

  final String type;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$error = error;
    _resultData['error'] = l$error;
    final l$correction = correction;
    _resultData['correction'] = l$correction;
    final l$type = type;
    _resultData['type'] = l$type;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$error = error;
    final l$correction = correction;
    final l$type = type;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$error,
      l$correction,
      l$type,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment_TypingMistakeFields) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$error = error;
    final lOther$error = other.error;
    if (l$error != lOther$error) {
      return false;
    }
    final l$correction = correction;
    final lOther$correction = other.correction;
    if (l$correction != lOther$correction) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
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

extension UtilityExtension_Fragment_TypingMistakeFields
    on Fragment_TypingMistakeFields {
  CopyWith_Fragment_TypingMistakeFields<Fragment_TypingMistakeFields>
      get copyWith => CopyWith_Fragment_TypingMistakeFields(
            this,
            (i) => i,
          );
}

abstract class CopyWith_Fragment_TypingMistakeFields<TRes> {
  factory CopyWith_Fragment_TypingMistakeFields(
    Fragment_TypingMistakeFields instance,
    TRes Function(Fragment_TypingMistakeFields) then,
  ) = _CopyWithImpl_Fragment_TypingMistakeFields;

  factory CopyWith_Fragment_TypingMistakeFields.stub(TRes res) =
      _CopyWithStubImpl_Fragment_TypingMistakeFields;

  TRes call({
    String? error,
    String? correction,
    String? type,
    String? $__typename,
  });
}

class _CopyWithImpl_Fragment_TypingMistakeFields<TRes>
    implements CopyWith_Fragment_TypingMistakeFields<TRes> {
  _CopyWithImpl_Fragment_TypingMistakeFields(
    this._instance,
    this._then,
  );

  final Fragment_TypingMistakeFields _instance;

  final TRes Function(Fragment_TypingMistakeFields) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? error = _undefined,
    Object? correction = _undefined,
    Object? type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment_TypingMistakeFields(
        error: error == _undefined || error == null
            ? _instance.error
            : (error as String),
        correction: correction == _undefined || correction == null
            ? _instance.correction
            : (correction as String),
        type: type == _undefined || type == null
            ? _instance.type
            : (type as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl_Fragment_TypingMistakeFields<TRes>
    implements CopyWith_Fragment_TypingMistakeFields<TRes> {
  _CopyWithStubImpl_Fragment_TypingMistakeFields(this._res);

  TRes _res;

  call({
    String? error,
    String? correction,
    String? type,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionTypingMistakeFields = FragmentDefinitionNode(
  name: NameNode(value: 'TypingMistakeFields'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'TypingMistake'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'error'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'correction'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'type'),
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
);
const documentNodeFragmentTypingMistakeFields = DocumentNode(definitions: [
  fragmentDefinitionTypingMistakeFields,
]);
