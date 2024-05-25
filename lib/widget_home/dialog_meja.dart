import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogMeja extends StatefulWidget {
  const DialogMeja({Key? key}) : super(key: key);

  @override
  State<DialogMeja> createState() => _DialogMejaState();
}

class _DialogMejaState extends State<DialogMeja> {
  TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _showDialog();
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevent dismiss by tapping outside of the dialog
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Stack(
              children: [
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: 45),
                  width: 400,
                  height: 900,
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
                      SizedBox(
                        height: 335,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Mini Tables Billiard",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFBBC05)),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Lorem ipsum dolor sit amet.",
                                style: GoogleFonts.inter(
                                    fontSize: 12, color: Color(0xff000000)),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "12.000",
                                  style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFBBC05)),
                                ),
                                Text(
                                  "/Hour",
                                  style: GoogleFonts.inter(
                                      fontSize: 12, color: Color(0xff000000)),
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
                            buildTimeButton("00:00"),
                            buildTimeButton("01:00"),
                            buildTimeButton("02:00"),
                            buildTimeButton("03:00"),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(20),
                      child: TextField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          labelText: 'DATE',
                          filled: true,
                          prefixIcon: Icon(Icons.calendar_today),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFBBC05))
                          )
                        ),
                        readOnly: true,
                        onTap: (){
                          _selectDate();
                        },
                      ),
                      ),
                      Container(
                        child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => NavigationMenu()),
                        // );
                      },
                      child: Text(
                        "Log In",
                        style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Color(0xffFBBC05), fontSize: 15),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff000000)),
                    )
                      )
                    ],
                  ),
                ),
                
                Positioned(
                  top: 40, // Adjusted top value
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Center vertically
                    children: [
                      Text(
                        "Detail",
                        style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFBBC05)),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 240,
                      height: 240,
                      decoration: BoxDecoration(
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: AssetImage("lib/data/page.png"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    icon: Icon(Icons.close),
                  ),
                ),
              ],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.transparent, // Optional: Make background transparent
    );
  }

  Future<void> _selectDate() async{
 DateTime? _picked = await showDatePicker(context: context,initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(21000));

if (_picked != null){
  setState((){
    _dateController.text = _picked.toString().split(" ")[0];
  });
}
}


}

Widget buildTimeButton(String time) {
  return Container(
    width: 85,
    height: 40,
    child: ElevatedButton(
      onPressed: () {
        // Tambahkan logika backend di sini
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xffFBBC05), // Warna latar belakang tombol
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Bentuk tombol
        ),
      ),
      child: Text(
        time,
        style: TextStyle(color: Colors.white), // Warna teks
      ),
    ),
  );
}

