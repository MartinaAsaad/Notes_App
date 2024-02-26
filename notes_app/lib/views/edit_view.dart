import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/note_cubit/note_cubit.dart';
import 'package:notes_app/helpers/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/customAppbar.dart';
import 'package:notes_app/widgets/custombottomsheet.dart';
import 'package:notes_app/widgets/drobdown.dart';

class editPage extends StatefulWidget {
  editPage({super.key, required this.note});
 final Note note;
  @override
  State<editPage> createState() => _editPageState();
}

class _editPageState extends State<editPage> {
  GlobalKey<FormState> formkey = GlobalKey();

  String? title;

  String? content;

 LinearGradient? color = bluegradient;
  String? category = 'study';

  Icon? icon1 = Icon(Icons.check);
  Icon? icon2 = null;
  Icon? icon3 = null;

  _editPageState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomAppBar(title: 'Edit Note', action: Icons.check,iconcolor: Colors.green,ontap: () {
                   widget.note.category=category!;
                   widget.note.content=content==null||content==''? widget.note.content:content!;
                   widget.note.title=title==null||title==''? widget.note.title:title!;
                   widget.note.color='$color';
                   BlocProvider.of<NoteCubit>(context).FetchAll();
                   Navigator.of(context).pop();
                  },),
                  customTextField(
                    hint: widget.note.title,onsaved: (p0) {
                      title=p0;
                    },
                  ),
                  customTextField(hint: widget.note.content, maxlines: 5,onsaved: (p0) {
                     content=p0;
                  },),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Color :',
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                  onTap: () {
                    color = bluegradient;
                    icon1=Icon(Icons.check);
                    icon2=null;
                    icon3=null;
                    setState(() {
                      
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          gradient: bluegradient,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(70, 0, 0, 0),
                                offset: Offset(0, 3),
                                blurRadius: 3)
                          ]),
                      child: icon1,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    color = redgradient;
                    icon2=Icon(Icons.check);
                    icon1=null;
                    icon3=null;
                    setState(() {
                      
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          gradient: redgradient,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(70, 0, 0, 0),
                                offset: Offset(0, 3),
                                blurRadius: 3)
                          ]),
                      child: icon2,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    color = purplegradient;
                    icon3=Icon(Icons.check);
                    icon1=null;
                    icon2=null;
                    setState(() {
                      
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          gradient: purplegradient,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(70, 0, 0, 0),
                                offset: Offset(0, 3),
                                blurRadius: 3)
                          ]),
                      child: icon3,
                    ),
                  ),
                ),
                      SizedBox(
                        width: 80,
                      ),
                      Container(
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
                          hint: Text('Category'),
                          onChanged: (p0) {
                            setState(() {
                              category=p0;
                              widget.note.category=p0!;
                              customdrobdownbutton.value = p0.toString();
                            });
                          },
                          value: widget.note.category,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
