import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  final Map data;
  const UserDetail({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Detail '),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage((data["avatar"])),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(data["first_name"] + " " + data["last_name"]),
          const SizedBox(
            height: 10,
          ),
          Text(data["email"]),
        ],
      )),
    );
  }
}
