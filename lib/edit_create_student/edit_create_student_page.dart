import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_escola_app/data/models/student/student-model.dart';
import 'package:restaurante_escola_app/data/models/turmas_model.dart/turmas_model.dart';
import 'package:restaurante_escola_app/edit_create_student/edit_create_student_store.dart';
import 'package:restaurante_escola_app/students/students_store.dart';
import 'package:collection/collection.dart';

class EditCreateStudent extends StatefulWidget {
  final StudentModel? student;
  EditCreateStudent({Key? key, this.student}) : super(key: key);

  @override
  _EditCreateStudentState createState() => _EditCreateStudentState();
}

class _EditCreateStudentState extends State<EditCreateStudent> {
  late EditCreateStudentStore editCreateStudentStore;
  late StudentsStore studentsStore;
  DateTime selectedDate = DateTime.now();
  bool loadingView = true;

  _selectDate(BuildContext context) async {
    var picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year - 21),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dataNascimentoController.text =
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
      });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      _turmas = await editCreateStudentStore.getTurmas();
      turmaSelecionada = _turmas.singleWhereOrNull(
          (element) => element.numero == widget.student?.numeroTurma);
      setState(() {
        loadingView = false;
      });
    });

    matriculaController.text = widget.student?.matricula != null
        ? widget.student!.matricula.toString()
        : '';
    nomeController.text =
        widget.student?.nome != null ? widget.student!.nome : '';
    nomeSocialController.text = widget.student?.nomeSocial != null
        ? widget.student!.nomeSocial.toString()
        : '';
    idadeController.text =
        widget.student?.idade != null ? widget.student!.idade.toString() : '';
    estadoCivilController.text = widget.student?.estadoCivil != null
        ? widget.student!.estadoCivil.toString()
        : '';
    selectedDate = widget.student?.dataNascimento != null
        ? widget.student!.dataNascimento
        : DateTime(2000, 1, 20);
    dataNascimentoController.text = widget.student?.dataNascimento != null
        ? "${widget.student?.dataNascimento.day}/${widget.student?.dataNascimento.month}/${widget.student?.dataNascimento.year}"
        : '';
    rgController.text =
        widget.student?.rg != null ? widget.student!.rg.toString() : '';
    cpfController.text =
        widget.student?.cpf != null ? widget.student!.cpf.toString() : '';
    telefoneCelularController.text = widget.student?.telefoneCelular != null
        ? widget.student!.telefoneCelular.toString()
        : '';
    numeroWhatsappController.text = widget.student?.numeroWhatsapp != null
        ? widget.student!.numeroWhatsapp.toString()
        : '';
    telefoneRecadoController.text = widget.student?.telefoneRecado != null
        ? widget.student!.telefoneRecado.toString()
        : '';
    nomePessoaTelefoneRecadoController.text =
        widget.student?.nomePessoaTelefoneRecado != null
            ? widget.student!.nomePessoaTelefoneRecado.toString()
            : '';
    nomePessoaTelefoneRecadoController.text =
        widget.student?.nomePessoaTelefoneRecado != null
            ? widget.student!.nomePessoaTelefoneRecado.toString()
            : '';
    enderecoController.text = widget.student?.endereco != null
        ? widget.student!.endereco.toString()
        : '';
    emailController.text =
        widget.student?.email != null ? widget.student!.email.toString() : '';
    nomeResponsavelController.text = widget.student?.nomeResponsavel != null
        ? widget.student!.nomeResponsavel.toString()
        : '';
    escolaridadeController = widget.student?.escolaridade != null &&
            widget.student!.escolaridade!.isNotEmpty
        ? widget.student!.escolaridade.toString()
        : null;
    escolaController.text =
        widget.student?.escola != null ? widget.student!.escola.toString() : '';
    servicoAtendimentoController = widget.student?.servicoAtendimento != null
        ? widget.student!.servicoAtendimento.toString()
        : '';
    escolaridadeGrauController = widget.student?.escolaridadeGrau != null &&
            widget.student!.escolaridadeGrau!.isNotEmpty
        ? widget.student!.escolaridadeGrau.toString()
        : null;
    anoFormacaoController.text = widget.student?.anoFormacao != null
        ? widget.student!.anoFormacao.toString()
        : '';
    camisetaController.text = widget.student?.camiseta != null
        ? widget.student!.camiseta.toString()
        : '';
    sapatoController.text =
        widget.student?.sapato != null ? widget.student!.sapato.toString() : '';
    unidadeController.text = widget.student?.unidade != null
        ? widget.student!.unidade.toString()
        : '';
    tecnicoController.text = widget.student?.tecnico != null
        ? widget.student!.tecnico.toString()
        : '';
    telefoneTecnicoController.text = widget.student?.telefoneTecnico != null
        ? widget.student!.telefoneTecnico.toString()
        : '';
    alergiaController =
        widget.student?.alergia == null || widget.student?.alergia == false
            ? false
            : true;
    alergiaRemedioController = widget.student?.alergiaRemedio == null ||
            widget.student?.alergiaRemedio == false
        ? false
        : true;
    alergiaAlimentoController = widget.student?.alergiaAlimento == null ||
            widget.student?.alergiaAlimento == false
        ? false
        : true;
    alergiaOutrosController = widget.student?.alergiaOutros == null ||
            widget.student?.alergiaOutros == false
        ? false
        : true;
    especificacaoAlergiaController.text =
        widget.student?.especificacaoAlergia != null
            ? widget.student!.especificacaoAlergia.toString()
            : '';
    hipertensaoController = widget.student?.hipertensao == null ||
            widget.student?.hipertensao == false
        ? false
        : true;
    hipotensaoController = widget.student?.hipotensao == null ||
            widget.student?.hipotensao == false
        ? false
        : true;
    epilepsiaController =
        widget.student?.epilepsia == null || widget.student?.epilepsia == false
            ? false
            : true;
    diabetesController =
        widget.student?.diabetes == null || widget.student?.diabetes == false
            ? false
            : true;
    problemaRenalController = widget.student?.problemaRenal == null ||
            widget.student?.problemaRenal == false
        ? false
        : true;
    problemaOcularController = widget.student?.problemaOcular == null ||
            widget.student?.problemaOcular == false
        ? false
        : true;
    problemaRespiratorioController =
        widget.student?.problemaRespiratorio == null ||
                widget.student?.problemaRespiratorio == false
            ? false
            : true;
    fumanteController =
        widget.student?.fumante == null || widget.student?.fumante == false
            ? false
            : true;
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TurmasModel? turmaSelecionada;
  TextEditingController turmaController = TextEditingController();
  TextEditingController matriculaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController nomeSocialController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController estadoCivilController = TextEditingController();
  TextEditingController rgController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController telefoneCelularController = TextEditingController();
  TextEditingController numeroWhatsappController = TextEditingController();
  TextEditingController telefoneRecadoController = TextEditingController();
  TextEditingController nomePessoaTelefoneRecadoController =
      TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nomeResponsavelController = TextEditingController();
  late String? escolaridadeController;
  TextEditingController escolaController = TextEditingController();
  late String? escolaridadeGrauController;
  TextEditingController anoFormacaoController = TextEditingController();
  TextEditingController camisetaController = TextEditingController();
  TextEditingController sapatoController = TextEditingController();
  late String servicoAtendimentoController;
  TextEditingController unidadeController = TextEditingController();
  TextEditingController tecnicoController = TextEditingController();
  TextEditingController telefoneTecnicoController = TextEditingController();
  bool? alergiaController = false;
  bool? alergiaRemedioController = false;
  bool? alergiaAlimentoController = false;
  bool? alergiaOutrosController = false;
  TextEditingController especificacaoAlergiaController =
      TextEditingController();
  bool? hipertensaoController = false;
  bool? hipotensaoController = false;
  bool? epilepsiaController = false;
  bool? diabetesController = false;
  bool? problemaRenalController = false;
  bool? problemaOcularController = false;
  bool? problemaRespiratorioController = false;
  bool? fumanteController = false;
  bool? medicamentosUsoContinuoController = false;
  TextEditingController observacaoController = TextEditingController();

  List<TurmasModel> _turmas = [];
  List<String> _escolaridades = ['Ensino fundamental', 'Ensino médio'];
  List<String> _escolaridadeGraus = ['Completo', 'Cursando'];
  List<String> _servicosAtendimento = ['CRAS', 'CREAS', 'Centro Comunitário'];

  @override
  Widget build(BuildContext context) {
    editCreateStudentStore = Provider.of<EditCreateStudentStore>(context);
    studentsStore = Provider.of<StudentsStore>(context);

    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.student?.nome != null
              ? "Editar " + widget.student!.nome
              : "Criar Aluno"),
          backgroundColor: Color(0xFF801579B),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: editCreateStudentStore.loading
                  ? Center(
                      child: Container(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            const Color(0xFFFFFFFF),
                          ),
                          strokeWidth: 3,
                        ),
                      ),
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            StudentModel student = StudentModel(
                              matricula: int.parse(matriculaController.text),
                              numeroTurma: turmaSelecionada?.numero != null
                                  ? turmaSelecionada!.numero
                                  : null,
                              nome: nomeController.text,
                              dataNascimento: selectedDate,
                              nomeSocial: nomeSocialController.text,
                              idade: idadeController.text.isNotEmpty
                                  ? int.parse(idadeController.text)
                                  : null,
                              estadoCivil: estadoCivilController.text,
                              rg: rgController.text,
                              cpf: cpfController.text,
                              telefoneCelular: telefoneCelularController.text,
                              numeroWhatsapp: numeroWhatsappController.text,
                              telefoneRecado: telefoneRecadoController.text,
                              nomePessoaTelefoneRecado:
                                  nomePessoaTelefoneRecadoController.text,
                              endereco: enderecoController.text,
                              email: emailController.text,
                              nomeResponsavel: nomeResponsavelController.text,
                              escolaridade: escolaridadeController,
                              escolaridadeGrau: escolaridadeGrauController,
                              escola: escolaController.text,
                              anoFormacao: anoFormacaoController.text,
                              camiseta: camisetaController.text,
                              sapato: sapatoController.text,
                              servicoAtendimento: servicoAtendimentoController,
                              unidade: unidadeController.text,
                              tecnico: tecnicoController.text,
                              telefoneTecnico: telefoneTecnicoController.text,
                              alergia: alergiaController,
                              alergiaRemedio: alergiaRemedioController,
                              alergiaAlimento: alergiaAlimentoController,
                              alergiaOutros: alergiaOutrosController,
                              especificacaoAlergia:
                                  especificacaoAlergiaController.text,
                              hipertensao: hipertensaoController,
                              hipotensao: hipotensaoController,
                              epilepsia: epilepsiaController,
                              diabetes: diabetesController,
                              problemaRenal: problemaRenalController,
                              problemaOcular: problemaOcularController,
                              problemaRespiratorio:
                                  problemaRespiratorioController,
                              fumante: fumanteController,
                              medicamentosUsoContinuo:
                                  'medicamentosUsoContinuoController',
                              observacao: observacaoController.text,
                            );
                            if (widget.student?.nome != null) {
                              await editCreateStudentStore
                                  .updateStudent(student);
                            } else {
                              await editCreateStudentStore
                                  .createStudent(student);
                            }
                            studentsStore.getStudents();
                            Navigator.of(context).pop();
                          } catch (err) {
                            print(err);
                          } // return;
                        }
                      },
                    ),
            ),
          ],
        ),
        body: loadingView
            ? Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(const Color(0xFF801579B)),
                ),
              )
            : Form(
                key: _formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Vincular Aluno",
                                  style: TextStyle(
                                    color: Color(0xFF801579B),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                DropdownButtonFormField(
                                  isExpanded: true,
                                  items: _turmas
                                      .map((TurmasModel dropDownStringItem) {
                                    return DropdownMenuItem<TurmasModel>(
                                      value: dropDownStringItem,
                                      child: Text(
                                          "Turma ${dropDownStringItem.numero}"),
                                    );
                                  }).toList(),
                                  decoration: InputDecoration(
                                    labelText: 'Turma',
                                    labelStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  onChanged:
                                      (TurmasModel? novoItemSelecionado) {
                                    setState(() {
                                      turmaSelecionada = novoItemSelecionado;
                                    });
                                  },
                                  value: turmaSelecionada,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  enabled: widget.student?.matricula == null,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Insira a matricula do aluno!";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  controller: matriculaController,
                                  decoration: InputDecoration(
                                    labelText: "Matricula",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Dados Pessoais",
                                  style: TextStyle(
                                    color: Color(0xFF801579B),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: nomeController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Insira o nome do aluno";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Nome",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: nomeSocialController,
                                  decoration: InputDecoration(
                                    labelText: "Nome Social",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: idadeController,
                                  decoration: InputDecoration(
                                    labelText: "Idade",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: estadoCivilController,
                                  decoration: InputDecoration(
                                    labelText: "Estado civil",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: dataNascimentoController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Insira a data de nascimento do aluno!";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Data de nascimento",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  onTap: () {
                                    // Below line stops keyboard from appearing
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());
                                    _selectDate(context);
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: rgController,
                                  decoration: InputDecoration(
                                    labelText: "RG",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: cpfController,
                                  decoration: InputDecoration(
                                    labelText: "CPF",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: telefoneCelularController,
                                  decoration: InputDecoration(
                                    labelText: "Tel. celular",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: numeroWhatsappController,
                                  decoration: InputDecoration(
                                    labelText: "WhatsApp",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: telefoneRecadoController,
                                  decoration: InputDecoration(
                                    labelText: "Tel. Recado",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller:
                                      nomePessoaTelefoneRecadoController,
                                  decoration: InputDecoration(
                                    labelText: "Nome da pessoa",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: enderecoController,
                                  decoration: InputDecoration(
                                    labelText: "Endereço",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: nomeResponsavelController,
                                  decoration: InputDecoration(
                                    labelText:
                                        "Nome do principal responsável / cuidador:",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Dados Escolares",
                                  style: TextStyle(
                                    color: Color(0xFF801579B),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  items: _escolaridades
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                                  }).toList(),
                                  decoration: InputDecoration(
                                    labelText: 'Escolaridade',
                                    labelStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      escolaridadeController = val.toString();
                                    });
                                  },
                                  value: escolaridadeController,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: escolaController,
                                  decoration: InputDecoration(
                                    labelText: "Nome da escola",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  items: _escolaridadeGraus
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                                  }).toList(),
                                  decoration: InputDecoration(
                                    labelText: 'Escolaridade Grau',
                                    labelStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      escolaridadeGrauController = value;
                                    });
                                  },
                                  value: escolaridadeGrauController,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: anoFormacaoController,
                                  decoration: InputDecoration(
                                    labelText: "Ano da formação",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Dados de Serviço",
                                  style: TextStyle(
                                    color: Color(0xFF801579B),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: camisetaController,
                                  decoration: InputDecoration(
                                    labelText: "Tamanho da camisa",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: sapatoController,
                                  decoration: InputDecoration(
                                    labelText: "Nº Sapato",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                DropdownButtonFormField(
                                  isExpanded: true,
                                  items: _servicosAtendimento
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                                  }).toList(),
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: 'Serviço de Atendimento',
                                    labelStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  onChanged: (_) {
                                    // _dropDownItemSelected(novoItemSelecionado);
                                    // setState(() {
                                    //   this._itemSelecionado = novoItemSelecionado;
                                    // });
                                  },
                                  // value: _itemSelecionado,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: unidadeController,
                                  decoration: InputDecoration(
                                    labelText: "Unidade",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Dados do(a) Técnico(a)",
                                  style: TextStyle(
                                    color: Color(0xFF801579B),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: tecnicoController,
                                  decoration: InputDecoration(
                                    labelText: "Nome do(a) técnico(a)",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: telefoneTecnicoController,
                                  decoration: InputDecoration(
                                    labelText: "Tel. contato",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Dados de comorbidade",
                                  style: TextStyle(
                                    color: Color(0xFF801579B),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                CheckboxListTile(
                                  title:
                                      Text("Apresenta algum tipo de alergia?"),
                                  value: alergiaController,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      alergiaController = newValue;
                                    });
                                  },
                                  // controlAffinity: ListTileControlAffinity
                                  //     .leading, //  <-- leading Checkbox
                                )
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   width: 16,
                          // ),
                          // Expanded(
                          //   child: Column(
                          //     children: [
                          //       // TextFormField(
                          //       //   controller: nomeController,
                          //       //   decoration: InputDecoration(
                          //       //     labelText: "Tel. contato",
                          //       //     border: OutlineInputBorder(
                          //       //       borderRadius: BorderRadius.circular(10.0),
                          //       //     ),
                          //       //     labelStyle: TextStyle(
                          //       //       fontSize: 14,
                          //       //     ),
                          //       //   ),
                          //       // )
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                      // if (alergia != null && alergia != false)
                      Visibility(
                        visible: alergiaController != null &&
                            alergiaController != false,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  CheckboxListTile(
                                    title: Text("Remédio"),
                                    value: alergiaRemedioController,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        alergiaRemedioController = newValue;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text("Alimento"),
                                    value: alergiaAlimentoController,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        alergiaAlimentoController = newValue;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text(
                                        "Apresenta algum tipo de alergia?"),
                                    value: alergiaOutrosController,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        alergiaOutrosController = newValue;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                CheckboxListTile(
                                  title:
                                      Text("Tem hipertensão (pressão alta)?"),
                                  value: hipertensaoController,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      hipertensaoController = newValue;
                                    });
                                  },
                                  // controlAffinity: ListTileControlAffinity
                                  //     .leading, //  <-- leading Checkbox
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                CheckboxListTile(
                                  title:
                                      Text("Tem hipotensão (pressão baixa)?"),
                                  value: hipotensaoController,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      hipotensaoController = newValue;
                                    });
                                  },
                                  // controlAffinity: ListTileControlAffinity
                                  //     .leading, //  <-- leading Checkbox
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                CheckboxListTile(
                                  title: Text("Tem epilepsia (convulsão)?"),
                                  value: epilepsiaController,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      epilepsiaController = newValue;
                                    });
                                  },
                                  // controlAffinity: ListTileControlAffinity
                                  //     .leading, //  <-- leading Checkbox
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                CheckboxListTile(
                                  title: Text("Tem diabetes?"),
                                  value: diabetesController,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      diabetesController = newValue;
                                    });
                                  },
                                  // controlAffinity: ListTileControlAffinity
                                  //     .leading, //  <-- leading Checkbox
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                CheckboxListTile(
                                  title: Text("Tem problema renal?"),
                                  value: problemaRenalController,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      problemaRenalController = newValue;
                                    });
                                  },
                                  // controlAffinity: ListTileControlAffinity
                                  //     .leading, //  <-- leading Checkbox
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                CheckboxListTile(
                                  title: Text("Tem problema ocular?"),
                                  value: problemaOcularController,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      problemaOcularController = newValue;
                                    });
                                  },
                                  // controlAffinity: ListTileControlAffinity
                                  //     .leading, //  <-- leading Checkbox
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                CheckboxListTile(
                                  title: Text("Tem problema respiratório?"),
                                  value: problemaRespiratorioController,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      problemaRespiratorioController = newValue;
                                    });
                                  },
                                  // controlAffinity: ListTileControlAffinity
                                  //     .leading, //  <-- leading Checkbox
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                CheckboxListTile(
                                  title: Text("Fuma?"),
                                  value: fumanteController,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      fumanteController = newValue;
                                    });
                                  },
                                  // controlAffinity: ListTileControlAffinity
                                  //     .leading, //  <-- leading Checkbox
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                CheckboxListTile(
                                  title: Text(
                                      "Faz uso de medicamento de uso continuo?"),
                                  value: medicamentosUsoContinuoController,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      medicamentosUsoContinuoController =
                                          newValue;
                                    });
                                  },
                                  // controlAffinity: ListTileControlAffinity
                                  //     .leading, //  <-- leading Checkbox
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
