import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_escola_app/students/students_model.dart';
import 'package:restaurante_escola_app/students/widgets/item_list_widget.dart';
import 'package:restaurante_escola_app/students/students_store.dart';

class StudentPage extends StatefulWidget {
  StudentPage({Key? key}) : super(key: key);

  @override
  StudentPageState createState() => StudentPageState();
}

class StudentPageState extends State<StudentPage> {
  List<Student> students = [
    Student(name: "Guilherme Rabelo", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Luis Durante", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Victor Moreno", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Jaime Mathias", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Gabriel Romano", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Felipe Ferreira", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Guilherme Rabelo", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Luis Durante", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Victor Moreno", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Jaime Mathias", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Gabriel Romano", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Felipe Ferreira", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Guilherme Rabelo", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Luis Durante", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Victor Moreno", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Jaime Mathias", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Gabriel Romano", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Felipe Ferreira", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Victor Moreno", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Jaime Mathias", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Gabriel Romano", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Felipe Ferreira", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Guilherme Rabelo", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Luis Durante", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Victor Moreno", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Jaime Mathias", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Gabriel Romano", email: "gui_rabeloo@hotmail.com"),
    Student(name: "Felipe Ferreira", email: "gui_rabeloo@hotmail.com"),
  ];

  bool loading = true;

  late StudentsStore studentsStore;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    // Future.delayed(const Duration(seconds: 2), () {
    //   setState(() {
    //     loading = false;
    //   });
    // });
    Future.delayed(Duration.zero, () {
      studentsStore.getStudents();
    });
  }

  @override
  Widget build(BuildContext context) {
    studentsStore = Provider.of<StudentsStore>(context);
    return Observer(builder: (_) {
      return Scaffold(
        body: !studentsStore.loading
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onLongPress: () {
                        setState(() {
                          students[index].isSelected = true;
                          studentsStore.addStudent(students[index]);
                        });
                      },
                      child: ItemListWidget(student: students[index]),
                    );
                  },
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(const Color(0xFF801579B)),
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          child: Icon(studentsStore.studentsSelected.length > 0
              ? Icons.delete
              : Icons.add),
          backgroundColor: studentsStore.studentsSelected.length > 0
              ? Colors.red
              : Color(0xFF801579B),
        ),
      );
    });
  }
}
