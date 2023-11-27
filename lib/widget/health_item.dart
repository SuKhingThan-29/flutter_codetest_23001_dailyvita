import 'package:flutter/material.dart';

class HealthItem extends StatelessWidget {
  const HealthItem({
    required this.id,
    required this.name,
    Key? key, required this.onTap,
    required this.isClick
  }) : super(key: key);
  final int id;
  final String name;
  final VoidCallback onTap;
  final bool isClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,
    child: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: isClick?Colors.black26:null,
              border: Border.all(
                width: 2.0,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ]),);


  }
}