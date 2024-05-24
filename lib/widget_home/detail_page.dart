import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_bl/widget_home/dialog_meja.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar latar belakang
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
          // Tombol IconButton

          // Kontainer merah
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
                margin: EdgeInsets.symmetric(
                  horizontal: 45,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 210,
                    ),
                    Text(
                      'Mini Tables Billiard',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Color(0xffFBBC05),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Lorem ipsum dolor sit amet.",
                              style: GoogleFonts.inter(
                                  fontSize: 14, color: Color(0xff000000)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "12.000",
                              style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffFBBC05)),
                            ),
                            Text(
                              "/Hour",
                              style: GoogleFonts.inter(
                                  fontSize: 14, color: Color(0xff000000)),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Description',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Color(0xffFBBC05),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Column(
                      children: [
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse convallis, massa ultricies tempor condimentum, lacus elit accumsan lorem, vel sagittis magna sem eu lectus. Aliquam fringilla luctus turpis at vehicula.",
                          style: GoogleFonts.inter(
                              fontSize: 13, color: Color(0xff000000)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    Container(
                        width: double.infinity,
                        // margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return DialogMeja();
                                });
                          },
                          child: Text(
                            "Booking Now",
                            style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffFBBC05)),
                        )),
                  ],
                ),
              ),
            ),
          ),

          Stack(
            children: [
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
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage("lib/data/page.png"),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 30,
            top: 40,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Warna latar belakang lingkaran
                shape: BoxShape.circle, // Bentuk lingkaran
              ),
              child: IconButton(
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

          Positioned(
            top: 410,
            left:
                0, // Pastikan left diatur ke 0 agar posisi horizontal tetap di tengah
            right:
                0, // Pastikan right diatur ke 0 agar posisi horizontal tetap di tengah
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                          Icons.wifi,
                          color: Color(0xff101010),
                        ),
                        SizedBox(
                          width: 5,
                        ), // Menggunakan SizedBox untuk memberi jarak
                        Text(
                          "Free Wifi",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff101010), // Tambahkan warna teks
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 110,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xffEDEEEF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bathroom_rounded,
                          color: Color(0xff101010),
                        ),
                        SizedBox(
                          width: 5,
                        ), // Menggunakan SizedBox untuk memberi jarak
                        Text(
                          "Public Toilet",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff101010), // Tambahkan warna teks
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
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
                          Icons.ac_unit,
                          color: Color(0xff101010),
                        ),
                        SizedBox(
                          width: 5,
                        ), // Menggunakan SizedBox untuk memberi jarak
                        Text(
                          "AC",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff101010), // Tambahkan warna teks
                          ),
                        ),
                      ],
                    ),
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
