import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/cubits/note_cubit/note_cubit.dart';
import 'package:notes_app/helpers/constants.dart';
import 'package:notes_app/helpers/constants.dart';

import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/drobdown.dart';

class customBottomSheet extends StatefulWidget {
  customBottomSheet({super.key});

  @override
  State<customBottomSheet> createState() => _customBottomSheetState();
}

class _customBottomSheetState extends State<customBottomSheet> {
  GlobalKey<FormState> formkey = GlobalKey();

  String? title;

  String? content;

  LinearGradient? color = bluegradient;
  String? category = 'study';
  Icon? icon1 = Icon(Icons.check);
  Icon? icon2 = null;
  Icon? icon3 = null;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSucces) {
            BlocProvider.of<NoteCubit>(context).FetchAll();
            Navigator.pop(context);
          }
          if (state is AddNoteFailure) {
            print('failed : ${state.errormsg}');
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            progressIndicator: CircularProgressIndicator(
              color: bluecolor,
            ),
            inAsyncCall: state is AddNoteLoading ? true : false,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 16.0,
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                    child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customTextField(
                        onsaved: (p0) {
                          title = p0;
                        },
                        hint: 'Title',
                      ),
                      SizedBox(height: 10,),
                      customTextField(
                        hint: 'Content',
                        maxlines: 4,
                        onsaved: (p0) {
                          content = p0;
                        },
                      ),
                         SizedBox(height: 10,),
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
                              icon1 = Icon(Icons.check);
                              icon2 = null;
                              icon3 = null;
                              setState(() {});
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
                              icon2 = Icon(Icons.check);
                              icon1 = null;
                              icon3 = null;
                              setState(() {});
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
                              icon3 = Icon(Icons.check);
                              icon1 = null;
                              icon2 = null;
                              setState(() {});
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
                          // colorTile(
                          //   firstcolor: purplegradient,
                          //   ontap: () {
                          //     color = purplegradient;
                          //   },
                          // ),
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
                              onChanged: (p0) {
                                setState(() {
                                  category = p0.toString();
                                  customdrobdownbutton.value = p0.toString();
                                });
                              },
                              hint: Text('Category'),
                              value: category,
                            ),
                          ),
                        ],
                      ),
                         SizedBox(height: 10,),
                      customButton(
                        onpressed: () {
                          if (formkey.currentState!.validate()) {
                            Note note = Note(
                                category: category!,
                                color: '$color',
                                content: content!,
                                date: '${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}',
                                title: title!);
                            BlocProvider.of<AddNoteCubit>(context).AddNote(note);
                          }
                        },
                      ),
                         SizedBox(height: 10,),
                    ],
                  ),
                )),
              ),
            ),
          );
        },
      ),
    );
  }
}

class colorTile extends StatelessWidget {
  const colorTile({
    super.key,
    required this.firstcolor,
    this.ontap,
  });

  final LinearGradient firstcolor;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              gradient: firstcolor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(70, 0, 0, 0),
                    offset: Offset(0, 3),
                    blurRadius: 3)
              ]),
          child: null,
        ),
      ),
    );
  }
}

class customButton extends StatelessWidget {
  const customButton({
    super.key,
    this.onpressed,
  });
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onpressed,
        child: Text(
          'Add',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        style:
            ButtonStyle(backgroundColor: MaterialStatePropertyAll(bluecolor)),
      ),
    );
  }
}

class customTextField extends StatelessWidget {
  const customTextField({
    super.key,
    required this.hint,
    this.maxlines = 1,
    this.onsaved,
  });
  final String hint;
  final int maxlines;
  final void Function(String?)? onsaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onsaved,
      maxLines: maxlines,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Required field';
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: bluecolor, width: 2)),
          hintText: hint),
    );
  }
}
