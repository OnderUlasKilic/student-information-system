import 'package:flutter/material.dart';
import 'package:flutter_2/models/student.dart';
import 'package:flutter_2/screens/student_add.dart';
import 'package:flutter_2/screens/student_update.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://odb.esenyurt.edu.tr/Uploads/odb/HizliMenu/Orjinal/f5860b5e-e53e-4102-90a5-9bf71ef433e3-ogrenci-isleri.png"),
                  ),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      selectedStudent = students[index];
                    });

                    print(selectedStudent.firstName);
                  },
                  onLongPress: () {
                    print("Uzun Basıldı");
                  },
                );
              }),
        ),
        Text("Seçili öğrenci ${selectedStudent.firstName}"),
        Row(children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 8,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
              child: const Row(
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
                  backgroundColor: Colors.black12,
                ),
                child: const Row(
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
                backgroundColor: Colors.amberAccent,
              ),
              child: const Row(
                children: <Widget>[
                  Icon(Icons.add),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text("Sil")
                ],
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Onay'),
                      content: Text(
                          'Seçili öğrenciyi silmek istediğinize emin misiniz?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('İptal'),
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Kullanıcı iptal ederse dialog kapatılır
                          },
                        ),
                        TextButton(
                          child: Text('Sil'),
                          onPressed: () {
                            setState(() {
                              students.remove(selectedStudent);
                            });
                            Navigator.of(context).pop(); // Dialog kapatılır
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ])
      ],
    );
  }

  Widget buildStatusIcon(int? grade) {
    if (grade != null) {
      if (grade >= 50) {
        return const Icon(Icons.done);
      } else if (grade >= 40) {
        return const Icon(Icons.album);
      } else {
        return const Icon(Icons.clear);
      }
    } else {
      return const Icon(Icons.clear);
    }
  }
}
