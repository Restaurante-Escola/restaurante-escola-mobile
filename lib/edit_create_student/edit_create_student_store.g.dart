// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_create_student_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditCreateStudentStore on EditCreateStudentStoreBase, Store {
  final _$loadingAtom = Atom(name: 'EditCreateStudentStoreBase.loading');

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

  final _$getTurmasAsyncAction =
      AsyncAction('EditCreateStudentStoreBase.getTurmas');

  @override
  Future<List<TurmasModel>> getTurmas() {
    return _$getTurmasAsyncAction.run(() => super.getTurmas());
  }

  final _$updateStudentAsyncAction =
      AsyncAction('EditCreateStudentStoreBase.updateStudent');

  @override
  Future<dynamic> updateStudent(StudentModel student) {
    return _$updateStudentAsyncAction.run(() => super.updateStudent(student));
  }

  final _$createStudentAsyncAction =
      AsyncAction('EditCreateStudentStoreBase.createStudent');

  @override
  Future<dynamic> createStudent(StudentModel student) {
    return _$createStudentAsyncAction.run(() => super.createStudent(student));
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
