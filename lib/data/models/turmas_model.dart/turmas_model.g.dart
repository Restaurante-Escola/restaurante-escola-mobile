// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turmas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TurmasModel _$TurmasModelFromJson(Map<String, dynamic> json) => TurmasModel(
      codigo: json['codigo'] as int,
      numero: json['numero'] as int,
      inicioTurma: DateTime.parse(json['inicioTurma'] as String),
      fimTurma: DateTime.parse(json['fimTurma'] as String),
      criadoEm: DateTime.parse(json['criadoEm'] as String),
      atualizadoEm: DateTime.parse(json['atualizadoEm'] as String),
    );

Map<String, dynamic> _$TurmasModelToJson(TurmasModel instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'numero': instance.numero,
      'inicioTurma': instance.inicioTurma.toIso8601String(),
      'fimTurma': instance.fimTurma.toIso8601String(),
      'criadoEm': instance.criadoEm.toIso8601String(),
      'atualizadoEm': instance.atualizadoEm.toIso8601String(),
    };
