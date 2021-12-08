import 'package:json_annotation/json_annotation.dart';
part 'turmas_model.g.dart';

@JsonSerializable()
class TurmasModel {
  int codigo;
  int numero;
  DateTime inicioTurma;
  DateTime fimTurma;
  DateTime criadoEm;
  DateTime atualizadoEm;

  TurmasModel({
    required this.codigo,
    required this.numero,
    required this.inicioTurma,
    required this.fimTurma,
    required this.criadoEm,
    required this.atualizadoEm,
  });

  factory TurmasModel.fromJson(Map<String, dynamic> json) =>
      _$TurmasModelFromJson(json);
  Map<String, dynamic> toJson() => _$TurmasModelToJson(this);
}
