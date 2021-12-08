import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurante_escola_app/students/students_page.dart';
import 'package:restaurante_escola_app/turmas/turmas_page.dart';
import 'package:smart_page_navigation/smart_page_navigation.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SmartPageController controller;
  List<StatefulWidget> pages = [
    StudentPage(),
    TurmasPage(),
    StudentPage(),
  ];

  DateTime currentBackPressTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    controller = SmartPageController.newInstance(
      initialPages: pages,
      context: context,
    );

    controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: Scaffold(
          body: SmartPageNavigation(
            controller: controller,
          ),
          bottomNavigationBar: SmartPageBottomNavigationBar(
            controller: controller,
            options: SmartPageBottomNavigationOptions(
              selectedColor: Color(0xFF801579B),
              indicatorColor: Color(0xFF801579B),
            ),
            children: [
              BottomIcon(
                icon: Icons.supervisor_account_rounded,
                title: "Alunos",
              ),
              BottomIcon(
                icon: Icons.class_,
                title: "Turmas",
              ),
              BottomIcon(
                icon: Icons.settings,
                title: "Configurações",
                //hideBottomNavigationBar: true,
              ),
            ],
          ),
        ),
        onWillPop: onWillPop,
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Clique novamente para sair do app',
        backgroundColor: Color(0xFF8C948F),
      );
      return Future.value(false);
    }
    return Future.value(true);
  }
}
