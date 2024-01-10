class Student {
  int? id;
  String firstName;
  String lastName;
  int grade;
  String? status;

  // Constructor
  Student(this.firstName, this.lastName, int grade)
      : grade = (grade < 0)
            ? 0
            : (grade > 100)
                ? 100
                : grade;

  // Named constructor
  Student.withId(this.id, this.firstName, this.lastName, int grade)
      : grade = (grade < 0)
            ? 0
            : (grade > 100)
                ? 100
                : grade;

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
