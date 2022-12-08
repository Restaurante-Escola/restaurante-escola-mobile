import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:restaurante_escola_app/student_choose/student_choose.dart';

class Advertencia extends StatefulWidget {
  const Advertencia({Key? key}) : super(key: key);

  @override
  State<Advertencia> createState() => _AdvertenciaState();
}

class _AdvertenciaState extends State<Advertencia> {
  TextEditingController textEditingController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Advertencia'),
      ),
      body: Center(child: Text('PDF_advertência')),
    );
  }
}