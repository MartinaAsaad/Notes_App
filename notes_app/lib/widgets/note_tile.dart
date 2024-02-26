

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/note_cubit/note_cubit.dart';
import 'package:notes_app/helpers/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_view.dart';

class noteTile extends StatelessWidget {
  const noteTile({
    super.key, required this.note,
  });
final Note note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return editPage(note: note,);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
              gradient:mapofcolors[note.color],
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(100, 0, 0, 0),
                    offset: Offset(0, 3),
                    blurRadius: 3)
              ]),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //   Text('Flutter Tips',style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.w400),),
                //  IconButton(onPressed: (){}, icon: Icon(Icons.delete,size: 40,)),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text(
                    note.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w400),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      note.content,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        BlocProvider.of<NoteCubit>(context).FetchAll();
                        note.delete();
                      },
                      icon: Icon(
                        Icons.delete,
                        size: 40,
                        color: Colors.white,
                      )),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    note.date,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Text(note.category)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
