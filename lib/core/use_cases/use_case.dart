import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<Right, Param> {
  Future<Either<Failure, Right>> call([Param param]);
}

class NoParam {}
