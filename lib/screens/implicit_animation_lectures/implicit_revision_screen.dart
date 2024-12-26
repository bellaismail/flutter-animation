import 'dart:math';
import 'package:animation_practices/widgets/lectures_FAB.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImplicitRevisionScreen extends StatefulWidget {
  const ImplicitRevisionScreen({super.key});

  @override
  State<ImplicitRevisionScreen> createState() => _ImplicitRevisionScreenState();
}

class _ImplicitRevisionScreenState extends State<ImplicitRevisionScreen> with TickerProviderStateMixin{


  final _myList = <Widget>[];
  final _myList2 = <Widget>[];
  final Random _random = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('custom animatedListView'),
          Expanded(
            child: _CustomAnimatedListView(
              index: 1,
              myList: _myList,
              removeWidget: _widget('removed item', color: Colors.grey.withOpacity(0.5)),
              insertNewItem: _insert,
              removeItem: _remove,
            ),
          ),
          const Divider(thickness: 5, color: Colors.grey),
          Expanded(
            child: _CustomAnimatedListView(
              index: 2,
              myList: _myList2,
              removeWidget: _widget2('removed item'),
              insertNewItem: _insert2,
              removeItem: _remove2,
            ),
          ),
        ],
      ),
    );
  }

  _insert() => _myList.add(_widget('${_myList.length}'));
  _remove() => _myList.removeLast();

  _insert2() => _myList2.add(_widget2('${_myList2.length}'));
  _remove2() => _myList2.removeLast();

  _widget(String title, {Color? color}) {
    return Container(
      width: double.infinity,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color?? Color.fromRGBO(_random.nextInt(10000), _random.nextInt(10000), _random.nextInt(10000), .6),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  _widget2(String title) {
    return ListTile(title: Text(title));
  }
}


class _CustomAnimatedListView extends StatefulWidget {
  const _CustomAnimatedListView({
    required this.myList,
    required this.insertNewItem,
    required this.removeItem,
    required this.removeWidget,
    required this.index,
  });

  final int index;
  final List<Widget> myList;
  final Function()? insertNewItem;
  final Function()? removeItem;
  final Widget removeWidget;
  @override
  State<_CustomAnimatedListView> createState() => _CustomAnimatedListViewState();
}

class _CustomAnimatedListViewState extends State<_CustomAnimatedListView> with TickerProviderStateMixin{

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(widget.myList.isEmpty)
          Expanded(child: AnimatedSwitcher(duration: const Duration(milliseconds: 500), child: _emptyWidget(),)),
        if(widget.myList.isNotEmpty)
          Expanded(
          child: AnimatedList(
            key: _listKey,
            initialItemCount: widget.myList.length,
            itemBuilder: (context, index, animation) => SizeTransition(
              sizeFactor: animation,
              child: widget.myList[index],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LecturesFab(heroTag: 'insert${widget.index}', action: _insert, icon: Icons.add),
            LecturesFab(heroTag: 'remove${widget.index}', action: _remove, icon: Icons.remove),
          ],
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  _insert() {
    if(widget.insertNewItem != null) {
      widget.insertNewItem!();
      _listKey.currentState?.insertItem(widget.myList.length-1);
      setState(() {});
    }
  }
  _remove() {
    if(widget.myList.isNotEmpty) {
      if(widget.removeItem != null) {
        widget.removeItem!();
        _listKey.currentState?.removeItem(
          widget.myList.length,
              (context, animation) {
            return SlideTransition(
              position: Tween(begin: const Offset(1, 0), end: Offset.zero).animate(animation),
              child: Skeletonizer(
                enabled: true,
                child: widget.removeWidget,
              ),
            );
          },
        );
        setState(() {});
      }
    }
  }

  Widget _emptyWidget() => const Center(
    child: Text(
      'Empty...!',
      style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.w200),
    ),
  );
}