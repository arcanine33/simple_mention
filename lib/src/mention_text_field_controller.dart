import 'package:flutter/material.dart';
import 'package:simple_mention/src/mention_member_model.dart';

class MentionTextFieldController extends TextEditingController {
  final String pattern;
  final String myName;
  List<MentionMemberModel> memberList;
  final Color mentionColor;
  final Color myNameColor;

  MentionTextFieldController({
    this.pattern = '@',
    required this.myName,
    required this.memberList,
    this.mentionColor = Colors.blue,
    this.myNameColor = Colors.green,
  });

  @override
  TextSpan buildTextSpan(
      {BuildContext? context, TextStyle? style, bool? withComposing}) {
    var children = <InlineSpan>[];
    if (pattern == '()') {
      children.add(TextSpan(text: text, style: style));
    } else {
      text.splitMapJoin(
        RegExp(r"[^a-zA-Z0-9가-힣ㄱ-ㅎ\s][^@](.*?)(?=\s)"),
        onMatch: (Match match) {
          if (memberList.map((e) => e.nameForMention).contains(match[0]!.substring(1).trim())) {
            if (match[0]!.substring(1).trim() == myName) {

              children.add(
                TextSpan(
                  text: match[0],
                  style: TextStyle(
                    color: myNameColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            } else {
              children.add(
                TextSpan(
                  text: match[0],
                  style: TextStyle(
                    color: mentionColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
          } else {
            children.add(TextSpan(text: match[0], style: style));
          }
          return '';
        },
        onNonMatch: (String text) {
          children.add(TextSpan(text: text, style: style));
          return '';
        },
      );
    }

    return TextSpan(style: style, children: children);
  }
}
