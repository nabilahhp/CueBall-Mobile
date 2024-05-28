import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  int _selectedTab = 0;

  List<Map<String, dynamic>> allActivities = [
    {
      'title': 'French Fries',
      'description': 'Lorem ipsum dolor sit amet.',
      'imagePath': 'lib/image/french_fries.png',
      'price': '00,0K',
      'status': 'Belum Bayar',
    },
    {
      'title': 'Ice Tea',
      'description': 'Lorem ipsum dolor sit amet.',
      'imagePath': 'assets/images/ice_tea.png',
      'price': '00,0K',
      'status': 'Belum Bayar',
    },
    {
      'title': 'Mini Tables Billiard',
      'description': 'Lorem ipsum dolor sit amet.',
      'imagePath': 'assets/images/billiard.jpeg',
      'price': '00,0K',
      'status': 'Sudah Bayar',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    List<Map<String, dynamic>> displayedActivities = _selectedTab == 0
        ? allActivities
        : allActivities.where((activity) => activity['status'] == (_selectedTab == 1 ? 'Belum Bayar' : 'Sudah Bayar')).toList();

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
                  fontSize: screenWidth * 0.05, // Responsive font size
                ),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tincidunt.',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: screenWidth * 0.03, // Responsive font size
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
            padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: screenWidth * 0.02), // Responsive spacing
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
                        label: Text('Belum Bayar'),
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
                SizedBox(height: screenWidth * 0.02), // Responsive spacing
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

  Widget _buildActivityCard(BuildContext context, String title, String description, String imagePath, String price, String status) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(title),
        subtitle: Text(description),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(price, style: GoogleFonts.poppins(color: Colors.orange, fontWeight: FontWeight.bold)),
            if (status == 'Belum Bayar')
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentPage()),
                  );
                },
                child: Text(
                  'Belum Bayar',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Center(
        child: Text('This is the payment page!'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ActivityPage(),
  ));
}
