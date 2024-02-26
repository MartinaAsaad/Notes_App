import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'note_model.g.dart';
@HiveType(typeId: 0)
class Note extends HiveObject{
  @HiveField(0)
  String title;
   @HiveField( 1)
  String content;
   @HiveField(2)
 final String date;
   @HiveField(3)
  String category;
   @HiveField(4)
  String color;
  Note({required this.color, required this.title, required this.content, required this.date, required this.category});
 

}