import 'package:mobx/mobx.dart';
import 'package:restaurante_escola_app/data/models/turmas_model.dart/turmas_model.dart';
import 'package:restaurante_escola_app/data/repositories/turmas-repository.dart';
part 'turmas_store.g.dart';

class TurmasStore = _TurmasStoreBase with _$TurmasStore;

abstract class _TurmasStoreBase with Store {
  TurmaRepository _turmasRepository = TurmaRepository();

  @observable
  bool loading = false;

  @observable
  ObservableList<TurmasModel> turmas = ObservableList();

  @action
  Future<List<TurmasModel>> getTurmas() async {
    loading = true;
    this.turmas.clear();
    List<TurmasModel> res = await _turmasRepository.getTurmas();
    print(res);
    this.turmas.addAll(res);
    loading = false;
    return this.turmas;
  }
}
