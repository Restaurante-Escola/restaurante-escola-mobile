import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_escola_app/data/models/student/student-model.dart';
import 'package:restaurante_escola_app/students/edit_create_student_page.dart';
import 'package:restaurante_escola_app/students/students_store.dart';

class ItemListWidget extends StatefulWidget {
  StudentModel student;

  ItemListWidget({required this.student, Key? key}) : super(key: key);

  @override
  _ItemListWidgetState createState() => _ItemListWidgetState();
}

class _ItemListWidgetState extends State<ItemListWidget> {
  late StudentsStore studentsStore;

  @override
  Widget build(BuildContext context) {
    studentsStore = Provider.of<StudentsStore>(context);
    return Card(
      child: Observer(builder: (_) {
        return InkWell(
          onTap: () => {
            if (studentsStore.studentsSelected.length == 0)
              {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditCreateStudent(
                        title: 'Editar ' + widget.student.nome),
                  ),
                ),
              }
            else
              {
                setState(() {
                  widget.student.isSelected = widget.student.isSelected != true;
                  if (widget.student.isSelected == true) {
                    studentsStore.addStudent(widget.student);
                  } else {
                    studentsStore.removeStudent(widget.student);
                  }
                })
              }
          },
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: studentsStore.studentsSelected.length > 0 ? 30 : 0,
                  child: AnimatedOpacity(
                    opacity: studentsStore.studentsSelected.length > 0 ? 1 : 0,
                    duration: Duration(milliseconds: 400),
                    child: Checkbox(
                      checkColor: Colors.white,
                      activeColor: Color(0xFF801579B),
                      value: widget.student.isSelected,
                      onChanged: (bool? value) => {
                        setState(() {
                          widget.student.isSelected = value!;
                          if (widget.student.isSelected == true) {
                            studentsStore.addStudent(widget.student);
                          } else {
                            studentsStore.removeStudent(widget.student);
                          }

                          print(studentsStore.studentsSelected);
                        })
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text.rich(
                      TextSpan(
                        text: widget.student.nome,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: ' - (' +
                                (widget.student.numeroTurma == null
                                    ? 'Sem turma'
                                    : 'Turma ' +
                                        widget.student.numeroTurma.toString()) +
                                ')',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      widget.student.email == null ||
                              widget.student.email!.isEmpty
                          ? 'Sem e-mail'
                          : widget.student.email!.toLowerCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
