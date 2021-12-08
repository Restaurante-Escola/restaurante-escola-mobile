// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentsStore on StudentsStoreBase, Store {
  final _$loadingAtom = Atom(name: 'StudentsStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$studentsSelectedAtom =
      Atom(name: 'StudentsStoreBase.studentsSelected');

  @override
  ObservableList<StudentModel> get studentsSelected {
    _$studentsSelectedAtom.reportRead();
    return super.studentsSelected;
  }

  @override
  set studentsSelected(ObservableList<StudentModel> value) {
    _$studentsSelectedAtom.reportWrite(value, super.studentsSelected, () {
      super.studentsSelected = value;
    });
  }

  final _$studentsAtom = Atom(name: 'StudentsStoreBase.students');

  @override
  ObservableList<StudentModel> get students {
    _$studentsAtom.reportRead();
    return super.students;
  }

  @override
  set students(ObservableList<StudentModel> value) {
    _$studentsAtom.reportWrite(value, super.students, () {
      super.students = value;
    });
  }

  final _$getStudentsAsyncAction = AsyncAction('StudentsStoreBase.getStudents');

  @override
  Future<List<StudentModel>> getStudents() {
    return _$getStudentsAsyncAction.run(() => super.getStudents());
  }

  final _$getStudentsFromClassAsyncAction =
      AsyncAction('StudentsStoreBase.getStudentsFromClass');

  @override
  Future<List<StudentModel>> getStudentsFromClass(int? numeroTurma) {
    return _$getStudentsFromClassAsyncAction
        .run(() => super.getStudentsFromClass(numeroTurma));
  }

  final _$deleteStudentsAsyncAction =
      AsyncAction('StudentsStoreBase.deleteStudents');

  @override
  Future<dynamic> deleteStudents() {
    return _$deleteStudentsAsyncAction.run(() => super.deleteStudents());
  }

  final _$removeStudentAsyncAction =
      AsyncAction('StudentsStoreBase.removeStudent');

  @override
  Future<dynamic> removeStudent(StudentModel element) {
    return _$removeStudentAsyncAction.run(() => super.removeStudent(element));
  }

  final _$addStudentAsyncAction = AsyncAction('StudentsStoreBase.addStudent');

  @override
  Future<dynamic> addStudent(StudentModel element) {
    return _$addStudentAsyncAction.run(() => super.addStudent(element));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
studentsSelected: ${studentsSelected},
students: ${students}
    ''';
  }
}
