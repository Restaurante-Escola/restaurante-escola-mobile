import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_escola_app/turmas/turmas_store.dart';

class TurmasPage extends StatefulWidget {
  TurmasPage({Key? key}) : super(key: key);

  @override
  _TurmasPageState createState() => _TurmasPageState();
}

class _TurmasPageState extends State<TurmasPage> {
  late TurmasStore turmasStore;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      turmasStore.getTurmas();
    });
  }

  @override
  Widget build(BuildContext context) {
    turmasStore = Provider.of<TurmasStore>(context);
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Restaurante Escola - Turmas"),
          backgroundColor: Color(0xFF801579B),
          centerTitle: true,
        ),
        body: !turmasStore.loading
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: turmasStore.turmas.length,
                  itemBuilder: (BuildContext context, index) {
                    return Card(
                      child: InkWell(
                        onTap: () => {print("oi")},
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text.rich(
                                    TextSpan(
                                      text:
                                          "Turma ${turmasStore.turmas[index].numero}",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Período vigente: ${turmasStore.turmas[index].inicioTurma.day}/${turmasStore.turmas[index].inicioTurma.month}/${turmasStore.turmas[index].inicioTurma.year} - ${turmasStore.turmas[index].fimTurma.day}/${turmasStore.turmas[index].fimTurma.month}/${turmasStore.turmas[index].fimTurma.year}",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(const Color(0xFF801579B)),
                ),
              ),
      );
    });
  }
}
