import 'package:flutter/material.dart';

class PasswordTextFieldLogin extends StatefulWidget {
  @override
  _PasswordTextFieldStateLogin createState() => _PasswordTextFieldStateLogin();
}

class _PasswordTextFieldStateLogin extends State<PasswordTextFieldLogin> {
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
            TextField(
              obscureText: !isLogoPressed,
              decoration: InputDecoration(
                hintText: "Password",
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

//Textfield create pass 1
class PasswordTextFieldCPass1 extends StatefulWidget {
  @override
  _PasswordTextFieldStateCPass1 createState() => _PasswordTextFieldStateCPass1();
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
            TextField(
              obscureText: !isLogoPressed,
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

//Textfield create pass 2
class PasswordTextFieldCPass2 extends StatefulWidget {
  @override
  _PasswordTextFieldStateCPass2 createState() => _PasswordTextFieldStateCPass2();
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
            TextField(
              obscureText: !isLogoPressed,
              decoration: InputDecoration(
                hintText: "Repeat Password",
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