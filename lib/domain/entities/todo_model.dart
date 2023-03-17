import 'package:get/get.dart';

class TodoModel {
  // int id;
  // String title;
  // RxBool? isCompleted = false.obs;
  //
  // TodoModel({required this.id, required this.title, this.isCompleted});
  //
  // Map<String, dynamic> toMap() => {
  //       'id': id,
  //       'title': title,
  //       'isCompleted': isCompleted,
  //     };
  //
  // factory TodoModel.fromMap(Map<String, dynamic> map) => TodoModel(
  //       id: map['id'],
  //       title: map['title'],
  //       isCompleted: map['isCompleted'],
  //     );
  int id;
  String title;
  bool isCompleted;

  TodoModel({required this.id, required this.title, this.isCompleted = false});

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'isCompleted': isCompleted ? 1 : 0,
  };

  factory TodoModel.fromMap(Map<String, dynamic> map) => TodoModel(
    id: map['id'],
    title: map['title'],
    isCompleted: map['isCompleted'] == 1,
  );
}
