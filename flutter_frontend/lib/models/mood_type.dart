// ignore: constant_identifier_names
enum MoodType { HAPPY, SAD, NEUTRAL, ANGRY, EXCITED, TIRED, STRESSED }

extension MoodTypeX on MoodType {
  String get name => toString().split('.').last;

  static MoodType fromGraphQL(String value) {
    return MoodType.values.firstWhere((e) => e.name == value);
  }
}
