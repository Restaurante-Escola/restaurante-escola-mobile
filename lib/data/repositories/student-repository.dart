import 'dart:convert';
import 'package:restaurante_escola_app/data/models/student/student-model.dart';
import 'package:restaurante_escola_app/data/repositories/api.dart';
import 'package:intl/intl.dart';

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

  Future<List<StudentModel>> getStudentsFromClass(int? numeroTurma) async {
    try {
      final response = await ApiClient.api().get('turmas/alunos/$numeroTurma');

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

  Future updateStudent(StudentModel student) async {
    try {
      var studentFormatted = student.toJson();
      studentFormatted['dataNascimento'] =
          DateFormat('dd/MM/yyyy').format(student.dataNascimento);
      studentFormatted.remove('isSelected');
      print(jsonEncode(studentFormatted));
      await ApiClient.api()
          .put('alunos/${student.matricula}', data: studentFormatted);
    } catch (err) {
      throw Exception(err);
    }
  }

  Future createStudent(StudentModel student) async {
    try {
      var studentFormatted = student.toJson();
      studentFormatted['dataNascimento'] =
          DateFormat('dd/MM/yyyy').format(student.dataNascimento);
      studentFormatted.remove('isSelected');
      await ApiClient.api().post('alunos', data: studentFormatted);
    } catch (err) {
      throw Exception(err);
    }
  }

  Future addStudentToClass(int matricula, int? numeroTurma) async {
    try {
      await ApiClient.api().post('turmas/cadastrar-alunos',
          data: {"matricula": matricula, "numeroTurma": numeroTurma});
    } catch (err) {
      print("caiu error $err");
      throw Exception(err);
    }
  }

  // await this.studentsService.addStudentToClass({matricula: studentData.matricula, numeroTurma: this.studentForm.get('turma')?.value});

}
