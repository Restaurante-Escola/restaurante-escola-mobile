import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:restaurante_escola_app/data/models/student/student-model.dart';
import 'package:restaurante_escola_app/data/models/turmas_model.dart/turmas_model.dart';
import 'package:restaurante_escola_app/data/repositories/student-repository.dart';
import 'package:restaurante_escola_app/data/repositories/turmas-repository.dart';
part 'edit_create_student_store.g.dart';

class EditCreateStudentStore = EditCreateStudentStoreBase
    with _$EditCreateStudentStore;

abstract class EditCreateStudentStoreBase with Store {
  StudentRepository _studentRepository = StudentRepository();
  TurmaRepository _turmaRepository = TurmaRepository();

  @observable
  bool loading = false;

  @action
  Future<List<TurmasModel>> getTurmas() async {
    final res = await _turmaRepository.getTurmas();
    return res;
  }

  @action
  Future updateStudent(StudentModel student) async {
    loading = true;
    await _studentRepository.updateStudent(student);
    loading = false;
  }

  @action
  Future createStudent(StudentModel student) async {
    loading = true;
    await _studentRepository.createStudent(student);
    if (student.numeroTurma != null) {
      await _studentRepository.addStudentToClass(
          student.matricula, student.numeroTurma);
    }
    loading = false;
  }
}
