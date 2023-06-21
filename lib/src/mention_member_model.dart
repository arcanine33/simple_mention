class MentionMemberModel {
  final String uid;
  final String name;
  late final String nameForMention;
  final String? picture;

  MentionMemberModel({
    required this.uid,
    required this.name,
    this.picture,
  }) {
    nameForMention = name.replaceAllMapped(' ', (match) => '_');
  }
}