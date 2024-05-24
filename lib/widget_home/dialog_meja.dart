import 'package:flutter/material.dart';

class DialogMeja extends StatefulWidget {
  const DialogMeja({Key? key}) : super(key: key);

  @override
  State<DialogMeja> createState() => _DialogMejaState();
}

class _DialogMejaState extends State<DialogMeja> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _showDialog();
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismiss by tapping outside of the dialog
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Stack(
            children: [
              Container(
                width: 325,
                height: 657,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 10,
                      offset: Offset(0, -4),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),  
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  icon: Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    ).then((value) {
      // Call dispose when the dialog is dismissed
      if (mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Optional: Make background transparent
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DialogMeja(),
  ));
}
