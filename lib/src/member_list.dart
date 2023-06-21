import 'package:flutter/material.dart';

import 'mention_member_model.dart';

class MemberList extends StatelessWidget {
  final List<MentionMemberModel> data;
  final Function(MentionMemberModel) onTap;

  const MemberList({required this.onTap, required this.data, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundImage: data[index].picture == null ||
                          data[index].picture!.isEmpty
                      ? null
                      : loadImage(data[index].picture!),
                ),
                const SizedBox(width: 16),
                Text(data[index].name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.black)),
              ],
            ),
            onTap: () => onTap(data[index]),
            selectedColor: const Color(0xFFF5F5F6),
          );
        });
  }

  ImageProvider loadImage(String imagePath) {
    if (imagePath.startsWith('http') || imagePath.startsWith('https')) {
      return NetworkImage(imagePath);
    } else {
      return AssetImage(imagePath);
    }
  }
}
