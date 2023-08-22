import '../../models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookModel>> fetchFeaturedBooks();

  Future<List<BookModel>> fetchNewestBooks();
}

class HomeRemoteDataSourceImp implements HomeRemoteDataSource{
  @override
  Future<List<BookModel>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookModel>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

}