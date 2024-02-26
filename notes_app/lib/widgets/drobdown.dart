import 'package:flutter/material.dart';

class customdrobdownbutton extends StatefulWidget {
   customdrobdownbutton({
    super.key, this.onchanged,
  });
 final void Function(String?)? onchanged;
  static String value='study';
  @override
  State<customdrobdownbutton> createState() => _customdrobdownbuttonState(onchanged,value);
}

class _customdrobdownbuttonState extends State<customdrobdownbutton> {
  static String hinttext = 'study';
 final void Function(String?)? onchanged;
 String value=customdrobdownbutton.value;
  _customdrobdownbuttonState(this.onchanged, this.value);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(50, 0, 0, 0),
                offset: Offset(0, 3),
                blurRadius: 3)
          ]),
      child: DropdownButton(
         // hint: Text(hinttext),
          icon: Icon(Icons.arrow_drop_down),
          borderRadius: BorderRadius.circular(16),
          underline: Container(),
          items: [
            DropdownMenuItem(
              child: Text('Study'),
              value: 'study',
            ),
            DropdownMenuItem(
              child: Text('Health'),
              value: 'health',
            ),
            DropdownMenuItem(
              child: Text('Ideas'),
              value: 'ideas',
            ),
            DropdownMenuItem(
              child: Text('Personal'),
              value: 'personal',
            )
          ],
          onChanged: onchanged,
          value: value,
          ),
    );
  }
}
