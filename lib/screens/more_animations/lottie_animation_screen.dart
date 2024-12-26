import 'package:animation_practices/core/utils/app_assets.dart';
import 'package:animation_practices/widgets/lectures_FAB.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationScreen extends StatefulWidget {
  const LottieAnimationScreen({super.key});
  @override
  State<LottieAnimationScreen> createState() => _LottieAnimationScreenState();
}

class _LottieAnimationScreenState extends State<LottieAnimationScreen> with SingleTickerProviderStateMixin{
  final PageController _pageController = PageController(initialPage: 0);
  int page = 0;
  List list = [
    AppAssets.cartLottie,
    AppAssets.freeDroppingLottie,
    AppAssets.scatingLottie,
  ];


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('#lottie_animation'),
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() => page = value);
        },
        itemCount: list.length,
        itemBuilder: (context, index) => Center(
          child: Lottie.asset(list[index], reverse: true),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        onTap: (value) {
          _pageController.animateToPage(
            value,
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
          );
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.animation_outlined), label: 'title1'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'title2'),
          BottomNavigationBarItem(icon: Icon(Icons.accessible_forward), label: 'title3'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(page != list.length-1)
          LecturesFab(
            heroTag: '1',
            icon: Icons.navigate_next_rounded,
            action: () =>
              _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
              ),
          ),
          const Expanded(child: SizedBox()),
          if(page != 0)
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: LecturesFab(
                heroTag: '2',
                icon: Icons.navigate_before_rounded,
                action: () =>
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                  ),
              ),
            ),
        ],
      ),
    );
  }
}