import 'package:flutter/material.dart';
import 'package:restaurante_escola_app/documents/registration-form.dart';
import 'package:restaurante_escola_app/documents/advertence.dart';
import 'package:restaurante_escola_app/documents/conclusion.dart';
import 'package:restaurante_escola_app/documents/dismissal.dart';
import 'package:restaurante_escola_app/documents/enrollment-declaration.dart';
import 'package:restaurante_escola_app/documents/image-prefecture.dart';
import 'package:restaurante_escola_app/documents/image-unisantos.dart';
import 'package:restaurante_escola_app/documents/ppe-uniform.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'mobile.dart' if (dart.library.html) 'web.dart';


void main() {
  runApp(HomeApp());
}

class HomeApp extends StatefulWidget {
  HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                title: Text("Restaurante Escola - Documentos"),
              backgroundColor: Color(0xFF801579B),
              centerTitle: true,
            ),
            body: const FirstScreen()));
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(2), //apply padding to all four sides
              child: Text(""),
            ),
            ElevatedButton(
              child: const Text('Ficha Cadastral'),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 50), backgroundColor: Colors.lightBlue,
                primary: Colors.blue,
                // side: BorderSide(color: Colors.yellow, width: 5),
                textStyle: const TextStyle(
                    color: Colors.white, fontSize: 15, fontStyle: FontStyle.normal),
                shadowColor: Colors.lightBlue,
                  ),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const FichaCadastral())),

                  ),
            Padding(
              padding: EdgeInsets.all(2), //apply padding to all four sides
              child: Text(""),
            ),
            ElevatedButton(
              child: const Text('Declaracão de Matrícula'),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 50), backgroundColor: Colors.lightBlue,
                primary: Colors.blue,
                // side: BorderSide(color: Colors.yellow, width: 5),
                textStyle: const TextStyle(
                    color: Colors.white, fontSize: 15, fontStyle: FontStyle.normal),

                shadowColor: Colors.lightBlue,
              ),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const DeclaracaoMatricula())),
            ),
            Padding(
              padding: EdgeInsets.all(2), //apply padding to all four sides
              child: Text(""),
            ),

            ElevatedButton(
              child: const Text('Imagem Prefeitura'),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 40), backgroundColor: Colors.lightBlue,
                primary: Colors.blue,
                // side: BorderSide(color: Colors.yellow, width: 5),
                textStyle: const TextStyle(
                    color: Colors.white, fontSize: 15, fontStyle: FontStyle.normal),

                shadowColor: Colors.lightBlue,
              ),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const ImagemPrefeitura())),
            ),

            Padding(
              padding: EdgeInsets.all(2), //apply padding to all four sides
              child: Text(""),
            ),
            ElevatedButton(
              child: const Text('Desligamento'),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 40), backgroundColor: Colors.lightBlue,
                primary: Colors.blue,
                // side: BorderSide(color: Colors.yellow, width: 5),
                textStyle: const TextStyle(
                    color: Colors.white, fontSize: 15, fontStyle: FontStyle.normal),

                shadowColor: Colors.lightBlue,
              ),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const Desligamento())),
            ),

            Padding(
              padding: EdgeInsets.all(2), //apply padding to all four sides
              child: Text(""),
            ),
            ElevatedButton(
              child: const Text('Imagem Unisantos'),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 40), backgroundColor: Colors.lightBlue,
                primary: Colors.blue,
                // side: BorderSide(color: Colors.yellow, width: 5),
                textStyle: const TextStyle(
                    color: Colors.white, fontSize: 15, fontStyle: FontStyle.normal),
                shadowColor: Colors.lightBlue,
              ),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const ImagemUnisantos())),
            ),

            Padding(
              padding: EdgeInsets.all(2), //apply padding to all four sides
              child: Text(""),
            ),
            ElevatedButton(
              child: const Text('Advertência'),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 40), backgroundColor: Colors.lightBlue,
                primary: Colors.blue,
                // side: BorderSide(color: Colors.yellow, width: 5),
                textStyle: const TextStyle(
                    color: Colors.white, fontSize: 15, fontStyle: FontStyle.normal),

                shadowColor: Colors.lightBlue,
              ),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const Advertencia())),
            ),

            Padding(
              padding: EdgeInsets.all(2), //apply padding to all four sides
              child: Text(""),
            ),
            ElevatedButton(

              child: const Text('EPI / UNIFORME'),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 40), backgroundColor: Colors.lightBlue,
                primary: Colors.blue,
                // side: BorderSide(color: Colors.yellow, width: 5),
                textStyle: const TextStyle(
                    color: Colors.white, fontSize: 15, fontStyle: FontStyle.normal),

                shadowColor: Colors.lightBlue,
              ),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const EpiUniforme())),
            ),
            Padding(
              padding: EdgeInsets.all(2), //apply padding to all four sides
              child: Text(""),
            ),
            ElevatedButton(

              child: const Text('Conclusão'),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 40), backgroundColor: Colors.lightBlue,
                primary: Colors.blue,
                // side: BorderSide(color: Colors.yellow, width: 5),
                textStyle: const TextStyle(
                    color: Colors.white, fontSize: 15, fontStyle: FontStyle.normal),

                shadowColor: Colors.lightBlue,
              ),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const Conclusao())),
            ),
          ],
        ),
      ),
    );
  }
}























