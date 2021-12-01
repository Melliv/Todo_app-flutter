import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/constants.dart';
import 'package:todo_app_flutter/providers/auth_provider.dart';
import 'package:todo_app_flutter/providers/category_provider.dart';
import 'package:todo_app_flutter/providers/priority_provider.dart';
import 'package:todo_app_flutter/providers/todo_make_provider.dart';
import 'package:todo_app_flutter/providers/todo_provider.dart';
import 'package:todo_app_flutter/providers/user_provider.dart';
import 'package:todo_app_flutter/screen/category/category_screen.dart';
import 'package:todo_app_flutter/screen/identity/login_screen.dart';
import 'package:todo_app_flutter/screen/identity/register_screen.dart';
import 'package:todo_app_flutter/screen/priority/priority_screen.dart';
import 'package:todo_app_flutter/screen/todo/todo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => CategoryProvider()),
          ChangeNotifierProvider(create: (_) => TodoProvider()),
          ChangeNotifierProvider(create: (_) => PriorityProvider()),
          ChangeNotifierProvider(create: (_) => TodoMakeProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Todo App',
          theme: ThemeData(
              scaffoldBackgroundColor: kBackgroundColor,
              primaryColor: kPrimaryColor,
              textTheme:
                  Theme.of(context).textTheme.apply(bodyColor: kTextColor)),
          home: LoginScreen(),
          routes: {
            '/Login': (context) => const LoginScreen(),
            '/Todo': (context) => const ToDoScreen(),
            '/Register': (context) => const RegisterScreen(),
            '/Category': (context) => const CategoryScreen(),
            '/Priority': (context) => const PriorityScreen(),
          },
        ));
  }
}
