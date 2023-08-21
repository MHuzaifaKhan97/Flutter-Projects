import 'package:architecture_basics/domain/entities/user.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user, required this.onTap});
  final User user;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(user.name ?? ""),
          subtitle:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(user.email ?? ""),
            Text(user.phone ?? ""),
            Text(user.website ?? ""),
          ]),
          leading: CircleAvatar(child: Text(user.name![0])),
        ),
      ),
    );
  }
}
