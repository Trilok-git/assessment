import 'package:flutter/material.dart';

class InfiniteList extends StatefulWidget {
  final onRequest;
  final itemBuilder;

  const InfiniteList(
      {Key? key, required this.onRequest, required this.itemBuilder})
      : super(key: key);

  @override
  _InfiniteListState createState() => _InfiniteListState();
}

class _InfiniteListState extends State<InfiniteList> {
  List items = [];
  bool end = false;

  _getMoreItems() async {
    final moreItems = await widget.onRequest(items.length);
    if (!mounted) return;

    if (moreItems.isEmpty) {
      setState(() => end = true);
      return;
    }
    setState(() => items = [...items, ...moreItems]);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index < items.length) {
          return widget.itemBuilder(context, items[index], index);
        } else if (index == items.length && end) {
          return const Center(child: Text('End of list'));
        } else {
          _getMoreItems();
          return const SizedBox(
            height: 80,
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
      itemCount: items.length + 1,
    );
  }
}