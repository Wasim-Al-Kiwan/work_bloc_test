class Task {
  static int _id =1;
  final int id=_id++;
  String name;
  String description;
  String ?assignedEmployee;
  Task({required this.name,
    required this.description,
    this.assignedEmployee
  });
}
