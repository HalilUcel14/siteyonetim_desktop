extension DateTimeExtension on DateTime {
  bool get isBefore3Days => isBefore(
        DateTime.now().subtract(
          const Duration(days: 3),
        ),
      );
  bool get isAfter3Days => isAfter(
        DateTime.now().add(
          const Duration(days: 3),
        ),
      );
}
