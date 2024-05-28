import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mobile_bl/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart' as path;
import 'constans.dart';
import 'password/pass.dart';

class Profiladd extends StatefulWidget {
  final String phoneNumber;
  final String name;
  final String email;
  final String selectedGender;
  final String address;
  final File? imageFile; // Tambahkan parameter imageFile
  final Uint8List? webImage; // Tambahkan parameter webImage

  const Profiladd({
    Key? key,
    required this.phoneNumber,
    required this.name,
    required this.email,
    required this.selectedGender,
    required this.address,
    this.imageFile, // Tambahkan parameter imageFile
    this.webImage, // Tambahkan parameter webImage
  }) : super(key: key);

  @override
  _ProfiladdState createState() => _ProfiladdState();
}

class _ProfiladdState extends State<Profiladd> {
  File? _image;
  Uint8List? _webImage;

  Future<void> _uploadImage(BuildContext context) async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      if (kIsWeb) {
        setState(() {
          _webImage = result.files.first.bytes;
        });
      } else {
        File file = File(result.files.single.path!);
        final directory = await getApplicationDocumentsDirectory();
        final String newPath = path.join(directory.path, 'profile_image.png');

        await file.copy(newPath);

        setState(() {
          _image = File(newPath);
        });

        print('Image saved at $newPath');
      }
    } else {
      print('User canceled the picker.');
    }
  } catch (e) {
    print('Error picking image: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    print('Phone Number: ${widget.phoneNumber}');
    print('Name: ${widget.name}');
    print('Email: ${widget.email}');
    print('Selected Gender: ${widget.selectedGender}');
    print('Address: ${widget.address}');
    print('Image File: ${widget.imageFile}');
    print('Web Image: ${widget.webImage}');

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/data/latar.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        'Profile Picture',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 35,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 11),
                  Text(
                    "Set Your Profile Picture! Adding photo to make your profile stunning.",
                    style: Interstyle.copyWith(fontSize: 15),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: _image == null
                                ? _webImage == null
                                    ? Image.asset(tprofileimage)
                                    : Image.memory(_webImage!, fit: BoxFit.cover)
                                : Image.file(_image!, fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () => _uploadImage(context),
                      child: Text(
                        "Add Photo",
                        style: Interstyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreatePass(
                              phoneNumber: widget.phoneNumber,
                              address: widget.address,
                              name: widget.name,
                              email: widget.email,
                              selectedGender: widget.selectedGender,
                              imageFile: widget.imageFile,
                              webImage: widget.webImage,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Next",
                        style: Interrrstyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(backgroundColor: buttonColorWhite),
                    ),
                  ),
                  SizedBox(height: 45),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7.0),
                        child: Text(
                          "Or with",
                          style: TextStyle(color: Color(0xfffffffff), fontSize: 13),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: Interstyle.copyWith(fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          "Log In",
                          style: Interrrstyle.copyWith(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
