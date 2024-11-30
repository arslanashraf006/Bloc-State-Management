import 'package:bloc_state_management/bloc/counter/counter_bloc.dart';
import 'package:bloc_state_management/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_state_management/bloc/switch_bloc/switch_bloc.dart';
import 'package:bloc_state_management/repository/favourite_repository.dart';
import 'package:bloc_state_management/utilis/image_picker_utilis.dart';
import 'package:bloc_state_management/view/counter/counter_screen.dart';
import 'package:bloc_state_management/view/counter/home_screen.dart';
import 'package:bloc_state_management/view/favorite/favorite_screen.dart';
import 'package:bloc_state_management/view/image_picker/image_picker_screen.dart';
import 'package:bloc_state_management/view/login/login_screen.dart';
import 'package:bloc_state_management/view/post/post_screen.dart';
import 'package:bloc_state_management/view/switch_button/switch_widget.dart';
import 'package:bloc_state_management/view/text_field.dart';
import 'package:bloc_state_management/view/todo/to_do_screen/to_do_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/favorite/favorite_app_bloc.dart';
import 'bloc/post_bloc/post_bloc.dart';
import 'bloc/todo/to_do_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc(),),
        BlocProvider(create: (_) => SwitchBloc(),),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils()),),
        BlocProvider(create: (_) => ToDoBloc(),),
        BlocProvider(create: (_) => FavoriteAppBloc(FavouriteRepository()),),
        BlocProvider(create: (_) => PostBloc(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TextFieldTask(),
      ),
    );
  }
}

