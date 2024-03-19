import 'package:flutter/material.dart';
import 'package:tpm_quiz/homepage.dart';
import 'package:tpm_quiz/DummyMahasiswa.dart';

bool isLoginSuccess = true;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  // Mahasiswa().


  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<Login> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('E-LEARNING UPNYK'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Login',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              _usernameField(),
              _passwordField(),
              _loginButton(context),

            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  Widget _usernameField() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration:
        const InputDecoration(border: OutlineInputBorder(), hintText: 'username'),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
        padding: const EdgeInsets.all(15),
        child: TextFormField(
          enabled: true,
          obscureText: true,
          onChanged: (value) {
            password = value;
          },
          decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: 'password'),
        ));
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
            foregroundColor:
            MaterialStateProperty.all<Color>(Colors.lightBlueAccent)),
        onPressed: () {
          String text = "";
          if(username == "admin" && password == "admin"){
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return HomePage();
                  })
              );
            });
          } else {
            setState(() {
              text = "Login Failed";
              isLoginSuccess = false;
            });
          }

          SnackBar snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text("Login"),
      ),
    );
  }
}
