import 'package:flutter/material.dart';
import 'alter.dart';
import 'done.dart';
import 'deleted.dart';

void main() {
  runApp(const MyApp());
}
bool isDarkMode = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {


  List<String> tasks = [];
  List<String> doneTasks = [];
  List<String> deletedTasks = [];
  bool isDarkMode = false;

  void addTask(String newTask) {
    setState(() {
      tasks.add(newTask);
    });
  }

  void markTaskAsDone(int index) {
    setState(() {
      doneTasks.add(tasks[index]);
      tasks.removeAt(index);
    });
  }

  void deleteTask(int index) {
    setState(() {
      deletedTasks.add(tasks[index]);
      tasks.removeAt(index);
    });
  }

  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6), // Toggle button icon
            onPressed: toggleDarkMode, // Toggle dark mode
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(tasks[index]),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                markTaskAsDone(index);
              } else if (direction == DismissDirection.startToEnd) {
                deleteTask(index);
              }
            },
            background: Container(
              color: Colors.green,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: ListTile(
              title: Text(tasks[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );

          if (newTask != null) {
            addTask(newTask);
          }
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Deleted',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DoneTaskScreen(doneTasks ,dnTasks: doneTasks),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DeletedTaskScreen(deletedTasks, deletedTasksList: deletedTasks),
              ),
            );
          }
        },
      ),
      // Set the theme based on isDarkMode
    );
  }
}
