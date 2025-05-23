import 'package:ecommer_app_market/core/extension/context_extensions.dart';
import 'package:ecommer_app_market/core/extension/size_extensions.dart';
import 'package:ecommer_app_market/core/extension/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/routes/app_names.dart';
import '../../../../core/widgets/w_button.dart';
import '../../../../core/widgets/w_rounded_container.dart';
import '../bloc/onboarding_bloc.dart';
import '../bloc/onboarding_event.dart';
import '../bloc/onboarding_state.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> pages = const [
    {
      "title": "Various Collections Of The Latest Products",
      "desc":
          "Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.",
    },
    {
      "title": "Complete Collection Of Colors And Sizes",
      "desc":
          "Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.",
    },
    {
      "title": "Find The Most Suitable Outfit For You",
      "desc":
          "Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.",
    },
  ];
  void nextPage(BuildContext context) {
    final bloc = context.read<OnBoardingBloc>();
    final currentPage = bloc.state.currentPage;

    if (currentPage < pages.length - 1) {
      bloc.add(OnBoardingNextPressed());
      _pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 800),
        curve: Curves.decelerate,
      );
    } else {
      context.go(AppNames.register);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<OnBoardingBloc, OnBoardingState>(
          buildWhen:
              (previous, current) =>
                  previous.currentPage != current.currentPage ||
                  previous.isLastPage != current.isLastPage,
          builder: (context, state) {
            return Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  context.read<OnBoardingBloc>().add(
                    OnBoardingPageChanged(index),
                  );
                },
                itemBuilder:
                    (context, index) => Column(
                      children: [
                        WRoundedContainer(
                          color: context.colors.primary,
                          child: SizedBox(
                            width: double.infinity,
                            height: 340.h,
                          ),
                        ).paddingOnly(
                          top: 114.h,
                          left: 68.w,
                          right: 67.w,
                          bottom: 63.h,
                        ),
                        Text(
                          pages[index]['title']!,
                          textAlign: TextAlign.center,
                          style: context.styles.s22w800,
                        ).paddingSymmetric(horizontal: 27.o),
                        Text(
                          pages[index]['desc']!,
                          textAlign: TextAlign.center,
                          style: context.styles.s16w400.copyWith(
                            color: context.colors.gray5,
                          ),
                        ).paddingSymmetric(horizontal: 26.w),
                      ],
                    ),
              ),
            );
          },
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: pages.length,
          effect: WormEffect(
            dotWidth: 7.o,
            dotHeight: 7.h,
            dotColor: context.colors.primary.withOpacity(0.3),
            activeDotColor: context.colors.primary,
          ),
        ).paddingOnly(top: 32.h, bottom: 70.h),
        WButton(
          width: double.infinity,
          height: 65.h,
          color: context.colors.primary,
          borderRadius: 30.o,
          onTap: () => nextPage(context),
          child: Center(
            child: Text(
              "Create Account",
              style: context.styles.s14w700.copyWith(
                color: context.colors.white,
              ),
            ),
          ),
        ).paddingSymmetric(horizontal: 24.w),
        TextButton(
          onPressed:
              () => _pageController.animateToPage(
                0,
                duration: const Duration(milliseconds: 800),
                curve: Curves.decelerate,
              ),
          child: Text(
            "Alredy Have Account",
            style: context.styles.s16w600.copyWith(
              color: context.colors.primary,
            ),
          ),
        ).paddingOnly(bottom: 40.h, top: 16.h),
      ],
    );
  }
}
