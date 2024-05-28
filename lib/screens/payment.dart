import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../models/cart_item.dart';
import 'dart:io';

class PaymentPage extends StatefulWidget {
  final List<CartItem> items;

  const PaymentPage({Key? key, required this.items}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  File? _image;
  String? _selectedPaymentMethod;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Menghitung total harga dari item
    final double totalPrice = widget.items.fold(0, (sum, item) => sum + item.price);

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
                  return _buildItem(context, cartItem.name, cartItem.price as double);
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
              'Payment Method',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            DropdownButtonFormField<String>(
              items: [
                DropdownMenuItem(value: 'BCA', child: Text('BCA')),
                DropdownMenuItem(value: 'BRI', child: Text('BRI')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              hint: Text('Choose Your Payment'),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: _pickImage,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.upload_file, color: Colors.orange),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _image == null ? 'Choose File' : 'File Selected',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_image != null) ...[
              SizedBox(height: 8),
              Image.file(
                _image!,
                height: 150,
              ),
            ],
            SizedBox(height: 16),
            Spacer(),
            Text(
              'Total (${widget.items.length} items) :',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              'Rp ${totalPrice.toStringAsFixed(0)}',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Pay',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, String title, double price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://via.placeholder.com/50',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14,
              ),
            ),
          ),
          Text(
            'Rp ${price.toStringAsFixed(0)}',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
