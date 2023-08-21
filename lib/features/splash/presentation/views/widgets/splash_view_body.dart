import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    initAnimation();
    navigateToHomeView();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(CustomAssets.logo),
        const SizedBox(
          height: 5.0,
        ),
        SlidingText(slideAnimation: slideAnimation),
      ],
    );
  }

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slideAnimation = Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
    // slideAnimation.addListener(() {
    //   setState(() {});
    // }); //replace it with animated builder
  }

  void navigateToHomeView() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // Get.to(
        //   () => const HomeView(),
        //   duration: kTransitionDuration,
        //   transition: Transition.fadeIn,
        // ); // replace it with go router
        context.go(AppRouter.homeViewPath);
        // GoRouter.of(context).push(AppRouter.homeViewPath);
      },
    );
  }
}
