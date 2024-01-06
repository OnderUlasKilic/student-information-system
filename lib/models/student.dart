// Class isimleri ile dosya isimleri aynı olmalıdır.

class Student {
  int? id;
  String firstName;
  String lastName;
  int grade;
  String? status;

  // Değişkenler(String, int, double, List ) this.ile direk atayabiliyoruz.
  // Constructor bir sınıfın yapıcı metodudur. Yani sınıf oluşturulurken otomatik olarak bu metod çağrılır.
  Student(this.firstName, this.lastName, this.grade);
  // Bu Constructor named(isimli) bir yapıcı metodudur.
  Student.withId(this.id, this.firstName, this.lastName, this.grade);

  String get getStatus {
    String message = "";
    if (grade > 50) {
      message = "Geçti";
    } else if (grade >= 40) {
      message = "Bütünlemeye kaldı";
    } else {
      message = "Kaldı";
    }
    status = message;
    return message;
  }
}
