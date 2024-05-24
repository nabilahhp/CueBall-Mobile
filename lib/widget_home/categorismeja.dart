import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_bl/widget_home/detail_page.dart';

class Categorieswidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: InkWell(
                onTap: () {
                  // Navigate to the desain_page when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage()),
                  );
                },
                child: Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Top part for the image
                      Container(
                        height: 110, // Half of the total height
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.asset(
                            "lib/data/page.png",
                            width: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      // Bottom part for the description
                      Expanded(
                        child: Container(
                          height: 89, // Half of the total height
                          padding: EdgeInsets.symmetric(horizontal: 10,),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mini Table 1",
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "Lorem ipsum dolor sit amet.",
                                style: GoogleFonts.inter(
                                  fontSize: 9,
                                  color: Color(0xff121212),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text(
                                    "12.000",
                                    style: GoogleFonts.poppins(
                                      color: Colors.yellow,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    " /Hour",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xff898282),
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: InkWell(
                onTap: () {
                  // Navigate to the desain_page when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage()),
                  );
                },
                child: Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Top part for the image
                      Container(
                        height: 110, // Half of the total height
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.asset(
                            "lib/data/page.png",
                            width: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      // Bottom part for the description
                      Expanded(
                        child: Container(
                          height: 89, // Half of the total height
                          padding: EdgeInsets.symmetric(horizontal: 10,),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mini Table 1",
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "Lorem ipsum dolor sit amet.",
                                style: GoogleFonts.inter(
                                  fontSize: 9,
                                  color: Color(0xff121212),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text(
                                    "12.000",
                                    style: GoogleFonts.poppins(
                                      color: Colors.yellow,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    " /Hour",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xff898282),
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: InkWell(
                onTap: () {
                  // Navigate to the desain_page when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage()),
                  );
                },
                child: Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Top part for the image
                      Container(
                        height: 110, // Half of the total height
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.asset(
                            "lib/data/page.png",
                            width: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      // Bottom part for the description
                      Expanded(
                        child: Container(
                          height: 89, // Half of the total height
                          padding: EdgeInsets.symmetric(horizontal: 10,),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mini Table 1",
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "Lorem ipsum dolor sit amet.",
                                style: GoogleFonts.inter(
                                  fontSize: 9,
                                  color: Color(0xff121212),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text(
                                    "12.000",
                                    style: GoogleFonts.poppins(
                                      color: Colors.yellow,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    " /Hour",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xff898282),
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: InkWell(
                onTap: () {
                  // Navigate to the desain_page when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage()),
                  );
                },
                child: Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Top part for the image
                      Container(
                        height: 110, // Half of the total height
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.asset(
                            "lib/data/page.png",
                            width: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      // Bottom part for the description
                      Expanded(
                        child: Container(
                          height: 89, // Half of the total height
                          padding: EdgeInsets.symmetric(horizontal: 10,),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mini Table 1",
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "Lorem ipsum dolor sit amet.",
                                style: GoogleFonts.inter(
                                  fontSize: 9,
                                  color: Color(0xff121212),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text(
                                    "12.000",
                                    style: GoogleFonts.poppins(
                                      color: Colors.yellow,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    " /Hour",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xff898282),
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
