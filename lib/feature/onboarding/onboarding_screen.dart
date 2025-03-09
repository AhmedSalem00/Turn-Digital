import 'package:booking_application/core/helper/extension.dart';
import 'package:booking_application/core/routing/app_routers.dart';
import 'package:booking_application/core/theming/colors.dart';
import 'package:booking_application/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/cubit/onboarding_cubit.dart';
import 'data/model/onboarding_model.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        body: BlocBuilder<OnboardingCubit, int>(
          builder: (context, state) {
            final viewModel = OnboardingService.instance.getOnboardingModels();

            WidgetsBinding.instance.addPostFrameCallback((_) {
              pageController.jumpToPage(state);
            });

            return Stack(
              children: [
                PageView.builder(
                  controller: pageController,
                  itemCount: viewModel.length,
                  itemBuilder: (context, index) {
                    final model = viewModel[index];
                    return Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Image.asset(model.image, fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          width: 375.w,
                          height: 288.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: ColorsApp.orange,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Explore Upcoming and Nearby Events",
                                style: TextStyles.font20WhiteRegular,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "In publishing and graphic design, Lorem is a placeholder text commonly.",
                                style: TextStyles.font20WhiteRegular.copyWith(fontSize: 15.sp),
                                textAlign: TextAlign.center,

                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        context.removeAllAndPush(Routes.loginScreen);
                                      },
                                      child: Text(
                                        "Skip",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: List.generate(
                                        viewModel.length,
                                        (dotIndex) => Container(
                                          height: 8,
                                          width: 8,
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                state == dotIndex
                                                    ? Colors.white
                                                    : Colors.white.withOpacity(
                                                      0.5,
                                                    ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (state < viewModel.length - 1) {
                                          context
                                              .read<OnboardingCubit>()
                                              .nextPage();
                                        } else {
                                          context.pushNamed(Routes.loginScreen);
                                        }
                                      },
                                      child: Text(
                                        "Next",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  onPageChanged: (index) {
                    context.read<OnboardingCubit>().emit(index);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
