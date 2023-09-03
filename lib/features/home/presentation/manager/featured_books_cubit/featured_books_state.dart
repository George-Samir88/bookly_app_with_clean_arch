part of 'featured_books_cubit.dart';

@immutable
abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoadingState extends FeaturedBooksState {}

class FeaturedBooksPaginationLoadingState extends FeaturedBooksState {}

class FeaturedBooksPaginationFailureState extends FeaturedBooksState {
  final String error;

  FeaturedBooksPaginationFailureState({required this.error});
}

class FeaturedBooksFailureState extends FeaturedBooksState {
  final String error;

  FeaturedBooksFailureState(this.error);
}

class FeaturedBooksSuccessState extends FeaturedBooksState {
  final List<BookEntity> books;

  FeaturedBooksSuccessState(this.books);
}
