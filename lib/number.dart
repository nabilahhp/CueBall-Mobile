import 'package:flutter/material.dart';
import 'package:mobile_bl/main.dart';
import 'constans.dart';
import 'profileadd.dart';
import 'package:google_fonts/google_fonts.dart';

class Number extends StatefulWidget {
  final String nameController;
  final String emailController;
  final String selectedGender; // Mengubah tipe data menjadi String

  const Number({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.selectedGender, // Mengubah tipe data menjadi String
  }) : super(key: key);

  @override
  _NumberState createState() => _NumberState();
}


class _NumberState extends State<Number> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

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
                    'Contact & Address',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 35,
                      color: Color(0xffffffff),
                    ),
                  ),
                  SizedBox(height: 11),
                  Text(
                    "Your phone number and address? It helps us keep your profile updated.",
                    style: Interstyle.copyWith(fontSize: 15),
                  ),
                  SizedBox(height: 34),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone Number",
                        style: Interstyle.copyWith(fontSize: 14),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                        ),
                        child: TextField(
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Your Phone Number",
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Address",
                        style: Interstyle.copyWith(fontSize: 14),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                        ),
                        child: TextField(
                          controller: addressController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Your Address",
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        // Logging the values to the console
                        print('Phone Number: ${phoneNumberController.text}');
                        print('Address: ${addressController.text}');
                        
                        // Navigasi ke halaman selanjutnya dengan membawa data nomor telepon dan alamat
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profiladd(
                              phoneNumber: phoneNumberController.text,
                              address: addressController.text,
                              name: widget.nameController,
                              email: widget.emailController,
                              selectedGender: widget.selectedGender,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Next",
                        style: Interstyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 45),
                  Row(
                    children: <Widget>[
                      Expanded(child: Divider(color: Colors.white)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7.0),
                        child: Text(
                          "Or with",
                          style: TextStyle(color: Color(0xfffffffff), fontSize: 13),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? ", style: Interstyle.copyWith(fontSize: 15)),
                      GestureDetector(
                        onTap: () {
                          // Navigasi ke halaman pendaftaran
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text("Log In", style: Interrrstyle.copyWith(fontSize: 15)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
