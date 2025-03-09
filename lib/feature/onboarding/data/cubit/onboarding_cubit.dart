import 'package:booking_application/feature/onboarding/data/model/onboarding_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  void nextPage() {
    if (state < totalPages - 1) {
      emit(state + 1);
    } else {
      completeOnboarding();
    }
  }

  void completeOnboarding() {
    emit(totalPages - 1);
  }

  int get totalPages => OnboardingService.instance.getOnboardingModels().length;
}