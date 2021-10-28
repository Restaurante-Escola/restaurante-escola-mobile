import 'package:mobx/mobx.dart';
import 'package:restaurante_escola_app/students/students_model.dart';
part 'students_store.g.dart';

class StudentsStore = StudentsStoreBase with _$StudentsStore;

abstract class StudentsStoreBase with Store {
  @observable
  bool loading = false;

  @observable
  ObservableList<Student> studentsSelected = ObservableList();

  @action
  Future getStudents() async {
    loading = true;
    Future.delayed(Duration(seconds: 2), () async {
      loading = false;
    });
  }

  @action
  Future deleteStudent(Student element) async {
    studentsSelected.remove(element);
  }

  @action
  Future addStudent(Student element) async {
    studentsSelected.add(element);
  }
}
