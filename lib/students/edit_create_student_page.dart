import 'package:flutter/material.dart';

class EditCreateStudent extends StatefulWidget {
  final String title;
  EditCreateStudent({Key? key, required this.title}) : super(key: key);

  @override
  _EditCreateStudentState createState() => _EditCreateStudentState();
}

class _EditCreateStudentState extends State<EditCreateStudent> {
  DateTime selectedDate = DateTime.now();

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
      });
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nomeController = TextEditingController();
  TextEditingController nomeSocialController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController estadoCivilController = TextEditingController();
  // TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController rgController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController telefoneCelularController = TextEditingController();
  TextEditingController telefoneRecadoController = TextEditingController();
  TextEditingController nomePessoaTelefoneRecadoController =
      TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nomeResponsavelController = TextEditingController();
  TextEditingController escolaridadeController = TextEditingController();
  TextEditingController escolaridadeGrauController = TextEditingController();
  TextEditingController escolaController = TextEditingController();
  TextEditingController anoFormacaoController = TextEditingController();
  TextEditingController camisetaController = TextEditingController();
  TextEditingController sapatoController = TextEditingController();
  TextEditingController servicoAtendimentoController = TextEditingController();
  TextEditingController unidadeController = TextEditingController();
  TextEditingController tecnicoController = TextEditingController();
  TextEditingController telefoneTecnicoController = TextEditingController();
  // TextEditingController alergiaController = TextEditingController();
  bool? alergia = false;
  bool? alergiaRemedio = false;
  bool? alergiaAlimento = false;
  bool? alergiaOutros = false;
  TextEditingController alergiaAlimentoController = TextEditingController();
  TextEditingController alergiaOutrosController = TextEditingController();
  TextEditingController alergiaRemedioController = TextEditingController();
  TextEditingController especificacaoAlergiaController =
      TextEditingController();
  TextEditingController hipertensaoController = TextEditingController();
  TextEditingController hipotensaoController = TextEditingController();
  TextEditingController epilepsiaController = TextEditingController();
  TextEditingController diabetesController = TextEditingController();
  TextEditingController problemaRenalController = TextEditingController();
  TextEditingController problemaOcularController = TextEditingController();
  TextEditingController problemaRespiratorioController =
      TextEditingController();
  TextEditingController fumanteController = TextEditingController();
  TextEditingController medicamentosUsoContinuoController =
      TextEditingController();
  TextEditingController observacaoController = TextEditingController();
  TextEditingController matriculaController = TextEditingController();
  TextEditingController turmaController = TextEditingController();

  List<String> _locations = ['A', 'B', 'C', 'D'];
  List<String> _escolaridades = ['Ensino fundamental', 'Ensino médio'];
  List<String> _escolaridadeGraus = ['Completo', 'Cursando'];
  List<String> _servicosAtendimento = ['CRAS', 'CREAS', 'Centro Comunitário'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFF801579B),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
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
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                          items: _locations.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'Turma',
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
                          controller: nomeController,
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
                          controller: nomeController,
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
                          controller: nomeController,
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
                          controller: nomeController,
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
                  Expanded(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: Text('Select date'),
                        ),
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
                          controller: nomeController,
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
                          controller: nomeController,
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
                          controller: nomeController,
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
                          controller: nomeController,
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
                          controller: nomeController,
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
                          controller: nomeController,
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
                          controller: nomeController,
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
                          controller: nomeController,
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
                          controller: nomeController,
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
                        DropdownButtonFormField(
                          isExpanded: true,
                          items:
                              _escolaridades.map((String dropDownStringItem) {
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
                          controller: nomeController,
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
                        DropdownButtonFormField(
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
                          controller: nomeController,
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
                          controller: nomeController,
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
                          controller: nomeController,
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
                          controller: nomeController,
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
                          controller: nomeController,
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
                          controller: nomeController,
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
                          title: Text("Apresenta algum tipo de alergia?"),
                          value: alergia,
                          onChanged: (bool? newValue) {
                            setState(() {
                              alergia = newValue;
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
                visible: alergia != null && alergia != false,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CheckboxListTile(
                            title: Text("Remédio"),
                            value: alergiaRemedio,
                            onChanged: (bool? newValue) {
                              setState(() {
                                alergiaRemedio = newValue;
                              });
                            },
                          ),
                          CheckboxListTile(
                            title: Text("Alimento"),
                            value: alergiaAlimento,
                            onChanged: (bool? newValue) {
                              setState(() {
                                alergiaAlimento = newValue;
                              });
                            },
                          ),
                          CheckboxListTile(
                            title: Text("Apresenta algum tipo de alergia?"),
                            value: alergiaOutros,
                            onChanged: (bool? newValue) {
                              setState(() {
                                alergiaOutros = newValue;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
