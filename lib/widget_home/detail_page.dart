import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
            left: 20,
            top: 7,
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios))
              ],
            )),
            Positioned(
            left: 20,
            top: 7,
            child: Container(
            width: double.maxFinite,
            height: 300,
            
            ))
          ],
        ),
      ),
    );
  }
}