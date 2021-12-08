import 'package:restaurante_escola_app/data/models/turmas_model.dart/turmas_model.dart';
import 'package:restaurante_escola_app/data/repositories/api.dart';

class TurmaRepository {
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
