import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_bl/api/meja.dart'; // Import model Meja
import 'package:mobile_bl/api/jam_sewa.dart'; // Import model JamSewa
import 'package:mobile_bl/api/api_service.dart'; // Import ApiService

class DialogMeja extends StatefulWidget {
  final Meja meja;

  const DialogMeja({Key? key, required this.meja}) : super(key: key);

  @override
  State<DialogMeja> createState() => _DialogMejaState();
}

class _DialogMejaState extends State<DialogMeja> {
  TextEditingController _dateController = TextEditingController();
  late DateTime _selectedDate;
  late List<JamSewa> _bookedTimes;

@override
void initState() {
  super.initState();
  _selectedDate = DateTime.now();
  _bookedTimes = [];
  _fetchBookedTimes();
}

void _fetchBookedTimes() async {
  try {
    String formattedDate = _selectedDate.toIso8601String().substring(0, 10);

    _bookedTimes = await ApiService().fetchJamSewa(
      widget.meja.idmeja,
      formattedDate,
    );

    // Tambahkan log untuk mencetak waktu yang telah di-fetch
    _bookedTimes.forEach((jamSewa) {
      print('Fetched booked time: ${jamSewa.jam} , ${jamSewa.tanggal}');
    });

    // Perbarui UI setelah pembaruan data
    setState(() {
      // Panggil _showDialog() di sini untuk memastikan bahwa pembaruan data selesai sebelum tampilan dialog ditampilkan
      _showDialog();
    });
  } catch (e) {
    print('Error fetching booked times: $e');
  }
}

  Future<void> _showDialog() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 10,
                    offset: Offset(0, -4),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        icon: Icon(Icons.close),
                      ),
                      SizedBox(width: 20), // Added some spacing
                    ],
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Detail",
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFBBC05),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 240,
                          height: 240,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image:
                                  AssetImage("lib/image/" + widget.meja.foto),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      widget.meja.nm, // Menggunakan nama dari objek Meja
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFBBC05),
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.meja.ket.isNotEmpty
                                ? widget.meja.ket
                                : "Lorem ipsum dolor sit amet.",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.meja.harga,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffFBBC05),
                              ),
                            ),
                            Text(
                              "/Hour",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Wrap(
                      spacing: 10, // Jarak antara tombol waktu
                      runSpacing: 8, // Jarak antara baris
                      children: [
                        buildTimeButton("12:00"),
                        buildTimeButton("13:00"),
                        // Tambahkan tombol waktu lainnya sesuai kebutuhan
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        labelText: 'DATE',
                        filled: true,
                        prefixIcon: Icon(Icons.calendar_today),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFBBC05)),
                        ),
                      ),
                      readOnly: true,
                      onTap: () {
                        _selectDate();
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika backend di sini
                      },
                      child: Text(
                        "Booking Now",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffffffffff),
                          fontSize: 15,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFBBC05),
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Added space at the bottom
                ],
              ),
            ),
          ),
        );
      },
    ).then((value) {
      // Call dispose when the dialog is dismissed
      if (mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        // Format tanggal sesuai dengan format ymd
        _dateController.text =
            "${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}";
      });

      _fetchBookedTimes(); // Panggil ulang untuk mengambil jam sewa baru berdasarkan tanggal yang dipilih
    }
  }

Widget buildTimeButton(String time) {
  // Periksa apakah waktu telah dipesan
  bool isBookedOnSelectedDate = _bookedTimes.any((jamSewa) => jamSewa.jam == time);
  print(
      'Time: $time, isBookedOnSelectedDate: $isBookedOnSelectedDate'); // Tambahkan console log di sini

  return Container(
    width: 85,
    height: 40,
    child: ElevatedButton(
      onPressed: isBookedOnSelectedDate
          ? null
          : () {
              // Tambahkan logika backend di sini
            },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isBookedOnSelectedDate ? Colors.grey : Color(0xffFBBC05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        time,
        style: TextStyle(
            color: isBookedOnSelectedDate ? Colors.black : Colors.white),
      ),
    ),
  );
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
    );
  }
}
