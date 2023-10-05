import 'package:flutter/material.dart';

class DeletedTaskScreen extends StatelessWidget {
  final List<String> deletedTasks;

  const DeletedTaskScreen(this.deletedTasks, {super.key, required List<String> deletedTasksList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deleted Tasks'),
      ),
      body: ListView.builder(
        itemCount: deletedTasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(deletedTasks[index]),
          );
        },
      ),
    );
  }
}
