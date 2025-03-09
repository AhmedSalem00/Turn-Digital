part of 'verification_cubit.dart';

abstract class VerificationState extends Equatable {
  const VerificationState();

  @override
  List<Object?> get props => [];
}

class VerificationInitial extends VerificationState {}

class VerificationTimerUpdated extends VerificationState {
  final int seconds;

  const VerificationTimerUpdated(this.seconds);

  @override
  List<Object?> get props => [seconds];
}

class VerificationSuccess extends VerificationState {}

class VerificationFailure extends VerificationState {}