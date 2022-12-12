import 'dart:async';

abstract class Storage<T> {
  FutureOr<T?> read(String key);
  FutureOr<void> write(String key, T data);
  FutureOr<void> delete(String key);
  FutureOr<List<T>> readAll();
  FutureOr<void> deleteAll();
  FutureOr<void> close();
}
