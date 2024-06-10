import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile_bl/widget_home/navigationbar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class CartItem {
  final String name;
  final String idsewa;
  final int price;
  final int quantity;
  final String image;
  final String description;

  CartItem(
      {required this.name,
      required this.idsewa,
      required this.price,
      required this.quantity,
      required this.image,
      required this.description});
}
  

class PaymentTablePage extends StatefulWidget {
  final List<CartItem> items;
  final String idUser;

  const PaymentTablePage({Key? key, required this.items, required this.idUser}) : super(key: key);

  @override
  _PaymentTablePageState createState() => _PaymentTablePageState();
}


class _PaymentTablePageState extends State<PaymentTablePage> {

  

  File? _image;
  String? _selectedPaymentMethod;
  String? _imageUrl;
  bool _isLoading = false; // Definisikan _isLoading di sini
  String? _errorMessage;

  void sendImageToServer(File imageFile) async {
    try {
      List<int> imageBytes = imageFile.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);

      // Data yang akan dikirim ke server
      Map<String, dynamic> imageData = {
        'image': base64Image,
        'filename': imageFile.path.split('/').last,
      };

      // Endpoint API
      String apiUrl = 'http://cuebilliard.my.id/projek_api/images/';

      // Kirim permintaan POST
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(imageData),
      );

      // Tanggapi hasil
      print("Request: POST $apiUrl");
      print("Request Body: $imageData");
      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        print("Gambar berhasil dikirim!");
      } else {
        print("Gagal mengirim gambar: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void sendPaymentDataToAPI(String idsewa, File bukti, DateTime tanggal ) async {
    setState(() {
      _isLoading = true;
    });

    // Ambil nama file asli
    String namaFile = bukti.path.split('/').last;

    Map<String, dynamic> paymentData = {
      'idsewa': idsewa,
      'bukti': namaFile,
      'tanggal': tanggal.toIso8601String(),
      'status': 'Sudah Bayar',
    };

    String apiUrl = 'http://cuebilliard.my.id/projek_api/post_bayar.php';

    try {
      http.Response response = await http.post(
        Uri.parse(apiUrl),
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
          var pic = await http.MultipartFile.fromPath(
              "image", _image!.path); // Tambahkan tanda seru (!) di sini
          request.files.add(pic);

          var response = await request.send();

          if (response.statusCode == 200) {
            print('Image uploaded successfully');
            // Menerima respons dari server
            var responseData = await response.stream.bytesToString();
            print('Server response: $responseData');
            // Jika perlu, lakukan penanganan respons dari server di sini
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

  @override
  Widget build(BuildContext context) {
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
                  return _buildItem(context, cartItem);
                },
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Notes',
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
            Text(
              'Payment Method',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            DropdownButtonFormField<String>(
              items: [
                DropdownMenuItem(
                  value: 'BCA',
                  child: Text('BCA'),
                ),
                DropdownMenuItem(
                  value: 'BRI',
                  child: Text('BRI'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.orange),
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
                      sendImageToServer(_image!);
                      // Cetak idsewa dari item pertama untuk testing
                      String idsewa = widget.items[0].idsewa;
                      print('ID Sewa: $idsewa');
                      DateTime tanggal = DateTime.now();
                      sendPaymentDataToAPI(idsewa, _image!, tanggal);

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
                        desc: "Payment successful! Back to login.",
                        btnOkOnPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NavigationMenu(
                                    selectedIndex: 1, idUser: widget.idUser)),
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

  Widget _buildItem(BuildContext context, CartItem cartItem) {
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
            child: Image.network(cartItem.image),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartItem.name,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Rp ${cartItem.price}',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                cartItem.description,
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
