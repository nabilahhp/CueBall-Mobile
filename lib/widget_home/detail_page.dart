import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_bl/widget_home/dialog_meja.dart';
import 'package:mobile_bl/api/meja.dart'; // Import model Meja

class DetailPage extends StatelessWidget {
  final Meja meja;

  const DetailPage({Key? key, required this.meja}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Container(
              height: 800,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/data/latar.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Back Button
          Positioned(
            left: 30,
            top: 40,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.yellow,
                ),
              ),
            ),
          ),
          // Red Container
          Positioned(
            top: 250,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 800,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 45),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 210),
                    Text(
                      meja.nm,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Color(0xffFBBC05),
                      ),
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          meja.ket.isNotEmpty
                              ? meja.ket
                              : "Lorem ipsum dolor sit amet.",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              meja.harga,
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffFBBC05),
                              ),
                            ),
                            Text(
                              "/Hour",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Description',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Color(0xffFBBC05),
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      meja.ket.isNotEmpty
                          ? meja.ket
                          : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse convallis, massa ultricies tempor condimentum, lacus elit accumsan lorem, vel sagittis magna sem eu lectus. Aliquam fringilla luctus turpis at vehicula. Sed quis auctor Show More...",
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Color(0xff000000),
                      ),
                    ),
                    SizedBox(height: 23),
                    Container(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DialogMeja(meja: meja);
                            },
                          );
                        },
                        child: Text(
                          "Booking Now",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffFBBC05),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Image Container
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 315,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage("lib/image/${meja.foto}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // Additional Features like Free Wifi, Public Toilet, AC
          Positioned(
            top: 410,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FeatureWidget(
                    icon: Icons.wifi,
                    label: "Free Wifi",
                  ),
                  SizedBox(width: 5),
                  FeatureWidget(
                    icon: Icons.bathroom_rounded,
                    label: "Toilet",
                  ),
                  SizedBox(width: 5),
                  FeatureWidget(
                    icon: Icons.ac_unit,
                    label: "AC",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  FeatureWidget({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 102,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xffEDEEEF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Color(0xff101010),
          ),
          SizedBox(width: 5),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff101010),
            ),
          ),
        ],
      ),
    );
  }
}
