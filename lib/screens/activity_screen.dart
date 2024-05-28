import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

class ActivityPage extends StatefulWidget {
  final String idUser;

  const ActivityPage({Key? key, required this.idUser}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

Future<List<Map<String, dynamic>>> fetchActivities(String idUser) async {
  final response = await http.get(Uri.parse('http://localhost:8000/projek_api/get_activity.php?iduser=$idUser'));

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    print('Response Body: $jsonResponse'); // Tambahkan print statement untuk respons API

    // Mapping data dari API ke dalam struktur yang sesuai
    List<Map<String, dynamic>> activities = jsonResponse.map((item) {
      print('Processing item: $item'); // Tambahkan print statement untuk setiap item

      return {
        'title': item['nm'], // Sesuaikan dengan struktur data di API
        'description': 'Total: ${item['tot']}', // Deskripsi statis, bisa diganti dengan data dari API jika ada
        'imagePath': 'lib/image/${item['foto']}', // Sesuaikan dengan struktur data di API
        'price': item['harga'], // Sesuaikan dengan struktur data di API
        'status': item['status'], // Sesuaikan dengan struktur data di API
      };
    }).toList();
    print('Fetched activities: $activities'); // Tambahkan print statement untuk daftar kegiatan yang diambil
    return activities;
  } else {
    throw Exception('Failed to load activities');
  }
}


class _ActivityPageState extends State<ActivityPage> {
  int _selectedTab = 0;
  List<Map<String, dynamic>> allActivities = [];

  @override
  void initState() {
    super.initState();
    fetchActivities(widget.idUser).then((activities) {
      setState(() {
        allActivities = activities;
      });
      print(
          'Initialized allActivities: $allActivities'); // Tambahkan logging di sini
    }).catchError((error) {
      print('Error fetching activities: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    List<Map<String, dynamic>> displayedActivities = _selectedTab == 0
        ? allActivities
        : allActivities
            .where((activity) =>
                activity['status'] ==
                (_selectedTab == 1 ? 'belum dibayar' : 'Sudah Bayar'))
            .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Activity!',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.05,
                ),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tincidunt.',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: screenWidth * 0.03,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/data/latar.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: screenWidth * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ChoiceChip(
                        label: Text('All'),
                        selected: _selectedTab == 0,
                        onSelected: (bool selected) {
                          setState(() {
                            _selectedTab = 0;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ChoiceChip(
                        label: Text('belum dibayar'),
                        selected: _selectedTab == 1,
                        onSelected: (bool selected) {
                          setState(() {
                            _selectedTab = 1;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ChoiceChip(
                        label: Text('Sudah Bayar'),
                        selected: _selectedTab == 2,
                        onSelected: (bool selected) {
                          setState(() {
                            _selectedTab = 2;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenWidth * 0.02),
                Expanded(
                  child: ListView.builder(
                    itemCount: displayedActivities.length,
                    itemBuilder: (context, index) {
                      return _buildActivityCard(
                        context,
                        displayedActivities[index]['title'],
                        displayedActivities[index]['description'],
                        displayedActivities[index]['imagePath'],
                        displayedActivities[index]['price'],
                        displayedActivities[index]['status'],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityCard(BuildContext context, String title,
      String description, String imagePath, String price, String status) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading:
            Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(title),
        subtitle: Text(description),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(price,
                style: GoogleFonts.poppins(
                    color: Colors.orange, fontWeight: FontWeight.bold)),
            if (status == 'belum dibayar')
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaymentPage(
                            idUser: widget.idUser)), // Sertakan nilai idUser
                  );
                },
                child: Text(
                  'belum dibayar',
                  style: GoogleFonts.poppins(color: Colors.red),
                ),
              ),
            if (status == 'Sudah Bayar')
              Text(
                'Sudah Bayar',
                style: GoogleFonts.poppins(color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  final String idUser;

  const PaymentPage({Key? key, required this.idUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Center(
        child: Text('This is the payment page for user: $idUser'),
      ),
    );
  }
}

void onLoginSuccess(String idUser) {
  runApp(MaterialApp(
    home: ActivityPage(idUser: idUser),
  ));
}

void handleLoginSuccess(String idUser) {
  onLoginSuccess(idUser);}