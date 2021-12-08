import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:restaurante_escola_app/data/models/student/student-model.dart';
import 'package:restaurante_escola_app/data/models/turmas_model.dart/turmas_model.dart';
import 'package:restaurante_escola_app/data/repositories/student-repository.dart';
part 'edit_create_student_store.g.dart';

class EditCreateStudentStore = EditCreateStudentStoreBase
    with _$EditCreateStudentStore;

abstract class EditCreateStudentStoreBase with Store {
  StudentRepository _studentRepository = StudentRepository();

  @observable
  bool loading = false;

  @observable
  bool loadingView = false;

  @action
  Future<List<TurmasModel>> getTurmas() async {
    final res = await _studentRepository.getTurmas();
    return res;
  }
}
