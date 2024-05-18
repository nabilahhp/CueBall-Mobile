import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categorieswidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Row(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 7),
          child: Container(
            width: 170,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0,3)
                )
              ]
            ),
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "lib/data/meja.png",
                  height: 130,
                ),
              ),
              Text(
                "Mini Table 1",
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Lorem ipsum dolor sit amet. ",
                style: GoogleFonts.inter(
                  fontSize: 9,
                  color: Color(0xff121212),
                ),
              ),
               SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "12.000",
                    style: GoogleFonts.poppins(
                      color: Colors.yellow,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                   SizedBox(
                height: 5,
              ),
                  Text(
                    " /Hour",
                    style: GoogleFonts.poppins(
                      color: Color(0xff898282),
                      fontSize: 10,
                    ),
                  )
                ],
              )
            ],
            ),),
          ),),
          Padding(padding: EdgeInsets.symmetric(horizontal: 7),
          child: Container(
            width: 170,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0,3)
                )
              ]
            ),
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "lib/data/meja.png",
                  height: 130,
                ),
              ),
              Text(
                "Mini Table 1",
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Lorem ipsum dolor sit amet. ",
                style: GoogleFonts.inter(
                  fontSize: 9,
                  color: Color(0xff121212),
                ),
              ),
               SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "12.000",
                    style: GoogleFonts.poppins(
                      color: Colors.yellow,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                   SizedBox(
                height: 5,
              ),
                  Text(
                    " /Hour",
                    style: GoogleFonts.poppins(
                      color: Color(0xff898282),
                      fontSize: 10,
                    ),
                  )
                ],
              )
            ],
            ),),
          ),),
          Padding(padding: EdgeInsets.symmetric(horizontal: 7),
          child: Container(
            width: 170,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0,3)
                )
              ]
            ),
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "lib/data/meja.png",
                  height: 130,
                ),
              ),
              Text(
                "Mini Table 1",
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Lorem ipsum dolor sit amet. ",
                style: GoogleFonts.inter(
                  fontSize: 9,
                  color: Color(0xff121212),
                ),
              ),
               SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "12.000",
                    style: GoogleFonts.poppins(
                      color: Colors.yellow,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                   SizedBox(
                height: 5,
              ),
                  Text(
                    " /Hour",
                    style: GoogleFonts.poppins(
                      color: Color(0xff898282),
                      fontSize: 10,
                    ),
                  )
                ],
              )
            ],
            ),),
          ),),
          Padding(padding: EdgeInsets.symmetric(horizontal: 7),
          child: Container(
            width: 170,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0,3)
                )
              ]
            ),
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "lib/data/meja.png",
                  height: 130,
                ),
              ),
              Text(
                "Mini Table 1",
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Lorem ipsum dolor sit amet. ",
                style: GoogleFonts.inter(
                  fontSize: 9,
                  color: Color(0xff121212),
                ),
              ),
               SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "12.000",
                    style: GoogleFonts.poppins(
                      color: Colors.yellow,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                   SizedBox(
                height: 5,
              ),
                  Text(
                    " /Hour",
                    style: GoogleFonts.poppins(
                      color: Color(0xff898282),
                      fontSize: 10,
                    ),
                  )
                ],
              )
            ],
            ),),
          ),),
        ],
      ),
      ),
    );
  }
}