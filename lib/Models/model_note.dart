import 'package:hive/hive.dart';
part 'model_note.g.dart';


@HiveType(typeId: 0)
class Product extends HiveObject{
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String title;
  @HiveField(2)
  late String noidung;
  @HiveField(3)
  late int Color;
  @HiveField(4)
  late double font;
}