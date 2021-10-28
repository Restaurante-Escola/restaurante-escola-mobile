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
  ObservableList<Student> get studentsSelected {
    _$studentsSelectedAtom.reportRead();
    return super.studentsSelected;
  }

  @override
  set studentsSelected(ObservableList<Student> value) {
    _$studentsSelectedAtom.reportWrite(value, super.studentsSelected, () {
      super.studentsSelected = value;
    });
  }

  final _$getStudentsAsyncAction = AsyncAction('StudentsStoreBase.getStudents');

  @override
  Future<dynamic> getStudents() {
    return _$getStudentsAsyncAction.run(() => super.getStudents());
  }

  final _$deleteStudentAsyncAction =
      AsyncAction('StudentsStoreBase.deleteStudent');

  @override
  Future<dynamic> deleteStudent(Student element) {
    return _$deleteStudentAsyncAction.run(() => super.deleteStudent(element));
  }

  final _$addStudentAsyncAction = AsyncAction('StudentsStoreBase.addStudent');

  @override
  Future<dynamic> addStudent(Student element) {
    return _$addStudentAsyncAction.run(() => super.addStudent(element));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
studentsSelected: ${studentsSelected}
    ''';
  }
}
