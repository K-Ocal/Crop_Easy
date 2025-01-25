import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<bool> {
  SplashCubit() : super(false);
  initializeSplash() async {
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => emit(true),
    );
  }
}
