import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_bl/widget_home/detail_page.dart';
import 'package:mobile_bl/api/meja.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';

class CategoriesWidget extends StatefulWidget {
  final String idUser;
  const CategoriesWidget({Key? key, required this.idUser}) : super(key: key);

  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  late Future<List<Meja>> futureMeja;

  Future<List<Meja>> fetchMeja() async {
    print('Fetching data from server...');

    var response = await http.get(Uri.parse('http://cuebilliard.my.id/projek_api/get_meja.php'));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print('JSON Response: $jsonResponse');

      List<Meja> mejaList =
          jsonResponse.map((data) => Meja.fromJson(data)).toList();
      print('Parsed Meja List: $mejaList');

      return mejaList;
    } else {
      print('Failed to load data');
      throw Exception('Failed to load meja');
    }
  }

  @override
  void initState() {
    super.initState();
    futureMeja = fetchMeja();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Meja>>(
      future: futureMeja,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data found'));
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
              child: Row(
                children: snapshot.data!.map((meja) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    child: InkWell(
                      onTap: () {
                        // Navigate to DetailPage and pass the selected Meja object
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(meja: meja, idUser: widget.idUser),
                          ),
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
                            Container(
                              height: 110,
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
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "http://cuebilliard.my.id/projek_api/image/${meja.foto}",
                                  width: 170,
                                  height: 110,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Expanded(
                              child: Container(
                                height: 89,
                                padding: EdgeInsets.symmetric(horizontal: 10),
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
                                      meja.nm,
                                      style: GoogleFonts.inter(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      meja.ket.isNotEmpty
                                          ? meja.ket
                                          : "Deskripsi Kosong",
                                      style: GoogleFonts.inter(
                                        fontSize: 9,
                                        color: Color(0xff121212),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          meja.harga,
                                          style: GoogleFonts.poppins(
                                            color: Colors.yellow,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 5),
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
