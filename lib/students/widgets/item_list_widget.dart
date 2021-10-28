import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_escola_app/students/students_store.dart';
import '../students_model.dart';

class ItemListWidget extends StatefulWidget {
  Student student;

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
      child: InkWell(
        onTap: () => print("Clicou: ${widget.student.name}"),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Observer(builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // if (studentsStore.studentsSelected.length > 0) ...[
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
                          if (widget.student.isSelected) {
                            studentsStore.addStudent(widget.student);
                          } else {
                            studentsStore.deleteStudent(widget.student);
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
                // ],
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text.rich(
                      TextSpan(
                        text: widget.student.name,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: ' - (Turma 1)',
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
                      widget.student.email.toLowerCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
