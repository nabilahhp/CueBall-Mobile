import 'package:flutter/material.dart';

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
      'imagePath': 'assets/images/french_fries.png',
      'price': '00,0K',
      'buttonText': 'Cancel Order',
      'status': 'On Going',
    },
    {
      'title': 'Ice Tea',
      'description': 'Lorem ipsum dolor sit amet.',
      'imagePath': 'assets/images/ice_tea.png',
      'price': '00,0K',
      'buttonText': 'Cancel Order',
      'status': 'On Going',
    },
    {
      'title': 'Mini Tables Billiard',
      'description': 'Lorem ipsum dolor sit amet.',
      'imagePath': 'assets/images/billiard.jpeg',
      'price': '00,0K',
      'buttonText': 'Give Review',
      'status': 'Completed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    List<Map<String, dynamic>> displayedActivities = _selectedTab == 0
        ? allActivities
        : allActivities.where((activity) => activity['status'] == (_selectedTab == 1 ? 'On Going' : 'Completed')).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Activity!',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.05, // Responsive font size
              ),
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tincidunt.',
              style: TextStyle(
                color: Colors.black54,
                fontSize: screenWidth * 0.03, // Responsive font size
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/data/latar.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.filter_list),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02), // Responsive border radius
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.5), // Set the opacity here
                ),
              ),
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
                      label: Text('On Going'),
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
                      label: Text('Completed'),
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
                      displayedActivities[index]['buttonText'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityCard(BuildContext context, String title, String description, String imagePath, String price, String buttonText) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(title),
        subtitle: Text(description),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(price, style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () {},
              child: Text(buttonText, style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ActivityPage(),
  ));
}
