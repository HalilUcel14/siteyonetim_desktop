import 'package:flutter/material.dart';

class SessionUser<T> {
  T? metaData;
  bool isLoggedIn;
  DateTime logTime;

  SessionUser({
    required this.metaData,
    required this.isLoggedIn,
    required this.logTime,
  });

  SessionUser<T> copyWith({
    T? metaData,
    bool? isLoggedIn,
    DateTime? logTime,
  }) {
    return SessionUser<T>(
      metaData: metaData ?? this.metaData,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      logTime: logTime ?? this.logTime,
    );
  }

  void logIn(T data) {
    metaData = data;
    isLoggedIn = true;
    logTime = DateTime.now();
  }

  void logOut() {
    metaData = null;
    isLoggedIn = false;
    logTime = DateTime.now();
  }
}

class SessionManager<T> extends InheritedWidget {
  final SessionUser<T> session;

  const SessionManager({
    super.key,
    required this.session,
    required super.child,
  });

  static SessionManager? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SessionManager>();
  }

  static SessionManager of(BuildContext context) {
    final response = maybeOf(context);
    assert(response != null, ' Have Not exist in Context');
    return response!;
  }

  @override
  bool updateShouldNotify(SessionManager<T> oldWidget) {
    return oldWidget.session != session;
  }
}
