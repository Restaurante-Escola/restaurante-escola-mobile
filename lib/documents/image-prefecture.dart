import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:restaurante_escola_app/student_choose/student_choose.dart';

class ImagemPrefeitura extends StatefulWidget {
  const ImagemPrefeitura({Key? key}) : super(key: key);

  @override
  State<ImagemPrefeitura> createState() => _ImagemPrefeituraState();
}

class _ImagemPrefeituraState extends State<ImagemPrefeitura> {
  TextEditingController textEditingController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Imagem Prefeitura'),
      ),
      body: Center(child: Text('PDF_imagem_prefeitura')),
    );
  }
}