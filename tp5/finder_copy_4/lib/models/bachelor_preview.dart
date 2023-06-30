import 'package:flutter/material.dart';

import 'bachelor.dart';

class BachelorPreview extends StatelessWidget {
  final Bachelor bachelor;
  final VoidCallback onTap;

  BachelorPreview({required this.bachelor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: bachelor.isLiked ? Colors.yellow : null, 
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(bachelor.avatar),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${bachelor.firstname} ${bachelor.lastname}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'Job: ${bachelor.job}',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}