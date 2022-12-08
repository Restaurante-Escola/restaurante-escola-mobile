import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:restaurante_escola_app/student_choose/student_choose.dart';

class FichaCadastral extends StatefulWidget {
  const FichaCadastral({Key? key}) : super(key: key);



  @override
  State<FichaCadastral> createState() => _FichaCadastralState();
}

class _FichaCadastralState extends State<FichaCadastral> {
  TextEditingController textEditingController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Ficha Cadastral'),
      ),
      body: Center(child: Text('PDF_ficha_cadastral')),
    );
  }
}