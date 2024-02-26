import 'package:flutter/material.dart';

class category_tile extends StatelessWidget {
  const category_tile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(70, 0, 0, 0),
                offset: Offset(0, 3),
                blurRadius: 3)
          ]),
      child: Center(
        child: Text(
          'All',
          style: TextStyle(
              color: Colors.grey[400],
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
