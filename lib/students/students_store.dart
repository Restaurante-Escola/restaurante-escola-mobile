import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:restaurante_escola_app/data/models/student/student-model.dart';
import 'package:restaurante_escola_app/data/repositories/student-repository.dart';
part 'students_store.g.dart';

class StudentsStore = StudentsStoreBase with _$StudentsStore;

abstract class StudentsStoreBase with Store {
  StudentRepository _studentRepository = StudentRepository();

  @observable
  bool loading = false;

  @observable
  ObservableList<StudentModel> studentsSelected = ObservableList();

  @observable
  ObservableList<StudentModel> students = ObservableList();

  @action
  Future<List<StudentModel>> getStudents() async {
    loading = true;
    this.students.clear();
    List<StudentModel> res = await _studentRepository.getStudents();
    this.students.addAll(res);
    loading = false;
    return this.students;
  }

  @action
  Future deleteStudents() async {
    await _studentRepository.deleteStudents(studentsSelected);
    studentsSelected.clear();
    await getStudents();
  }

  @action
  Future removeStudent(StudentModel element) async {
    studentsSelected.remove(element);
  }

  @action
  Future addStudent(StudentModel element) async {
    studentsSelected.add(element);
  }
}
