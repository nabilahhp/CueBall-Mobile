import 'package:flutter/material.dart';
import 'package:mobile_bl/number.dart';
import 'package:mobile_bl/profile/profile_screen.dart';
import '../constans.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);
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
                child: Stack(
          children: [
            Positioned(
              left: 30,
              top: 40,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Warna latar belakang lingkaran
                  shape: BoxShape.circle, // Bentuk lingkaran
                ),
                child: Center(
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.yellow, // Warna ikon
                  ),
                ),
                ),
              ),
            ),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text('Edit Profile',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Color(0xffffffff),
                    ),
                  ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: Interstyle.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Your Name",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 16)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Email",
                        style: Interstyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Your Email",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 16)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Gender",
                        style: Interstyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                        ),
                        child: DropdownButtonFormField<String>(
                          onChanged: (String? newValue) {},
                          items: <String>[
                            'Male',
                            'Female',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                              hintText: "Choose Your Gender",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 16)),
                        ),
                      ),
                    ],
                  ),
                    SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Phone Number",
                        style: Interstyle.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Your Phone Number",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 16)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Address",
                        style: Interstyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Your Address",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 16)),
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileScreen()),
                          );
                        },
                        child: Text(
                          "Save",
                          style:
                              Interstyle.copyWith(fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor),
                      )),
                  SizedBox(
                    height: 45,
                  ),
                ]),
                ],
              )
              ),
            ),
          ),
          ],
      ),
    ),
    );
  }
}
