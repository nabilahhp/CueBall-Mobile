import 'package:flutter/material.dart';
import 'package:mobile_bl/constans.dart';
import 'package:mobile_bl/widget_home/app_icon.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 280,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("lib/data/miegoreng.png"))),
              )),
              Positioned(
                top: 4,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppIcon(icon: Icons.arrow_back_ios)
                  ],
              ))
        ],
      ),
    );
  }
}
