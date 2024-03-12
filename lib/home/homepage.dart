import 'package:flutter/material.dart';
import 'package:flutter_app/home/loginPage.dart';

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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              setState(() {
                showMember = !showMember;
                if (showMember) {
                  member = "123200102 - Muhammad Dzaki"; // Replace "Your Name" with your actual name
                } else {
                  member = ''; // Clear the username if it's not supposed to be shown
                }
              });
            },
            child: Text(showMember ? 'Hide Member' : 'Show Member'),
          ),
          const SizedBox(height: 20),
          if (showMember) Text(member),
        ],
      ),
    );
  }

  // Function to build the calculator screen widget
  Widget _buildCalculatorScreen() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                number1 = double.tryParse(value) ?? 0.0;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Number 1',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                number2 = double.tryParse(value) ?? 0.0;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Number 2',
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    result = number1 + number2;
                  });
                },
                child: const Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    result = number1 - number2;
                  });
                },
                child: const Text('Subtract'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Result: ${result.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );

  }

  // Function to build the odd-even number screen widget
  Widget _buildOddEvenNumberScreen() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: numberController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                int number = int.tryParse(value) ?? 0;
                if (number % 2 == 0) {
                  oddEvenResult = '$number is Even';
                } else {
                  oddEvenResult = '$number is Odd';
                }
              });
            },
            decoration: const InputDecoration(
              labelText: 'Enter a Number',
            ),
          ),
          const SizedBox(height: 20),
          Text(
            oddEvenResult,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
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
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () {
                SnackBar snackBar = const SnackBar(content: Text('Logout success'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // handle the press
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (builder) {
                      return const LoginPage();
                })
                );
              },
            ),
          ],
        ),
        body: _selectedIndex == 0 ? _buildHomeScreen() :
              _selectedIndex == 1 ? _buildCalculatorScreen() :
              _selectedIndex == 2 ? _buildOddEvenNumberScreen() : null,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'calculator',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.numbers),
              label: 'number',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
