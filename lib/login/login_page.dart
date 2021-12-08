import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:restaurante_escola_app/core/app_images.dart';
import 'package:restaurante_escola_app/login/login_store.dart';
import 'package:restaurante_escola_app/splash/splash_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool invalidEmail = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginStore loadingStore = LoginStore();

  void _submit() {
    setState(() {
      loadingStore.login(
          "restauranteescola@gmail.com", "restauranteescolaunisantos013");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Container(
                        child: Image.asset(AppImages.logo),
                        width: 250,
                        height: 250,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              onTap: () => {invalidEmail = false},
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !value.contains("@") ||
                                    !value.contains(".")) {
                                  setState(() {
                                    invalidEmail = true;
                                  });
                                  return "Insira seu login!";
                                }

                                setState(() {
                                  invalidEmail = false;
                                });
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Insira sua senha!";
                                }

                                return null;
                              },
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Senha",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelStyle: TextStyle(
                                  // color: Color(0xFF801579B),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              height: 50,
                              child: Observer(builder: (_) {
                                return ElevatedButton(
                                  child: loadingStore.loading
                                      ? SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              const Color(0xFFFFFFFF),
                                            ),
                                            strokeWidth: 3,
                                          ),
                                        )
                                      : Text("Entrar"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF801579B),
                                    minimumSize: Size(double.infinity, 30),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10) // <-- Radius
                                        ),
                                  ),
                                  onPressed: () {
                                    if (!loadingStore.loading) {
                                      if (_formKey.currentState!.validate()) {
                                        _submit();
                                      }
                                    }
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => SplashPage(),
                                    //   ),
                                    // );
                                  },
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
