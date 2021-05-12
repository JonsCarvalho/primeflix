import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'profile_controller.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({Key key, this.title = "Profile"}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ModularState<ProfilePage, ProfileController> {
  //use 'controller' variable to access controller

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Center(
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    LineAwesomeIcons.user,
                    size: 80,
                  ),
                ),
              ),
            ),
          ),
          Observer(builder: (_) {
            if (controller.homeController.user == null) {
              return Center(child: CircularProgressIndicator());
            }
            print(date.toString());
            return Column(
              children: [
                Text(
                  controller.homeController.user?.name,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.3,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'E-mail: ' + controller.homeController.user?.email,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.white,
                              letterSpacing: 1.3,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            controller.homeController.user?.totalTime
                                        .toString() ==
                                    'null'
                                ? 'Tempo de tela: Nenhum filme assistido'
                                : 'Tempo de tela: ' +
                                    controller.homeController.user?.totalTime
                                        .toString() +
                                    ' minutos',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.white,
                              letterSpacing: 1.3,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            date.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.white,
                              letterSpacing: 1.3,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    horizontalListMovies(title: 'Assistir mais tarde'),
                    horizontalListMovies(title: 'Filmes favoritos'),
                  ],
                ),
              ],
            );
          }),
        ],
      ),
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
            height: 130,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: controller.homeController.listMovies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var movies = controller.homeController.listMovies;

                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 16.0 : 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(movies[index].image),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 170,
                        child: Text(
                          movies[index].name,
                          style: GoogleFonts.poppins(
                              color: Colors.grey, fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
