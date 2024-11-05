import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: 140,
              child: Image.network(
                "https://v2.exercisedb.io/image/EsOqQ8Z50wRW7L",
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error); // Handle image loading error
                },
              ),
            ),
            SizedBox(height: 8),
            Text(
              'BACK',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
