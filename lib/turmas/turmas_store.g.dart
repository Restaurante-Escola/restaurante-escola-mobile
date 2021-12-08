// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turmas_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TurmasStore on _TurmasStoreBase, Store {
  final _$loadingAtom = Atom(name: '_TurmasStoreBase.loading');

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

  final _$turmasAtom = Atom(name: '_TurmasStoreBase.turmas');

  @override
  ObservableList<TurmasModel> get turmas {
    _$turmasAtom.reportRead();
    return super.turmas;
  }

  @override
  set turmas(ObservableList<TurmasModel> value) {
    _$turmasAtom.reportWrite(value, super.turmas, () {
      super.turmas = value;
    });
  }

  final _$getTurmasAsyncAction = AsyncAction('_TurmasStoreBase.getTurmas');

  @override
  Future<List<TurmasModel>> getTurmas() {
    return _$getTurmasAsyncAction.run(() => super.getTurmas());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
turmas: ${turmas}
    ''';
  }
}
