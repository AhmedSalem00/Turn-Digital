import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final String correctOtp = "0000";
  Timer? _timer;
  int _timerSeconds = 20;

  VerificationCubit() : super(VerificationInitial()) {
    startTimer();  // Start the timer when the cubit is initialized
  }

  void startTimer() {
    emit(VerificationTimerUpdated(_timerSeconds));
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (_timerSeconds > 0) {
        _timerSeconds--;
        emit(VerificationTimerUpdated(_timerSeconds));
      } else {
        t.cancel();
      }
    });
  }

  void validateOtp(String enteredOtp) {
    if (enteredOtp == correctOtp) {
      emit(VerificationSuccess());
    } else {
      emit(VerificationFailure());
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
