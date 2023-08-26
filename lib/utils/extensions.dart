import 'package:flutter/widgets.dart';

extension RouteArgExt on RouteSettings {
  dynamic getArg(String key) {
    var args = arguments == null
        ? null
        : Map<String, dynamic>.from(arguments as Map<dynamic, dynamic>) ;
    return args == null ? null : args[key];
  }
}

extension ListExt<E> on List<E> {
  Iterable<T> indexedMap<T>(T Function(int i, E e) f) =>
      asMap().entries.map((entry) {
        var idx = entry.key;
        var val = entry.value;
        return f(idx, val);
      });
}