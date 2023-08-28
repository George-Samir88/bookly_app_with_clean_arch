part of 'newest_books_cubit.dart';

@immutable
abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoadingState extends NewestBooksState {}

class NewestBooksFailureState extends NewestBooksState {
  final String error;

  NewestBooksFailureState(this.error);
}

class NewestBooksSuccessState extends NewestBooksState {
  final List<BookEntity> books;

  NewestBooksSuccessState(this.books);
}
