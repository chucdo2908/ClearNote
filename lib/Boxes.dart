import 'package:appclearnote/Models/model_note.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Product> getTransactions() =>
      Hive.box<Product>('product');
}