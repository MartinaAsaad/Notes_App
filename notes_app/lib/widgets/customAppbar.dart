import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar
({super.key, required this.title, required this.action, required this.iconcolor, this.ontap});
final String title;
final IconData action;
final Color iconcolor;
final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0,bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      
          Text(title,style: TextStyle(color: Colors.grey[600],fontSize: 32,fontWeight: FontWeight.bold),),
          customSearchicon(action: action,iconcolor:iconcolor,ontap: ontap,)
        ],
      ),
    );
  }
}

class customSearchicon extends StatelessWidget {
  const customSearchicon({
    super.key, required this.action, required this.iconcolor, this.ontap,
  });
  final Color iconcolor;
final IconData action;
final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color:  Colors.grey[850],
           borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Color.fromARGB(50, 0, 0, 0),offset: Offset(0, 3),blurRadius: 3)
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(action,size: 36,color:iconcolor ,),
        )),
    );
  }
}