import 'package:flutter/material.dart';

class ChapterPage extends StatefulWidget {
  final page;

  ChapterPage({
    @required this.page,
  });

  @override
  _ChapterPageState createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.page['url'],
    );
  }
}
