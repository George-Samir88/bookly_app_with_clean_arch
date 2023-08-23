import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

import '../../../../../core/functions/save_books_into_hive.dart';
import '../../models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();

  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImp(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var jsonData = await apiService.get(
        endPoint: 'volumes?q=programming&Filtering=free-ebooks');
    List<BookEntity> books = parseJsonStringToBookList(jsonData);
    saveBooksIntoHiveBox(
      books: books,
      boxName: kFeaturedBox,
    );
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var jsonData = await apiService.get(
        endPoint: 'volumes?q=programming&Filtering=free-ebooks&Sorting=newest');
    List<BookEntity> books = parseJsonStringToBookList(jsonData);
    return books;
  }

  List<BookEntity> parseJsonStringToBookList(Map<String, dynamic> jsonData) {
    List<BookEntity> books = [];
    for (var e in jsonData['items']) {
      books.add(BookModel.fromJson(e));
    }
    saveBooksIntoHiveBox(
      boxName: kNewestBox,
      books: books,
    );
    return books;
  }
}
