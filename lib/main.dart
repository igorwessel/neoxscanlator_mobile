import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

void main() => runApp(NeoxScanlatorApp());

class NeoxScanlatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
        primaryColor: const Color(0xff079ac7),
        accentColor: Colors.white,
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          headline5: TextStyle(
            color: const Color.fromRGBO(51, 3, 0, 1),
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _search = TextEditingController();
  final _mangas = [
    {
      'title': 'White Blood',
      'score': '4.7',
      'chapters': ['Cap. 28', 'Cap. 27'],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/11/White-203x300-1-175x238.jpg',
    },
    {
      'title': 'The Last Human',
      'score': '4.7',
      'chapters': ['Cap. 299 ', 'Cap. 298 '],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/11/tlh-175x238.jpg',
    },
    {
      'title': 'Villain Initialization',
      'score': '4.6',
      'chapters': ['Cap. 53 ', 'Cap. 52 '],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/11/45457-225x300-1-175x238.jpg',
    },
    {
      'title': 'Legend of Mir: Gold Armored Sword Dragon',
      'score': '4.5',
      'chapters': ['Cap. 11 ', 'Cap. 10 16/01/2021'],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/12/Legend-of-Mir-175x238.jpg',
    },
    {
      'title': 'MEMORIZE',
      'score': '4.7',
      'chapters': ['Cap. 36 ', 'Cap. 35 10/01/2021'],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/11/Memorize-1-175x238.jpg',
    },
    {
      'title': 'Taming Master',
      'score': '4.8',
      'chapters': ['Cap. 31 ', 'Cap. 30 13/01/2021'],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/11/Taming-Master-175x238.jpg',
    },
    {
      'title': 'Release That Witch',
      'score': '4.7',
      'chapters': ['Cap. 213 ', 'Cap. 212 16/01/2021'],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/11/Sem-Titulo-4-210x300-1-175x238.jpg',
    },
    {
      'title': 'A newbie who’s nobody’s fool',
      'score': '4.8',
      'chapters': ['Cap. 24 ', 'Cap. 23 08/01/2021'],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/12/A-newbie-who-175x238.jpg',
    },
    {
      'title': 'I Tamed a Tyrant and Ran Away',
      'score': '4.7',
      'chapters': ['Cap. 10 ', 'Cap. 09 '],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2021/01/imagem_2021-01-16_163603-175x238.png',
    },
    {
      'title': 'Ebony',
      'score': '4.5',
      'chapters': ['Cap. 28 ', 'Cap. 27 '],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/12/Ebony-175x238.jpg',
    },
    {
      'title': 'MookHyang – Dark Lady',
      'score': '4.6',
      'chapters': ['Cap. 88 ', 'Cap. 87 05/01/2021'],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/11/MookHyang-175x238.jpg',
    },
    {
      'title': 'The Great Mage Returns After 4000 Years',
      'score': '4.7',
      'chapters': ['Cap. 67 ', 'Cap. 66 11/01/2021'],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/11/The-Great-Mage-Returns-175x238.jpg',
    },
    {
      'title': 'One Piece [Color Edition]',
      'score': '4.2',
      'chapters': ['Cap. 148 ', 'Cap. 147 16/01/2021'],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/12/01-copia-175x238.jpg',
    },
    {
      'title': 'Chaos Alchemist',
      'score': '4.4',
      'chapters': ['Cap. 20 ', 'Cap. 19 13/01/2021'],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/12/58046-225x300-1-175x238.jpg',
    },
    {
      'title': 'Hunter Age',
      'score': '4.1',
      'chapters': ['Cap. 194 ', 'Cap. 193 '],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/11/Hunter-Age-1-175x238.jpg',
    },
    {
      'title': 'Bringing The Nation’s Husband Home',
      'score': '3.8',
      'chapters': ['Cap. 22 ', 'Cap. 21 '],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/12/images-352-175x238.jpeg',
    },
    {
      'title': 'Give Me a Break, Your Majesty',
      'score': '3.1',
      'chapters': ['Cap. 02 ', 'Cap. 01 31/12/2020'],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/12/f58618144ad1fafc32d9e3a56c3654276de1e2f7.jpg@500w-175x238.jpg',
    },
    {
      'title': 'I’m a Martial Art Villainess, but I’m the Strongest!',
      'score': '4.6',
      'chapters': ['Cap. 07 ', 'Cap. 06 '],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2021/01/Martial-Art-175x238.jpg',
    },
    {
      'title': 'Tomb Raider King',
      'score': '4.7',
      'chapters': ['Cap. 162 ', 'Cap. 161 11/01/2021'],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/11/Tomb-Raider-King-175x238.jpg',
    },
    {
      'title': 'Trash of the Count’s Family',
      'score': '4.8',
      'chapters': ['Cap. 36 ', 'Cap. 35 06/01/2021'],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/11/Trash-of-the-Count-2-175x238.jpg',
    },
    {
      'title': 'Dead Tube +18',
      'score': '4.5',
      'chapters': ['Cap 54.1', 'Cap. 54 '],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/11/Dead-Tube-15-jp-175x238.jpg',
    },
    {
      'title': 'Arcana Fantasy',
      'score': '4.3',
      'chapters': ['Cap. 12 ', 'Cap. 11 09/01/2021'],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/12/Arcana-175x238.jpg',
    },
    {
      'title': 'Lawless Zone',
      'score': '4.3',
      'chapters': ['Cap. 09 ', 'Cap. 08 08/01/2021'],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2020/12/Lawless-Zone-175x238.jpg',
    },
    {
      'title': 'Parallel City',
      'score': '4.5',
      'chapters': ['Cap. 1.4 ', 'Cap. 1.3 14/01/2021'],
      'cape':
          'https://neoxscans.com/wp-content/uploads/2021/01/parallel-city-52198-175x238.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final availableHeight = mediaQuery.size.height - mediaQuery.padding.top;

    return Scaffold(
      body: KeyboardAvoider(
        autoScroll: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: availableHeight * .5,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: theme.primaryColor,
              ),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
              ),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10,
                  ),
                  height: 70,
                  child: TextField(
                    controller: _search,
                    maxLines: 1,
                    cursorColor: theme.primaryColor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 20,
                      ),
                      labelText: 'Pesquise o manga',
                      suffixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ),
                Container(
                  height: availableHeight * .4,
                  child: ListView.builder(
                    itemCount: _mangas.length,
                    itemBuilder: (_, index) {
                      final _manga = _mangas[index];
                      return Container(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          child: Card(
                            elevation: 0,
                            child: Row(
                              children: [
                                GestureDetector(
                                    onTap: () {},
                                    child: CachedNetworkImage(
                                      imageUrl: _manga['cape'],
                                      placeholder: (ctx, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (ctx, url, error) =>
                                          Icon(Icons.error),
                                    )),
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Text(
                                            _manga['title'],
                                            style: theme.textTheme.subtitle2,
                                            maxLines: 3,
                                          ),
                                        ),
                                        SmoothStarRating(
                                          allowHalfRating: false,
                                          starCount: 5,
                                          rating: double.parse(_manga['score']),
                                          size: 20.0,
                                          isReadOnly: true,
                                          defaultIconData: Icons.star_outline,
                                          filledIconData: Icons.star,
                                          halfFilledIconData: Icons.star_half,
                                          color: const Color(0xffffd900),
                                          borderColor: const Color(0xffffd900),
                                          spacing: 0.0,
                                        ),
                                        ...(_manga['chapters'] as List).map(
                                          (chapter) => Text(
                                            (chapter as String).toUpperCase(),
                                            style: theme.textTheme.bodyText2
                                                .copyWith(
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
