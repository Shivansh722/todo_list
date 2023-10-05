import 'package:flutter/material.dart';

class DoneTaskScreen extends StatelessWidget {
  final List<String> doneTasks;

  const DoneTaskScreen(this.doneTasks, {super.key, required List<String> dnTasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Done Tasks'),
      ),
      body: ListView.builder(
        itemCount: doneTasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(doneTasks[index]),
          );
        },
      ),
    );
  }
}
