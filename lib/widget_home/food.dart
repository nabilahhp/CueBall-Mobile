import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_bl/api/makanan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class food extends StatefulWidget {
  const food({Key? key}) : super(key: key);

  @override
  State<food> createState() => _foodState();
}

class _foodState extends State<food> {
  late Future<List<Makanan>> futureMakanan;

  Future<List<Makanan>> fetchMakanan() async {
    var response = await http
        .get(Uri.parse('http://localhost:8000/projek_api/get_makanan.php'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Makanan.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load makanan');
    }
  }

  @override
  void initState() {
    super.initState();
    futureMakanan = fetchMakanan();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Makanan>>(
      future: futureMakanan,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data found'));
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: snapshot.data!.map((makanan) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: 350,
                      height: 110,
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
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset('lib/image/'+makanan.foto, // Ganti dengan URL gambar dari API Anda
                              height: 120,
                              width: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    makanan.nm,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    makanan.deskripsi.isNotEmpty
                                        ? makanan.deskripsi
                                        : "Deskripsi tidak tersedia",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Color(0xff121212),
                                    ),
                                  ),
                                  Text(
                                    "Rp ${makanan.harga}",
                                    style: GoogleFonts.poppins(
                                      color: Colors.red,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        }
      },
    );
  }
}