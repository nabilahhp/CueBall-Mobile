// food.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_bl/api/makanan.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../provider/cart_provider.dart';
import '../models/cart_item.dart';

class food extends StatefulWidget {
  const food({Key? key}) : super(key: key);

  @override
  State<food> createState() => _FoodState();
}

class _FoodState extends State<food> {
  late Future<List<Makanan>> futureMakanan;

  Future<List<Makanan>> fetchMakanan() async {
    var response = await http.get(Uri.parse('http://cuebilliard.my.id/projek_api/get_makanan.php'));

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
    final cartProvider = Provider.of<CartProvider>(context);

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
                              height: 100,
                              width: 110,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Rp ${makanan.harga}",
                                        style: GoogleFonts.poppins(
                                          color: Colors.red,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          final cartItem = CartItem(
                                            id: makanan.idmakanan,
                                            name: makanan.nm,
                                            description: makanan.deskripsi,
                                            price: makanan.harga,
                                            image: 'lib/image/' + makanan.foto,
                                          );
                                          cartProvider.addToCart(cartItem);

                                          // Tampilkan SnackBar setelah item ditambahkan ke keranjang
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Berhasil ditambahkan ke keranjang!'),
                                              duration: Duration(seconds: 2),
                                            ),
                                          );
                                        },
                                        icon: Icon(Icons.shopping_cart),
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
