import 'package:flutter/material.dart';

final class ConnectionStateBuilder<T> {
  final AsyncSnapshot<T> snapshot;
  Widget Function(T? data) success;

  ConnectionStateBuilder({
    required this.snapshot,
    required this.success,
  });

  Widget build() {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        debugPrint("Connection None: Data type: $T");
        return const Text('Bağlantı Durumu Yok');
      case ConnectionState.waiting:
        debugPrint("Connection Waiting: Data type: $T");
        return const CircularProgressIndicator.adaptive();
      case ConnectionState.done:
        if (snapshot.hasError) {
          // Error State
          debugPrint("Connection Error: Data type: $T");
          return Center(child: Text('Hata: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          debugPrint("Connection Empty Value: Data type: $T");
          return const Center(child: Text('Veri Yok'));
        } else {
          debugPrint(
            "Connection Success: Data type: $T and Data: ${snapshot.data}",
          );
          return success(snapshot.data);
        }

      default:
        return const Center(child: Text('Beklenmeyen Durum'));
    }
  }
}
