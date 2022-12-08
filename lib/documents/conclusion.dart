import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:restaurante_escola_app/student_choose/student_choose.dart';

class Conclusao extends StatefulWidget {
  const Conclusao({Key? key}) : super(key: key);

  @override
  State<Conclusao> createState() => _ConclusaoState();
}

class _ConclusaoState extends State<Conclusao> {
  TextEditingController textEditingController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Conclusão'),
      ),
      body: Center(child: Text('PDF_conclusao')),
    );
  }
}