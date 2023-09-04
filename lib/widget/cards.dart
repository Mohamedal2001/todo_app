import 'package:flutter/material.dart';

class cards extends StatelessWidget {
  final String title;
  final bool ic;
  final Function changest;
  final int count_list;
  final Function deletecard;

  cards(
      {super.key,
      required this.title,
      required this.ic,
      required this.changest,
      required this.count_list,
      required this.deletecard});

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changest(count_list);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 53, 47, 68)),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      deletecard(count_list);
                    },
                    child: Icon(
                      Icons.delete,
                      size: 40,
                      color: Color.fromARGB(255, 247, 80, 68),
                    ),
                  ),
                  ic
                      ? Icon(
                          Icons.check,
                          size: 40,
                          color: Colors.green,
                        )
                      : Icon(
                          Icons.close,
                          size: 40,
                          color: Colors.red,
                        ),
                ],
              )
            ],
          ),
          margin: EdgeInsets.all(25),
          padding: EdgeInsets.only(left: 5, right: 5),
          color: Color.fromARGB(255, 185, 180, 199),
          height: 50,
        ),
      ),
    );
  }
}
