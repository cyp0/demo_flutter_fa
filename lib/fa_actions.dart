import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FaActions extends StatelessWidget {
  final String title;
  final String description;
  const FaActions({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff3A3C40),
                  fontWeight: FontWeight.w500)),
          Padding(
              padding: EdgeInsets.only(top: 6),
              child: Text(description,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff919090),
                      fontWeight: FontWeight.w400)))
        ],
      ),
    );
  }
}
