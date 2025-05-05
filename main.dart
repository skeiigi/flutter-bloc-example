import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/app_bloc.dart';
import 'widgets/register_form.dart';

void main() {
  runApp(MyAppWithBloc());
}

class MyAppWithBloc extends StatelessWidget {
  const MyAppWithBloc({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => RegisterBloc(), 
        child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Время регистрации!", ),
          backgroundColor: Colors.blue[200],
          shadowColor: Colors.black,
          elevation: 5.0,
          ),
          body: RegisterForm(),
        ),
      )
    );
  }
}