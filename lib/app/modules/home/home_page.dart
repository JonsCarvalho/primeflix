import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primeflix/app/modules/profile/profile_module.dart';
import 'package:primeflix/app/modules/search/search_module.dart';
import 'components/navigation_bar/navigation_bar_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  CarouselController buttonCarouselController = CarouselController();
  int _current = 0;

  @override
  void initState() {
    controller.pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('primeflix', style: GoogleFonts.bebasNeue()),
      ),
      bottomNavigationBar: NavigationBarWidget(),
      body: Observer(
        builder: (_) {
          return PageView(
            controller: controller.pageController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              pageHome(),
              RouterOutlet(module: SearchModule()),
              RouterOutlet(module: ProfileModule()),
            ],
          );
        },
      ),
    );
  }

  pageHome() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Stack(
          children: [
            CarouselSlider(
              items: [
                Container(color: Colors.red),
                Container(color: Colors.cyan),
                Container(color: Colors.purple),
                Container(color: Colors.amber),
                Container(color: Colors.teal),
                Container(color: Colors.yellow),
                Container(color: Colors.blue)
              ],
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: false,
                  viewportFraction: 1,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [0, 1, 2, 3, 4, 5, 6].map((position) {
                  int index = position;
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _current == index ? Colors.white : Colors.grey[400],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        horizontalListMovies(title: 'Filmes mais populares'),
        horizontalListMovies(title: 'Ação e aventura'),
        horizontalListMovies(title: 'Filmes da Marvel'),
        horizontalListMovies(title: 'Filmes mais populares'),
      ],
    );
  }

  horizontalListMovies({@required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.3,
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
