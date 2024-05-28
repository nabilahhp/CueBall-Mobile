import 'package:flutter/material.dart';
import '../constans.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/data/latar.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50),
                        Center(
                          child: Text(
                            'Edit Profile',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFieldWithLabel(
                          label: 'Name',
                          hintText: 'Your Name',
                        ),
                        SizedBox(height: 20),
                        TextFieldWithLabel(
                          label: 'Email',
                          hintText: 'Your Email',
                        ),
                        SizedBox(height: 20),
                        TextFieldWithLabel(
                          label: 'Gender',
                          hintText: 'Choose Your Gender',
                          isDropdown: true,
                          dropdownItems: ['Male', 'Female'],
                        ),
                        SizedBox(height: 20),
                        TextFieldWithLabel(
                          label: 'Phone Number',
                          hintText: 'Your Phone Number',
                        ),
                        SizedBox(height: 20),
                        TextFieldWithLabel(
                          label: 'Address',
                          hintText: 'Your Address',
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle Save button press
                                  },
                                  child: Text(
                                    "Save",
                                    style: Interrrstyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: buttonColorBlack,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Navigate back to ProfileScreen
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: Interrrstyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: buttonColorBlack,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldWithLabel extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isDropdown;
  final List<String>? dropdownItems;

  const TextFieldWithLabel({
    Key? key,
    required this.label,
    required this.hintText,
    this.isDropdown = false,
    this.dropdownItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: whiteColor,
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: whiteColor,
          ),
          child: isDropdown
              ? DropdownButtonFormField<String>(
                  onChanged: (String? newValue) {},
                  items: dropdownItems!
                      .map<DropdownMenuItem<String>>(
                        (value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                  ),
                )
              : TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                  ),
                ),
        ),
      ],
    );
  }
}
