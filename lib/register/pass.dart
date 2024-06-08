import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_bl/main.dart';

class CreatePass extends StatefulWidget {
  final String phoneNumber;
  final String name;
  final String email;
  final String selectedGender;
  final String address;

  const CreatePass({
    Key? key,
    required this.phoneNumber,
    required this.name,
    required this.email,
    required this.selectedGender,
    required this.address,
  }) : super(key: key);

  @override
  _CreatePassState createState() => _CreatePassState();
}

class _CreatePassState extends State<CreatePass> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  void _saveDataToDatabase() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        print('Register button pressed');

        final url = 'http://localhost:8000/projek_api/post_register.php';

        final Map<String, dynamic> payload = {
          'email': widget.email,
          'password': _passwordController.text,
          'nama_lengkap': widget.name,
          'hp': widget.phoneNumber,
          'jenis_kelamin': widget.selectedGender,
          'alamat': widget.address,
        };

        final response = await http.post(Uri.parse(url), body: payload);

        setState(() {
          _isLoading = false;
        });

        if (response.statusCode == 200) {
          print('Data sent to database successfully.');
          print('Response: ${response.body}');

          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.topSlide,
            showCloseIcon: true,
            title: "Success",
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25,
            ),
            desc: "Registration successful! Back to login.",
            btnOkOnPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ).show();
        } else {
          _showErrorDialog('Error sending data to database.');
          print('Status code: ${response.statusCode}');
          print('Response: ${response.body}');
        }
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        _showErrorDialog('Error: $e');
        print('Error: $e');
      }
    }
  }

  void _showErrorDialog(String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
      showCloseIcon: true,
      title: "Error",
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 25,
      ),
      desc: message,
      btnOkOnPress: () {},
    ).show();
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
              child: Form(
                key: _formKey,
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
                            controller: _passwordController,
                            onChanged: (value) {
                              setState(() {});
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
                            controller: _confirmPasswordController,
                            passwordController: _passwordController,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    if (_isLoading)
                      Center(child: CircularProgressIndicator())
                    else
                      SizedBox(height: 40),
                    Container(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: _saveDataToDatabase,
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
      ),
    );
  }
}

class PasswordTextFieldCPass1 extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const PasswordTextFieldCPass1({
    Key? key,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  _PasswordTextFieldStateCPass1 createState() =>
      _PasswordTextFieldStateCPass1();
}

class _PasswordTextFieldStateCPass1 extends State<PasswordTextFieldCPass1> {
  bool isLogoPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isLogoPressed = !isLogoPressed;
        });
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            TextFormField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              obscureText: !isLogoPressed,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                } else if (value.length < 8) {
                  return 'Password must be at least 8 characters long';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Must Be 8 Characters",
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              ),
            ),
            Positioned(
              right: 10,
              top: 15,
              child: Icon(
                isLogoPressed ? Icons.visibility : Icons.visibility_off,
                color: isLogoPressed ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordTextFieldCPass2 extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController passwordController;
  final ValueChanged<String>? onChanged;

  const PasswordTextFieldCPass2({
    Key? key,
    required this.controller,
    required this.passwordController,
    this.onChanged,
  }) : super(key: key);

  @override
  _PasswordTextFieldStateCPass2 createState() =>
      _PasswordTextFieldStateCPass2();
}

class _PasswordTextFieldStateCPass2 extends State<PasswordTextFieldCPass2> {
  bool isLogoPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isLogoPressed = !isLogoPressed;
        });
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            TextFormField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              obscureText: !isLogoPressed,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                } else if (value != widget.passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Must Be 8 Characters",
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              ),
            ),
            Positioned(
              right: 10,
              top: 15,
              child: Icon(
                isLogoPressed ? Icons.visibility : Icons.visibility_off,
                color: isLogoPressed ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
