import 'package:restaurante_escola_app/data/models/student/student-model.dart';
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
}
