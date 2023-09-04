class Todo_model {
  String title;
  bool status;

  Todo_model({required this.title, required this.status});
}

List todo_list = [
  Todo_model(title: "playstion", status: true),
  Todo_model(title: "Xbox", status: true),
  Todo_model(title: "gym", status: true),
  Todo_model(title: "study", status: false)
];
