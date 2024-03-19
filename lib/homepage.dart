import 'package:flutter/material.dart';
import 'package:tpm_quiz/login.dart';
import 'package:tpm_quiz/DummyMahasiswa.dart';
import 'package:tpm_quiz/profile.dart';

bool isLoginSuccess = true;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  String member = "";
  bool showMember = false;

  double number1 = 0.0;
  double number2 = 0.0;
  double result = 0.0;

  TextEditingController numberController = TextEditingController();
  String oddEvenResult = '';


  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Function to build the home screen widget
  Widget _buildHomeScreen() {
    return ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Teman ${index + 1}\nNIM\nTahun Masuk', style: TextStyle(fontSize: 15)),
            ),
          );
        },
        itemCount: 12,
    );
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Home Page'),
          actions: [
            IconButton(
                icon: const Icon(Icons.person),
                tooltip: 'profile',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Profile();
                  }));
                }
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () {
                SnackBar snackBar = const SnackBar(content: Text('Logout success'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // handle the press
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (builder) {
                  return const Login();
                })
                );
              },
            ),

          ],
        ),
        body: _buildHomeScreen()
      ),
    );
  }
}
