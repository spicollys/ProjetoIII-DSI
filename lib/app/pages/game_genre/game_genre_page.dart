import 'package:flutter/material.dart';
import 'package:setup_wizard/app/components/constants.dart';
import 'package:setup_wizard/app/components/general_option_grid.dart';
import 'package:setup_wizard/app/components/general_header_button.dart';
import 'package:setup_wizard/app/controllers/game_genre_controller.dart';

class GameGenrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.blueGrey100,
        title: Text("Game Genres"),
        leading: Icon(Icons.videogame_asset),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            GeneralHeaderButton(title: 'All games', route: '/gameListPage'),
            GeneralOptionGrid(
              controllerInstance: GameGenreController.instance,
            ),
          ],
        ),
      ),
    );
  }
}
