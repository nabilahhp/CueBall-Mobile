import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_bl/api/meja.dart'; // Import model Meja
import 'package:mobile_bl/api/jam_sewa.dart'; // Import model JamSewa
import 'package:mobile_bl/api/api_service.dart'; // Import API service
import 'package:mobile_bl/api/api_servicemeja.dart';
import 'package:mobile_bl/widget_home/navigationbar.dart'; // Import API service

class DialogMeja1 extends StatefulWidget {
  final String idUser;
  final Meja meja;

  const DialogMeja1({Key? key, required this.meja, required this.idUser})
      : super(key: key);

  @override
  State<DialogMeja1> createState() => _DialogMejaState();
}

class _DialogMejaState extends State<DialogMeja1> {
  TextEditingController _dateController = TextEditingController();
  late DateTime _selectedDate;
  late List<JamSewa> _bookedTimes;
  late Map<String, Color> _timeButtonColors;
  List<String> _selectedTimes = [];
  bool _isDateSelected = false;
  int _totalBooked = 0;

  void _bookMeja() async {
    try {
      await ApiServicemeja().bookMeja(
        widget.meja.idmeja,
        widget.idUser,
        _selectedTimes,
        _selectedDate,
        'belum dibayar',
        widget.meja.harga,
        _totalBooked.toString(),
        'Belum Bayar'

      );
      // Pemanggilan metode untuk mengarahkan ke halaman aktivitas
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
                NavigationMenu(selectedIndex: 1, idUser: widget.idUser,)),
      );
      // Tampilkan pesan sukses atau lakukan tindakan lain setelah booking berhasil
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Booking successful')),
      );
    } catch (e) {
      print('Error booking meja: $e');
      // Tampilkan pesan error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Booking failed')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _bookedTimes = [];
    _selectedTimes = [];
    _timeButtonColors = {}; // Initialize _timeButtonColors
    _fetchBookedTimes();
    print(widget.idUser);
    _totalBooked.toString();
  }

  void _fetchBookedTimes() async {
    try {
      String formattedDate = _selectedDate.toIso8601String().substring(0, 10);
      _bookedTimes = await ApiService().fetchJamSewa(
        widget.meja.idmeja,
        formattedDate,
      );

      _bookedTimes.forEach((jamSewa) {
        print('Fetched booked time: ${jamSewa.jam} , ${jamSewa.tanggal}');
      });

      setState(() {
        _isDateSelected = true;
      });
    } catch (e) {
      print('Error fetching booked times: $e');
    }
  }

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
            top: 200,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 210),
                      Text(
                        widget.meja.nm,
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
                            widget.meja.ket.isNotEmpty
                                ? widget.meja.ket
                                : "Lorem ipsum dolor sit amet.",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Color(0xff000000),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.meja.harga,
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 8,
                          children: [
                            buildTimeButton("12:00"),
                            buildTimeButton("13:00"),
                            buildTimeButton("14:00"),
                            buildTimeButton("15:00"),
                            buildTimeButton("16:00"),
                            buildTimeButton("17:00"),
                            buildTimeButton("18:00"),
                            buildTimeButton("19:00"),
                            buildTimeButton("20:00"),
                            buildTimeButton("21:00"),
                            buildTimeButton("22:00"),
                            buildTimeButton("23:00"),
                            buildTimeButton("24:00"),
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
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          onPressed:
                              _isDateSelected && _selectedTimes.isNotEmpty
                                  ? () {
                                    _bookMeja();
                                  }
                                  : null,
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
                      SizedBox(height: 30),
                    ],
                  ),
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
                    image: AssetImage("lib/image/${widget.meja.foto}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTimeButton(String time) {
    // Periksa apakah tanggal telah dipilih
    bool isDateSelected = _dateController.text.isNotEmpty;

    // Tentukan warna tombol berdasarkan status pemilihan waktu dan status pemesanan
    Color buttonColor;
    bool isBookedOnSelectedDate =
        isDateSelected && _bookedTimes.any((jamSewa) => jamSewa.jam == time);
    bool isSelected = _selectedTimes.contains(time);

    if (!isDateSelected) {
      buttonColor =
          Colors.grey; // Nonaktifkan tombol jika tanggal belum dipilih
    } else if (isBookedOnSelectedDate) {
      buttonColor = Colors.grey; // Tombol berwarna abu-abu jika sudah dipesan
    } else {
      buttonColor = isSelected
          ? Colors.black
          : Color(0xffFBBC05); // Biru jika dipilih, kuning jika tidak
    }

    return Container(
      width: 85,
      height: 40,
      child: ElevatedButton(
        onPressed: isDateSelected && !isBookedOnSelectedDate
            ? () {
                _toggleTimeSelection(time);
              }
            : null, // Nonaktifkan tombol jika tanggal belum dipilih atau sudah dipesan
        style: ElevatedButton.styleFrom(
          backgroundColor:
              buttonColor, // Gunakan warna tombol yang telah ditentukan
        ),
        child: Text(
          time,
          style: TextStyle(
            color: Colors.white, // Warna teks selalu putih
          ),
        ),
      ),
    );
  }

  void _toggleTimeSelection(String time) {
  setState(() {
    // Check if time has been previously selected
    bool wasSelected = _selectedTimes.contains(time);
    int harga = double.parse(widget.meja.harga).toInt();

    // If previously selected, remove from list and subtract the cost
    if (wasSelected) {
      _selectedTimes.remove(time);
      _totalBooked -= harga; // Operasi pengurangan
      print('Time $time deselected. Total cost reduced by $harga');
    } else {
      // If not previously selected, add to list and add the cost
      _selectedTimes.add(time);
      _totalBooked += harga; // Operasi penjumlahan
      print('Time $time selected. Total cost increased by $harga');
    }

    // Update button color based on time selection status
    bool isBookedOnSelectedDate =
        _isDateSelected && _bookedTimes.any((jamSewa) => jamSewa.jam == time && jamSewa.status == "sudah dibayar");
    bool isSelected = _selectedTimes.contains(time);
    Color buttonColor;
    if (!_isDateSelected) {
      buttonColor = Colors.grey;
    } else if (isBookedOnSelectedDate) {
      buttonColor = Colors.grey;
    } else {
      buttonColor = isSelected ? Colors.blue : Color(0xffFBBC05);
    }

    // Save button color in a map or list
    _timeButtonColors[time] = buttonColor;

    print('Selected times: $_selectedTimes');
    print('Time $time isSelected: $isSelected');
    print('Total booked: $_totalBooked');
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
        _dateController.text =
            "${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}";
        _isDateSelected = true; // Tandai tanggal sebagai sudah dipilih
      });

      _fetchBookedTimes(); // Panggil _fetchBookedTimes() setelah memilih tanggal
    }
  }
}

class FeatureWidget extends StatefulWidget {
  final IconData icon;
  final String label;

  FeatureWidget({required this.icon, required this.label});

  @override
  _FeatureWidgetState createState() => _FeatureWidgetState();
}

class _FeatureWidgetState extends State<FeatureWidget> {
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
            widget.icon,
            color: Color(0xff101010),
          ),
          SizedBox(width: 5),
          Text(
            widget.label,
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
