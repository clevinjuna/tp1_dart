import 'package:flutter/material.dart';
import 'bachelor.dart';

class BachelorDetails extends StatefulWidget {
  final Bachelor bachelor;
  final Function(Bachelor) onLikeChanged;

  BachelorDetails({required this.bachelor, required this.onLikeChanged});

  @override
  _BachelorDetailsState createState() => _BachelorDetailsState();
}

class _BachelorDetailsState extends State<BachelorDetails> {
  void toggleLike() {
    setState(() {
      widget.bachelor.isLiked = !widget.bachelor.isLiked;
      widget.onLikeChanged(widget.bachelor);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Vous avez liké ${widget.bachelor.firstname} ${widget.bachelor.lastname}'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du Bachelor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(widget.bachelor.avatar),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: IconButton(
                    onPressed: toggleLike,
                    icon: Icon(
                      widget.bachelor.isLiked ? Icons.favorite : Icons.favorite_border,
                      color: widget.bachelor.isLiked ? Colors.red : null,
                      size: 32,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              '${widget.bachelor.firstname} ${widget.bachelor.lastname}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Job: ${widget.bachelor.job}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Description: ${widget.bachelor.description}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleLike,
        child: Icon(Icons.favorite),
      ),
    );
  }
}