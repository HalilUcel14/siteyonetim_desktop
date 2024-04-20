abstract class MyEquatable {
  List<Object?> get props;

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is MyEquatable &&
          runtimeType == other.runtimeType &&
          _equals(props, other.props);

  bool _equals(List<dynamic> props, List<dynamic> other) {
    if (props.length != other.length) return false;
    for (var i = 0; i < props.length; i++) {
      final result = identical(props[i], other[i]);
      if (result == false) return false;
    }
    return true;
  }
}
