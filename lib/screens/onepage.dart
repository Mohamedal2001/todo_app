import 'package:flutter/material.dart';
import 'package:todo_app/widget/cards.dart';
import 'package:todo_app/model/Todo_model.dart';
import 'package:todo_app/widget/cont.dart';

class one_page extends StatefulWidget {
  const one_page({super.key});

  @override
  State<one_page> createState() => _one_pageState();
}

class _one_pageState extends State<one_page> {
  String mytext = "";
  final mycontr = TextEditingController();
  addnewtask() {
    setState(() {
      todo_list.add(Todo_model(title: mycontr.text, status: false));
    });
  }

  int count() {
    int i = 0;
    for (var item in todo_list) {
      item.status ? i++ : i = i;
    }
    return i;
  }

  changest(int taskindex) {
    setState(() {
      todo_list[taskindex].status = !todo_list[taskindex].status;
    });
  }

  deletecard(int taskindex) {
    setState(() {
      todo_list.remove(todo_list[taskindex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.amber,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: mycontr,
                        decoration: InputDecoration(
                            hintText: "add new task",
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 5))),
                      ),
                      TextButton(
                          onPressed: () {
                            addnewtask();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "ADD",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          )),
                    ],
                  ),
                );
              });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Color.fromARGB(255, 92, 84, 112),
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              todo_list.clear();
              setState(() {});
            },
            child: Icon(
              Icons.delete,
              size: 40,
              color: Colors.red,
            ),
          )
        ],
        backgroundColor: Color.fromARGB(255, 53, 47, 68),
        title: Text(
          "TO DO APP",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        color: Color.fromARGB(255, 92, 84, 112),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            w_count(allcomplete: todo_list.length, alltodo: count()),
            Container(
              height: 600,
              child: ListView.builder(
                  itemCount: todo_list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return cards(
                      title: todo_list[index].title,
                      ic: todo_list[index].status,
                      changest: changest,
                      count_list: index,
                      deletecard: deletecard,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
