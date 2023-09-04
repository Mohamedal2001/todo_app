import 'package:flutter/material.dart';

class w_count extends StatelessWidget {
  final int allcomplete;
  final int alltodo;
  const w_count({Key? key, required this.allcomplete, required this.alltodo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: allcomplete == alltodo
          ? Text(
              "${allcomplete}/$alltodo",
              style: TextStyle(fontSize: 60, color: Colors.green),
            )
          : Text(
              "${allcomplete}/$alltodo",
              style: TextStyle(fontSize: 60, color: Colors.white),
            ),
    );
  }
}
