import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_bl/hidden_textfield.dart';
import 'package:mobile_bl/main.dart';

class CreatePass extends StatefulWidget {
  final String phoneNumber;
  final String name;
  final String email;
  final String selectedGender;
  final String address;
  final File? imageFile;
  final Uint8List? webImage;

  const CreatePass({
    Key? key,
    required this.phoneNumber,
    required this.name,
    required this.email,
    required this.selectedGender,
    required this.address,
    required this.imageFile,
    required this.webImage,
  }) : super(key: key);

  @override
  _CreatePassState createState() => _CreatePassState();
}

class _CreatePassState extends State<CreatePass> {
  late String _password = '';
  late String _confirmPassword = '';

  void _saveDataToDatabase() async {
    try {
      print('Register button pressed');

      final url = 'http://localhost:8000/projek_api/post_register.php';

      final Map<String, dynamic> payload = {
        'email': widget.email,
        'password': _password,
        'nama_lengkap': widget.name,
        'hp': widget.phoneNumber,
        'jenis_kelamin': widget.selectedGender,
        'alamat': widget.address,
        'foto': base64Encode(widget.imageFile!.readAsBytesSync()),
      };

      final response = await http.post(Uri.parse(url), body: payload);

      if (response.statusCode == 200) {
        print('Data sent to database successfully.');
        print('Response: ${response.body}');

        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.topSlide,
          showCloseIcon: true,
          title: "Back To Login",
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
          desc: "Back To Login",
          btnOkOnPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ).show();
      } else {
        print('Error sending data to database.');
        print('Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/data/latar.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 11),
                  Text(
                    "Please create a strong password to protect your account.",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  SizedBox(height: 34),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: PasswordTextFieldCPass1(
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Confirm Password",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: PasswordTextFieldCPass2(
                          onChanged: (value) {
                            setState(() {
                              _confirmPassword = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_password == _confirmPassword &&
                            _password.isNotEmpty) {
                          _saveDataToDatabase();
                        } else {
                          print('Passwords do not match or are empty.');
                        }
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7.0),
                        child: Text(
                          "Or with",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
