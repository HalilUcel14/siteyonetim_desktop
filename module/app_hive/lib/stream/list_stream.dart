import 'dart:async';

class StreamListObject<T> {
  final _listController = StreamController<List<T>>.broadcast();

  Stream<List<T>> get dataStream => _listController.stream;

  void updateList(List<T> newList) {
    _listController.add(newList);
  }

  void dispose() {
    _listController.close();
  }
}
