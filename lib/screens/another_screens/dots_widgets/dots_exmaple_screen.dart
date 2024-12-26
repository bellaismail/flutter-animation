import 'package:animation_practices/screens/another_screens/dots_widgets/page_view_container.dart';
import 'package:flutter/material.dart';

import 'custom_dot_list_view.dart';

class DotsExampleScreen extends StatefulWidget {
  const DotsExampleScreen({super.key});

  @override
  State<DotsExampleScreen> createState() => _DotsExampleScreenState();
}

class _DotsExampleScreenState extends State<DotsExampleScreen> with SingleTickerProviderStateMixin{
  int initPage = 0;
  late PageController _pageController;
  late int selection;
  List colors = [
    Colors.lightBlueAccent,
    Colors.lightGreen,
    Colors.yellow,
    Colors.purpleAccent,
    Colors.teal,
  ];

  @override
  void initState() {
    super.initState();
    selection = initPage;
    // Animation _a = Tween(begin: 1, end: 10).animate(
    //   CurvedAnimation(
    //     parent: AnimationController(vsync: this),
    //     curve: Curves.linear,
    //   ),
    // );
    _pageController = PageController(initialPage: initPage);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('custom dots screen'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: PageView.builder(
                controller: _pageController,
                itemCount: colors.length,
                onPageChanged: (i) => setState(() => selection = i),
                itemBuilder: (context, index) {
                  return PageViewContainer(color: colors[index]);
                },
              ),
            ),
            const SizedBox(height: 50),
            CustomDotListView(
              count: colors.length,
              select: selection,
              dotColor: colors[selection],
            ),

            const SizedBox(height: 50),
            const _SegmentedButton(),
          ],
        ),
      ),
    );
  }
}

class _SegmentedButton extends StatefulWidget {
  const _SegmentedButton({super.key});

  @override
  State<_SegmentedButton> createState() => _SegmentedButtonState();
}

class _SegmentedButtonState extends State<_SegmentedButton> {
  Set<int> select = <int>{0};
  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      selected: select,
      emptySelectionAllowed: true,
      expandedInsets: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      onSelectionChanged: (val) => setState(() => select = val),
      selectedIcon: const Icon(Icons.check_circle, color: Colors.purpleAccent),
      showSelectedIcon: true,
      multiSelectionEnabled: false,
      segments: List.generate(
        5,
        (index) => ButtonSegment<int>(
          value: index,
          label: Text('${index + 1}'),
          icon: const Icon(Icons.access_alarm_outlined),
          enabled: true,
          tooltip: 'tooltip $index',
        ),
      ),
    );
  }
}