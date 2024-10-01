// ignore_for_file: public_member_api_docs, sort_constructors_first

class Todo {
  final String name;
  final DateTime createdAt;
  Todo({
    required this.name,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      name: map['name'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  @override
  String toString() => 'Todo(name: $name, createdAt: $createdAt)';
}
