import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/data_sources/home_local_data_source/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

//this class to call remote and local data source
class HomeRepoImp implements HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImp(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var cachedBooks = homeLocalDataSource.fetchFeaturedBooks();
      if (cachedBooks.isNotEmpty) {
        return right(cachedBooks);
      }
      var books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
