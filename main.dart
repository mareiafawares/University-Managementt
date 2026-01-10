void main(){
 // Create Department
 Department csDepartment = Department();
  csDepartment.name = 'Computer Science ';
  // Create Professors
Professor profMareia = Professor();
  profMareia.name = 'Mareia Mahmoud';
  profMareia.email = 'Mareia@gmail.com';
  profMareia.professorId = 'P002';
  profMareia.specialty = 'Software Engineering';

  Professor profAlaa = Professor();
  profAlaa.name = 'Alaa shrmaan';
  profAlaa.email = 'Alaa@egmail.com';
  profAlaa.professorId = 'P001';
  profAlaa.specialty = 'Computer Science';

  
  // Add Professors to Department
  csDepartment.addProfessor(profMareia);
  csDepartment.addProfessor(profAlaa);
  // Create Students
  Student studentHashim = Student();
  studentHashim.name = 'Hashim Fawares';
  studentHashim.email = 'Hashim@student.com';
  studentHashim.studentId = 'S001';

  Student studentAmer = Student();
  studentAmer.name = 'Amer Mahmoud';
  studentAmer.email = 'Amer@student.com';
  studentAmer.studentId = 'S002';
  // Add Students to Department
  csDepartment.addStudent(studentHashim);
  csDepartment.addStudent(studentAmer);
  // Create Courses
  Course courseDB = Course('CS101', 'Database Systems', profMareia);
  Course courseMP = Course('CS102', 'Mobile Programming', profAlaa);
  // Add Courses to Department
  csDepartment.addCourse(courseDB);
  csDepartment.addCourse(courseMP);
  // Enroll Students in Courses
  courseDB.enrollStudent(studentHashim);
  courseMP.enrollStudent(studentAmer);
  // Evaluate Students
  profMareia.evaluateStudent(studentHashim, 'Database Systems', 88);
  profAlaa.evaluateStudent(studentAmer, 'Mobile Programming', 92);
  // Search for Students, Professors, and Courses
  csDepartment.searchStudent('Amer Mahmoud');
  csDepartment.searchProfessor('Hashim Fawares');
  csDepartment.searchCourse('CS101');
}
//abstract class user ,abstract method
 abstract class User {
  String name;
  String email;

  
void displayInfo();
}
//class student
class Student extends User {
  String studentId;
  double _gpa;
  Map<String,int> _courses={
    'Database Systems':78,
     'Mobile Programming':85,
      'Web Programming':90
  };
//getter
double get gba {
  double value = 0;
 for (var course in _courses.values) {
    value += course;
}  
return value / _courses.length;
}
void displayInfo(){

}
//method to add course and grade
void addCourse(String course, int grade){
  _courses[course]=grade;
}
//class professor
class Professor extends User with Evaluatable{
String professorId;
String specialty;
List<String> courses = [
  'Database Systems',
  'Mobile Programming',
  'Web Programming'
];

void displayInfo(){

}
}
//class course
class Course implements Schedulable{
  String courseCode;
   String title;
  Professor assignedProfessor;
  List<Student> enrolledStudents = [];
  static int totalTractCourses=0;
  //constructor
   Course(this.courseCode, this.title, this.assignedProfessor) {
    totalTractCourses++;
  }
  
  void enrollStudent(Student studentName){
    enrolledStudents.add(studentName);
 
 }
void scheduleClass(String dateTime) {
  
}
}
//mixin
mixin  Evaluatable  {
      void evaluateStudent(Student student, String course, int grade) {
    student.addCourse(course, grade);
  }
}
//interface
abstract class Schedulable {
  void scheduleClass(String dateTime);
}
class Department {
  String name;
  List<Professor> professors = [];
  List<Student> students = [];
  List<Course> courses = [];

  void addProfessor(Professor professor) {
    professors.add(professor);
  }

  void addStudent(Student student) {
    students.add(student);
  }

  void addCourse(Course course) {
    courses.add(course);
  }
  void searchStudent(String name){
    for(var student in students){
      if(student.name==name){
        print('Student found: ${student.name}, Email: ${student.email}');
        return;
      }
    }
    print('Student not found');
  }
  void searchProfessor(String name){
    for(var professor in professors){
      if(professor.name==name){
        print('Professor found: ${professor.name}, Email: ${professor.email}');
        return;
      }
    }
    print('Professor not found');
  }
  void searchCourse(String courseCode){
    for(var course in courses){
      if(course.courseCode==courseCode){
        print('Course found: ${course.title}, Code: ${course.courseCode}');
        return;
      }
    }
    print('Course not found');
  }
}