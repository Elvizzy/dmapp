class Task {
  String task;
  DateTime time;

  Task({required this.task, required this.time});

  factory Task.fromString(String task) {
    return Task(task: task, time: DateTime.now());
  }

  Map<String, dynamic> getMapz() {
    return {'task': task, 'time': time.millisecondsSinceEpoch};
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
        task: map['task'],
        time: DateTime.fromMicrosecondsSinceEpoch(map['time']));
  }
}
