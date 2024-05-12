import 'package:flutter/material.dart';
import 'package:mobile_bl/main.dart';
import 'constans.dart';
import 'package:google_fonts/google_fonts.dart';

class Profiladd extends StatelessWidget {
  const Profiladd({Key? key}) : super(key: key);
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
            margin: EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        'Profile Picture',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 35,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    "Set Your Profile Picture! Adding photo to make your profile stuning.",
                    style: Interstyle.copyWith(fontSize: 15),
                    // textAlign: TextAlign.center,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image(image: AssetImage(tprofileimage))),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.infinity,
                      // margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Add Photo",
                          style:
                              Interstyle.copyWith(fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.infinity,
                      // margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Skip",
                          style: Interrrstyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColorWhite),
                      )),
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
                              color: Color(0xfffffffff), fontSize: 13),
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
                        style: Interstyle.copyWith(fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigasi ke halaman pendaftaran
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          "Log In",
                          style: Interrrstyle.copyWith(fontSize: 15),
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
