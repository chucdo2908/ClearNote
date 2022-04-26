
import 'package:hive/hive.dart';
part 'model_title.g.dart';


@HiveType(typeId: 0)
class Product extends HiveObject{
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String title;
  @HiveField(2)
  late List noidung;
}