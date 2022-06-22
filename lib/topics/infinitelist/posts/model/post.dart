import 'package:equatable/equatable.dart';

class Post extends Equatable {
  const Post({required this.id, required this.name, required this.body});
  final int id;
  final String name;
  final String body;

  @override
  List<Object?> get props => [id, name, body];
}
