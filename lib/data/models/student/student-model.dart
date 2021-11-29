import 'package:json_annotation/json_annotation.dart';
part 'student-model.g.dart';

@JsonSerializable()
class StudentModel {
  int matricula;
  String nome;
  DateTime dataNascimento;
  String? nomeSocial;
  int? idade;
  String? estadoCivil;
  String? rg;
  String? cpf;
  String? telefoneCelular;
  String? numeroWhatsapp;
  String? telefoneRecado;
  String? nomePessoaTelefoneRecado;
  String? endereco;
  String? email;
  String? nomeResponsavel;
  String? escolaridade;
  String? escolaridadeGrau;
  String? escola;
  String? anoMedio;
  String? anoFormacaoMedio;
  String? camiseta;
  String? sapato;
  String? servicoAtendimento;
  String? unidade;
  String? tecnico;
  String? telefoneTecnico;
  bool? alergia;
  bool? alergiaRemedio;
  bool? alergiaAlimento;
  bool? alergiaOutros;
  String? especificacaoAlergia;
  bool? hipertensao;
  bool? hipotensao;
  bool? epilepsia;
  bool? diabetes;
  bool? problemaRenal;
  bool? problemaOcular;
  bool? problemaRespiratorio;
  bool? fumante;
  String? medicamentosUsoContinuo;
  String? observacao;
  DateTime? criadoEm;
  DateTime? atualizadoEm;
  int? numeroTurma;
  bool isSelected;

  StudentModel(
      {required this.matricula,
      required this.nome,
      required this.dataNascimento,
      this.nomeSocial,
      this.idade,
      this.estadoCivil,
      this.rg,
      this.cpf,
      this.telefoneCelular,
      this.numeroWhatsapp,
      this.telefoneRecado,
      this.nomePessoaTelefoneRecado,
      this.endereco,
      this.email,
      this.nomeResponsavel,
      this.escolaridade,
      this.escolaridadeGrau,
      this.escola,
      this.anoMedio,
      this.anoFormacaoMedio,
      this.camiseta,
      this.sapato,
      this.servicoAtendimento,
      this.unidade,
      this.tecnico,
      this.telefoneTecnico,
      this.alergia,
      this.alergiaRemedio,
      this.alergiaAlimento,
      this.alergiaOutros,
      this.especificacaoAlergia,
      this.hipertensao,
      this.hipotensao,
      this.epilepsia,
      this.diabetes,
      this.problemaRenal,
      this.problemaOcular,
      this.problemaRespiratorio,
      this.fumante,
      this.medicamentosUsoContinuo,
      this.observacao,
      this.criadoEm,
      this.atualizadoEm,
      this.numeroTurma,
      this.isSelected = false});

  factory StudentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentModelFromJson(json);
  Map<String, dynamic> toJson() => _$StudentModelToJson(this);
}
