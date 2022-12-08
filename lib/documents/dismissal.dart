import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:restaurante_escola_app/student_choose/student_choose.dart';

class Desligamento extends StatefulWidget {
  const Desligamento({Key? key}) : super(key: key);

  @override
  State<Desligamento> createState() => _DesligamentoState();
}

class _DesligamentoState extends State<Desligamento> {
  TextEditingController textEditingController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Desligamento'),
      ),
      body: Center(child: Text('PDF_desligamento')),
    );
  }
}

