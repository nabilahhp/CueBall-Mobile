import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../models/cart_item.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:mobile_bl/widget_home/navigationbar.dart';

class PaymentPage extends StatefulWidget {
  final List<CartItem> items;
  final int totalItems;
  final String idUser;

  const PaymentPage(
      {Key? key,
      required this.items,
      required this.idUser,
      required this.totalItems})
      : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController hpController = TextEditingController();
  final TextEditingController ketController = TextEditingController();
  File? _image;
  String? _imageUrl;
  String? _selectedPaymentMethod;
  String? _errorMessage;
  bool _isLoading = false; 

  Future<void> _pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });

        // URL API PHP di-hosting
        var url =
            Uri.parse("http://cuebilliard.my.id/projek_api/upload_image.php");

        try {
          var request = http.MultipartRequest('POST', url);
          var pic = await http.MultipartFile.fromPath("image", _image!.path);
          request.files.add(pic);

          var response = await request.send();

          if (response.statusCode == 200) {
            print('Image uploaded successfully');
            var responseData = await response.stream.bytesToString();
            print('Server response: $responseData');
            // Menyimpan URL gambar jika ada di dalam response
            setState(() {
              _imageUrl = responseData; // Sesuaikan jika response berbeda
            });
          } else {
            print('Failed to upload image. Error: ${response.statusCode}');
          }
        } catch (e) {
          print('Error uploading image: $e');
        }
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void _submitOrder(String idUser, File bukti, DateTime tanggal) async {
    // Periksa apakah semua field telah diisi dan gambar telah di-upload
    if (namaController.text.isEmpty ||
        hpController.text.isEmpty ||
        ketController.text.isEmpty ||
        _image == null) {
      // Tampilkan pesan error menggunakan SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all fields and upload an image'),
          duration: Duration(seconds: 3), // Durasi tampilan SnackBar
        ),
      );
      return; // Berhenti eksekusi fungsi jika ada data yang kosong
    }

    // Lanjutkan dengan logika submit order jika semua data sudah terisi
    final double totalPrice =
        widget.items.fold(0, (sum, item) => sum + item.price * item.quantity);
    final String totalProductsString = widget.items
        .map((item) => '${item.name} (${item.quantity})')
        .join(', ');

    String namaFile = _image!.path.split('/').last;

    final apiUrl =
        Uri.parse('http://cuebilliard.my.id/projek_api/post_bayarmakan.php');

    Map<String, dynamic> paymentData = {
      'iduser': idUser,
      'tanggal': DateTime.now().toIso8601String(),
      'nama': namaController.text,
      'hp': hpController.text,
      'ket': ketController.text,
      'foto': namaFile,
      'total_product': totalProductsString,
      'total_price': totalPrice,
      'status': 'Menunggu',
    };

    try {
      http.Response response = await http.post(
        apiUrl,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(paymentData),
      );

      if (response.statusCode == 200) {
        print("Pembayaran berhasil!");
        print("Response: ${response.body}");
      } else {
        print("Gagal melakukan pembayaran: ${response.statusCode}");
        setState(() {
          _errorMessage = "Gagal melakukan pembayaran: ${response.statusCode}";
        });
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        _errorMessage = "Error: $e";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('ID User: ${widget.idUser}');
    final double totalPrice =
        widget.items.fold(0, (sum, item) => sum + item.price * item.quantity);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Payment',
          style: GoogleFonts.poppins(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Information',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BCA: 844707404264929',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'BRI: 849629048026',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Items',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final cartItem = widget.items[index];
                  return _buildItem(
                      context, cartItem.name, cartItem.price, cartItem.image);
                },
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: namaController,
              decoration: InputDecoration(
                hintText: 'Nama',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: hpController,
              decoration: InputDecoration(
                hintText: 'Nomor Telp',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: ketController,
              decoration: InputDecoration(
                hintText: 'Keterangan Meja',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Upload Payment Proof',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _image != null || _imageUrl != null
                    ? kIsWeb
                        ? _imageUrl != null
                            ? Image.network(_imageUrl!, fit: BoxFit.cover)
                            : Center(
                                child: Text(
                                  'Tap to upload image',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                        : _image != null
                            ? Image.file(_image!, fit: BoxFit.cover)
                            : Center(
                                child: Text(
                                  'Tap to upload image',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                    : Center(
                        child: Text(
                          'Tap to upload image',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: Rp $totalPrice',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_image != null) {
                      // Cetak idsewa dari item pertama untuk testing
                      String idUser = widget.items[0].idUser;
                      print('ID Sewa: $idUser');
                      DateTime tanggal = DateTime.now();
                      _submitOrder(idUser, _image!, tanggal);

                      // Menampilkan dialog sukses setelah pembayaran berhasil
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.topSlide,
                        showCloseIcon: true,
                        title: "Success",
                        titleTextStyle: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 25,
                        ),
                        desc: "Payment successful! Pesanan anda akan segera diproses.",
                        btnOkOnPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NavigationMenu(
                                    selectedIndex: 0, idUser: widget.idUser)),
                          );
                        },
                      )..show(); // Panggil show() untuk menampilkan dialog
                    } else {
                      // Tampilkan snackbar jika pengguna belum memilih gambar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please select an image first.'),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: Text(
                    'Pay Now',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(
      BuildContext context, String name, int price, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200],
            ),
            child: Image.asset(image),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Rp $price x (${widget.totalItems})',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
