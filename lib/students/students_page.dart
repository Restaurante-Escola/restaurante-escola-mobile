import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_escola_app/data/models/student/student-model.dart';
import 'package:restaurante_escola_app/edit_create_student/edit_create_student_page.dart';
import 'package:restaurante_escola_app/students/widgets/item_list_widget.dart';
import 'package:restaurante_escola_app/students/students_store.dart';

class StudentPage extends StatefulWidget {
  StudentPage({Key? key}) : super(key: key);

  @override
  StudentPageState createState() => StudentPageState();
}

class StudentPageState extends State<StudentPage> {
  late StudentsStore studentsStore;

  @override
  void initState() {
    super.initState();
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
                  itemCount: studentsStore.students.length,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onLongPress: () {
                        setState(() {
                          studentsStore.students[index].isSelected = true;
                          studentsStore
                              .addStudent(studentsStore.students[index]);
                        });
                      },
                      child: ItemListWidget(
                          student: studentsStore.students[index]),
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
          onPressed: () => {
            if (studentsStore.studentsSelected.length > 0)
              {showAlertDialog(context, studentsStore)}
            else
              {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditCreateStudent(student: null),
                  ),
                ),
              }
          },
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

showAlertDialog(BuildContext context, studentsStore) {
  Widget cancelButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  Widget continueButton = TextButton(
    child: Text("Confirmar"),
    onPressed: () {
      studentsStore.deleteStudents();
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Deletar permanentemente"),
    content: Text("Ao deletar " +
        studentsStore.studentsSelected.length.toString() +
        " estudante(s), você não será mais capaz de acessar seus dados. Deseja realmente continuar?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
