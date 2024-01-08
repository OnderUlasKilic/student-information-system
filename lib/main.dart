import 'package:flutter/material.dart';
import 'package:flutter_2/models/student.dart';
import 'package:flutter_2/screens/student_add.dart';
import 'package:flutter_2/screens/student_update.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1, "Baris", "K", 39),
    Student.withId(2, "Berkay", "K", 100),
    Student.withId(3, "Meryem", "D", 49),
  ];

  Student selectedStudent = Student.withId(0, "Hiç Kimse", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Öğrenci Takip Sistemi!"),
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                      "${students[index].firstName} ${students[index].lastName}"),
                  subtitle: Text(
                      "Sınavdan aldığı not: ${students[index].grade} [${students[index].getStatus}]"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://odb.esenyurt.edu.tr/Uploads/odb/HizliMenu/Orjinal/f5860b5e-e53e-4102-90a5-9bf71ef433e3-ogrenci-isleri.png"),
                  ),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      this.selectedStudent = students[index];
                    });

                    print(this.selectedStudent.firstName);
                  },
                  onLongPress: () {
                    print("Uzun Basıldı");
                  },
                );
              }),
        ),
        Text("Seçili öğrenci " + selectedStudent.firstName),
        Row(children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 8,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.greenAccent,
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.add),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text("Yeni Öğrenci")
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentAdd(students),
                  ),
                ).then((value) => setState(() {}));
              },
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 7,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black12,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Güncelle")
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          StudentUpdate(student: selectedStudent),
                    ),
                  ).then((value) => setState(() {}));
                }),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 5,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.amberAccent,
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.add),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text("Sil")
                ],
              ),
              onPressed: () {
                print("Sil");
              },
            ),
          ),
        ])
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
