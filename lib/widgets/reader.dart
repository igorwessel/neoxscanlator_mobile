import 'package:NeoxScanlator/widgets/page.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class Reader extends StatefulWidget {
  @override
  _ReaderState createState() => _ReaderState();
}

class _ReaderState extends State<Reader> {
  final pages = [
    {
      'id': 'cap55_1',
      'url':
          'https://neoxscans.com/wp-content/uploads/WP-manga/data/manga_5fc5a3144583d/14e337733b8524d18c85ca8696f04f5f/00.jpg',
      'width': 800,
      'height': 600,
    },
    {
      'id': 'cap55_2',
      'url':
          'https://neoxscans.com/wp-content/uploads/WP-manga/data/manga_5fc5a3144583d/14e337733b8524d18c85ca8696f04f5f/01-copy.jpg',
      'width': 720,
      'height': 9183,
    },
    {
      'id': 'cap55_3',
      'url':
          'https://neoxscans.com/wp-content/uploads/WP-manga/data/manga_5fc5a3144583d/14e337733b8524d18c85ca8696f04f5f/02-copy.jpg',
      'width': 720,
      'height': 8876,
    },
    {
      'id': 'cap55_4',
      'url':
          'https://neoxscans.com/wp-content/uploads/WP-manga/data/manga_5fc5a3144583d/14e337733b8524d18c85ca8696f04f5f/03-copy.jpg',
      'width': 720,
      'height': 8325,
    },
    {
      'id': 'cap55_5',
      'url':
          'https://neoxscans.com/wp-content/uploads/WP-manga/data/manga_5fc5a3144583d/14e337733b8524d18c85ca8696f04f5f/04-copy.jpg',
      'width': 720,
      'height': 9867,
    },
    {
      'id': 'cap55_6',
      'url':
          'https://neoxscans.com/wp-content/uploads/WP-manga/data/manga_5fc5a3144583d/14e337733b8524d18c85ca8696f04f5f/05-copy.jpg',
      'width': 720,
      'height': 6511,
    },
    {
      'id': 'cap55_7',
      'url':
          'https://neoxscans.com/wp-content/uploads/WP-manga/data/manga_5fc5a3144583d/14e337733b8524d18c85ca8696f04f5f/99.jpg',
      'width': 1080,
      'height': 810,
    }
  ];

  double _scale = 1.0;

  double _previousScale = 1.0;

  void Function(ScaleStartDetails) _handleScaleStart(scaleDetails) {
    setState(() {
      _previousScale = _scale;
    });
  }

  void Function(ScaleUpdateDetails) _handleScaleUpdate(scaleDetails) {
    setState(() {
      _scale = _previousScale * scaleDetails.scale;
    });
  }

  void Function(ScaleEndDetails) _handleScaleEnd(scaleDetails) {
    setState(() {
      _previousScale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onScaleStart: _handleScaleStart,
        onScaleEnd: _handleScaleEnd,
        onScaleUpdate: _handleScaleUpdate,
        child: Transform(
          transform: Matrix4.diagonal3(Vector3(_scale, _scale, _scale)),
          alignment: FractionalOffset.center,
          child: Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: pages.length,
              itemBuilder: (ctx, index) {
                final page = pages[index];

                return ChapterPage(
                  page: page,
                );
              },
            ),
          ),
        ));
  }
}
