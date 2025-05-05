import 'package:flutter_bloc/flutter_bloc.dart';
part 'app_event.dart';
part 'app_state.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(NoRegister()) {
    on<Registered>((event, emit) {
      emit(HasRegistered(login: event.login, password: event.password));
    });

    on<Failed>((event, emit) {
      emit(RegisterFailed(failString: event.failString));
    });
  }
}
