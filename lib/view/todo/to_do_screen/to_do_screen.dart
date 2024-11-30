import 'package:bloc_state_management/bloc/todo/to_do_bloc.dart';
import 'package:bloc_state_management/bloc/todo/to_do_event.dart';
import 'package:bloc_state_management/bloc/todo/to_do_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if(state.todos.isEmpty){
            return const Center(
              child: Text("No todo found"),
            );
          }else if(state.todos.isNotEmpty){
            return ListView.builder(
              itemCount: state.todos.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todos[index].toString()),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<ToDoBloc>().add(RemoveTodoEvent(state.todos[index]));
                    },
                  ),
                );
              },
            );
          }else{
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 10; i++) {
            context.read<ToDoBloc>().add(AddTodoEvent('Task $i'));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}