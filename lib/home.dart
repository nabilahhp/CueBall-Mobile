import 'package:mobile_bl/widget_home/categorismeja.dart';
import 'package:mobile_bl/widget_home/food.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.blue[800],ihya
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('lib/data/latar.png'),
        fit: BoxFit.cover,
      )),
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            // margin: EdgeInsets.symmetric(
            //   horizontal: 10,
            // ),
            padding: const EdgeInsets.all(25.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity, // Pastikan lebar penuh
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Mengatur alignment ke kiri
                        children: [
                          Text(
                            'Welcome, XX X!',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              fontSize: 35,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tincidunt.",
                      style: GoogleFonts.poppins(
                        // fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage('lib/data/page.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      padding: EdgeInsets.all(40),
                      height: 180,
                    ),
                    Positioned(
                      bottom: 100,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            // color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Discover the Ultimate Billiard Experience',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Color(0xff8B7E7E),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                          color: Color(0xff8B7E7E),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      width: double.infinity, // Pastikan lebar penuh
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Mengatur alignment ke kiri
                        children: [
                          Text(
                            'Get Ready to Master the Game',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Our Most Popular Billiard Tables",
                            style: GoogleFonts.poppins(
                              // fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Color(0xffffffff),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Categorieswidget(),
                Column(
                  children: [
                    Container(
                      width: double.infinity, // Pastikan lebar penuh
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Mengatur alignment ke kiri
                        children: [
                          Text(
                            'Delicious Food & Drinks',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Delight in Tasty Food & Drinks",
                            style: GoogleFonts.poppins(
                              // fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Color(0xffffffff),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                food()
              ],
            ),
          ),
        ),
      ),
    ));
  }
}