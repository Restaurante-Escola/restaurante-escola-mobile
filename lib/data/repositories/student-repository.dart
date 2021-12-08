import 'package:dio/dio.dart';
import 'package:restaurante_escola_app/data/models/student/student-model.dart';
import 'package:restaurante_escola_app/data/models/turmas_model.dart/turmas_model.dart';
import 'package:restaurante_escola_app/data/repositories/api.dart';

class StudentRepository {
  Future<List<StudentModel>> getStudents() async {
    try {
      final response = await ApiClient.api().get('alunos');

      var students = (response.data as List)
          .map((data) => StudentModel.fromJson(data))
          .toList();
      return students;
    } catch (err) {
      throw Exception(err);
    }
  }

  Future deleteStudents(students) async {
    try {
      for (var student in students) {
        var matricula = student.matricula;
        await ApiClient.api().delete('alunos/$matricula');
      }
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<List<TurmasModel>> getTurmas() async {
    try {
      final res = await ApiClient.api().get('turmas');
      var oi =
          (res.data as List).map((data) => TurmasModel.fromJson(data)).toList();
      return oi;
    } catch (err) {
      throw Exception(err);
    }
  }
}
