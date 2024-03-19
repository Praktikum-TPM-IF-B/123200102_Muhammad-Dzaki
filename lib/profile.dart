import 'package:flutter/material.dart';
import 'package:tpm_quiz/homepage.dart';
import 'package:tpm_quiz/DummyMahasiswa.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();

}

class _ProfileState extends State<Profile> {
  String username = "dzaki";

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Profile Anda'),
        ),
        body: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Nama',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text(
                'Username',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                'NIM',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                'IPK',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                'Tahun Masuk',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                'Total SKS diambil',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                'Current Semester',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
