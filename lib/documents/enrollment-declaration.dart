import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:restaurante_escola_app/student_choose/student_choose.dart';

class DeclaracaoMatricula extends StatefulWidget {
  const DeclaracaoMatricula({Key? key}) : super(key: key);

  @override
  State<DeclaracaoMatricula> createState() => _DeclaracaoMatriculaState();
}

class _DeclaracaoMatriculaState extends State<DeclaracaoMatricula> {
  TextEditingController textEditingController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Declaracão de Matrícula'),
      ),
      body: Center(child: Text('PDF_declaracao_de_matricula')),
    );
  }
}