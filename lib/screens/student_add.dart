import 'package:flutter/material.dart';
import 'package:flutter_2/models/student.dart';

class StudentAdd extends StatefulWidget {
  final List<Student> students;

  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State {
  Student student = Student("", "", 0); // student değişkeni tanımlandı

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Öğrenci"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildLastGradeField(),
              // Diğer alanları da ekleyebilirsiniz.
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci adı", hintText: "Engin"),
      initialValue: student.firstName,
      onSaved: (String? value) {
        student.firstName = value ?? "";
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Öğrenci soyadı", hintText: "Demiro"),
      initialValue: student.lastName,
      onSaved: (String? value) {
        student.lastName = value ?? "";
      },
    );
  }

  Widget buildLastGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı not", hintText: "65"),
      initialValue: student.grade.toString(),
      onSaved: (String? value) {
        student.grade = int.tryParse(value ?? "0") ?? 0;
      },
    );
  }
}
