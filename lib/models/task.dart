class Task {
  final String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void toggleIsDone() {
    isDone = !isDone;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Task &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          isDone == other.isDone;

  @override
  int get hashCode => name.hashCode ^ isDone.hashCode;
}
