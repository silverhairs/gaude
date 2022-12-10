import 'package:equatable/equatable.dart';

class Failure with EquatableMixin {
  const Failure(this.error, this.stackTrace);
  final Object error;
  final StackTrace stackTrace;
  @override
  List<Object> get props => [error, stackTrace];
}
