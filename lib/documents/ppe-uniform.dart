import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:restaurante_escola_app/student_choose/student_choose.dart';

class EpiUniforme extends StatefulWidget {
  const EpiUniforme({Key? key}) : super(key: key);

  @override
  State<EpiUniforme> createState() => _EpiUniformeState();
}

class _EpiUniformeState extends State<EpiUniforme> {
  TextEditingController textEditingController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Epi / Uniforme'),
      ),
      body: Center(child: Text('PDF_epi_uniforme')),
    );
  }
}