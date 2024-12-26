import 'package:animation_practices/widgets/lectures_FAB.dart';
import 'package:animation_practices/widgets/lectures_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnimatedListStateScreen extends StatefulWidget {
  const AnimatedListStateScreen({super.key});

  @override
  State<AnimatedListStateScreen> createState() =>
      _AnimatedListStateScreenState();
}

class _AnimatedListStateScreenState extends State<AnimatedListStateScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<String> list = [];

  bool big = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lecturesAppBar(9),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        child: list.isNotEmpty
            ? AnimatedList(
                key: _listKey,
                initialItemCount: list.length,
                itemBuilder: (_, index, animation) => SizeTransition(
                  sizeFactor: animation,
                  child: ListTile(
                    title: Text(list[index]),
                    trailing: IconButton(
                        onPressed: () {
                          _deleteItem(index);
                        },
                        icon: const Icon(Icons.delete)),
                  ),
                ),
              )
            : const Center(
                child: Text('no item founded!'),
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: LecturesFab(action: _action),
    );
  }

  _action() {
    setState(() {
      list.insert(0, 'new item ${list.length}');
      _listKey.currentState?.insertItem(0);
    });
  }
  _deleteItem(index) {
    setState(() {
      list.removeAt(index);
      _listKey.currentState?.removeItem(index, (_, a) {
        return ScaleTransition(
          scale: a,
          child: Skeletonizer(
            enabled: true,
            child: ListTile(
              title: Text(
                list.isNotEmpty? list[index]: '',
                style: TextStyle(color: Colors.grey.withOpacity(0.6)),
              ),
              trailing: const IconButton(onPressed: null, icon: Icon(Icons.delete)),
            ),
          ),
        );
      }, duration: const Duration(milliseconds: 500));
    });
  }
}