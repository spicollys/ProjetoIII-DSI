import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:setup_wizard/app/controllers/game_genre_controller.dart';
import 'package:setup_wizard/app/models/argument.dart';
import 'constants.dart';

class GenreOptionGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 2.5,
      children:
      List.generate(GameGenreController.instance.getOptionList().length, (index) {
        Argument _localArgument =
        Argument(arguments: GameGenreController.instance.filterOption(index));
        return Padding(
          padding: EdgeInsets.all(5),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            color: Constants.blueGrey600,
            onPressed: () => Navigator.pushNamed(
                context, '/gameListPaginationGenrePage',
                arguments: _localArgument),
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                GameGenreController.instance.getOptionList()[index],
                style: GoogleFonts.lato(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}