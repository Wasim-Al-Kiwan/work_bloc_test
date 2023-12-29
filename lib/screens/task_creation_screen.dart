import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/task/task_bloc.dart';
import '../models/task.dart';

class TaskCreationScreen extends StatefulWidget {
  @override
  _TaskCreationScreenState createState() => _TaskCreationScreenState();
}

class _TaskCreationScreenState extends State<TaskCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _taskName='';
  String ?_taskDescription;
  String? _assignedEmployee;

  void _createTask() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final task = Task(
        name: _taskName,
        description: _taskDescription??'',
        assignedEmployee: _assignedEmployee??'',
      );
      context.read<TaskBloc>().add(CreateTaskEvent(task));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Task')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Task Name'),
                validator: (value) => value!.isEmpty ? 'Please enter a task name' : null,
                onSaved: (value) => _taskName = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Task Description'),
                onSaved: (value) => _taskDescription = value!,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Assign to Employee'),
                items: <String>['Alice', 'Bob', 'Charlie']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String ?newValue) {
                  _assignedEmployee = newValue!;
                },
                onSaved: (value) => _assignedEmployee = value??'',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _createTask,
                child: Text('Create Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
