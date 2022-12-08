import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:restaurante_escola_app/student_choose/student_choose.dart';

class ImagemUnisantos extends StatefulWidget {
  const ImagemUnisantos({Key? key}) : super(key: key);

  @override
  State<ImagemUnisantos> createState() => _ImagemUnisantosState();
}

class _ImagemUnisantosState extends State<ImagemUnisantos> {
  TextEditingController textEditingController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Imagem Unisantos'),
      ),
      body: Center(child: Text('PDF_imagem_unisantos')),
    );
  }
}