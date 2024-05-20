import 'package:flutter/material.dart';
import 'package:clippy_flutter/clippy_flutter.dart';

class ItemPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.only(top: 5),
      child: ListView(
        children: [
          Padding(padding: EdgeInsets.all(16),
          child: Image.asset(
            "lib/data/miegoreng.png",
            height: 300,
            // width: double.infinity,
            // width: 100,
          ),
          ),
          Arc(
            edge: Edge.TOP,
            arcType: ArcType.CONVEY,
            height: 30,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              // child: Padding(padding: padding),
            ),
          )
        ],
      ),
      ),
    );
  }
}