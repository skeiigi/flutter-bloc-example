import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/app_bloc.dart';

class RegisterForm extends StatelessWidget {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  RegisterForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 50),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text("Логин")),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: TextField(controller: _loginController,)),
          SizedBox(height: 10),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text("Пароль")),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: TextField(controller: _passwordController, obscureText: true)),
          SizedBox(height: 20),

          Center(
            child: ElevatedButton(
              onPressed: () {
                final login = _loginController.text.trim();
                final password = _passwordController.text.trim();

                if (login.isEmpty || password.isEmpty) {
                  context.read<RegisterBloc>().add(Failed(failString: "Введите логин и пароль"));
                } else {
                  context.read<RegisterBloc>().add(Registered(login: login, password: password));
                }
              }, 
              child: Text("Зарегистрироваться")
            ),
          ),
          BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              if (state is NoRegister) {
                return Container();
              } else if (state is HasRegistered) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text("Вы успешно зарегистрировались! Ваш логин: ${state.login}, пароль: ${state.password}"),
                  ),
                );
              } else if (state is RegisterFailed) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text("Ошибка: ${state.failString}"),
                  ),
                );
              }
              return Container();
            }
          )
        ],
    );
  }
}