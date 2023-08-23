import 'package:hive_flutter/hive_flutter.dart';

import '../../features/home/domain/entities/book_entity.dart';

void saveBooksIntoHiveBox(
    {required String boxName, required List<BookEntity> books}) {
  var box = Hive.box(boxName);
  box.addAll(books);
}
