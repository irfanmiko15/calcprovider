import 'package:equatable/equatable.dart';

class Pair<K, V> extends Equatable {
  //Create a Model class to hold key-value pair data
  final K? key;
  final V? value;

  const Pair({this.key, this.value});

  @override
  List<Object?> get props => [key, value];
}
