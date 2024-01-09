import 'package:flutter/material.dart';
import 'package:flutter_2/models/student.dart';

// StatefulWidget sınıfı olan UpdateAdd
class StudentUpdate extends StatefulWidget {
  // Güncelleme yapılacak belirli öğrenci
  final Student student;

  // Constructor: Updates ve selectedUpdate parametreleri zorunlu
  StudentUpdate({required this.student});

  @override
  State<StatefulWidget> createState() {
    return _StudentUpdateState();
  }
}

// StatefulWidget'ın State sınıfı olan _UpdateAddState
class _StudentUpdateState extends State<StudentUpdate> {
  // Formun durumunu takip etmek için anahtar
  var formKey = GlobalKey<FormState>();

  // Widget'ın oluşturulduğu build metodu
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Öğrenci Güncelleme / Ekleme"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Öğrenci adını düzenleyen TextFormField oluşturur
  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci adı", hintText: "Engin"),
      initialValue: widget.student.firstName,
      onSaved: (String? value) {
        widget.student.firstName = value ?? "";
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Öğrenci adı boş bırakılamaz';
        }
        return null;
      },
    );
  }

  // Öğrenci soyadını düzenleyen TextFormField oluşturur
  Widget buildLastNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Öğrenci soyadı", hintText: "Demiro"),
      initialValue: widget.student.lastName,
      onSaved: (String? value) {
        widget.student.lastName = value ?? "";
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Öğrenci soyadı boş bırakılamaz';
        }
        return null;
      },
    );
  }

  // Aldığı notu düzenleyen TextFormField oluşturur
  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı not", hintText: "65"),
      initialValue: widget.student.grade.toString(),
      keyboardType: TextInputType.number,
      onSaved: (String? value) {
        widget.student.grade = int.tryParse(value ?? "0") ?? 0;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Aldığı not boş bırakılamaz';
        }
        return null;
      },
    );
  }

  // Kaydet butonunu oluşturur
  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text("Güncelle"),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Onay'),
              content: Text(
                  'Seçili öğrenciyi güncellemek istediğinize emin misiniz?'),
              actions: <Widget>[
                TextButton(
                  child: Text('Iptal'),
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); // Kullanıcı iptal ederse dialog kapatılır
                  },
                ),
                TextButton(
                    child: Text('Güncelle'),
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        formKey.currentState?.save();
                        // Burada öğrenci güncelleme işlemini gerçekleştir
                        // Örneğin: selectedStudent'i kullanarak güncelleme işlemini yapabilirsin
                        // Örnek: students[index] = updatedStudent;
                        // Güncelleme işlemi tamamlandıktan sonra dialog'u kapat
                        Navigator.of(context).pop(); // Closes the dialog
                        Navigator.of(context).pop();
                      }
                      ;
                    }),
              ],
            );
          },
        );
      },
    );
  }
}
