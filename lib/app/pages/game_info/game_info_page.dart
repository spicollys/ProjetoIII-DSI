import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:setup_wizard/app/components/custom_container_text.dart';
import 'package:setup_wizard/app/components/custom_gradient_container.dart';
import 'package:setup_wizard/app/controllers/expandable_text_conroller.dart';
import 'package:setup_wizard/app/controllers/game_info_controller.dart';
import 'package:setup_wizard/app/models/argument.dart';

class GameInfoPage extends StatefulWidget {
  const GameInfoPage({Key key}) : super(key: key);

  @override
  _GameInfoPageState createState() => _GameInfoPageState();
}

class _GameInfoPageState extends State<GameInfoPage> {
  _GameInfoPageState();
  bool isFavorite = false;
  Color colors = Colors.white;

  @override
  Widget build(BuildContext context) {
    final Argument _receivedArgument =
        ModalRoute.of(context).settings.arguments;
    final DocumentSnapshot document = _receivedArgument.arguments[0];
    final List<String> listOfInfo =
        GameInfoController.instance.listOfInfoValidation(document: document);
    return Scaffold(
      appBar: AppBar(
          title: Text("${document['queryName']}"),
          leading: Icon(Icons.videogame_asset)),
      body: CustomGradientContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Image.network("${document['headerImage']}")
              Container(
                constraints: BoxConstraints.expand(
                  height: 200.0,
                ),
                padding: EdgeInsets.symmetric(),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("${document['headerImage']}"),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      right: 10.0,
                      bottom: 10.0,
                      child: Icon(
                        Icons.favorite_rounded,
                        size: 50,
                        color: colors,
                      ),
                    )
                  ],
                ),
              ),
              CustomContainerText(
                child: Text(
                  "Minimum Specifications:\n\n"
                  "Graphic: ${listOfInfo[0]}\n"
                  "Processor: ${listOfInfo[1]}\n"
                  "Memory: ${listOfInfo[2]}\n"
                  "Others Requirements: ${listOfInfo[3]}\n\n\n"
                  "Recomended Specifications: \n\n"
                  "Graphic: ${listOfInfo[4]}\n"
                  "Processor: ${listOfInfo[5]}\n"
                  "Memory: ${listOfInfo[6]}\n"
                  "Others Requirements: ${listOfInfo[7]}",
                ),
              ),
              CustomContainerText(
                child: ExpandableText(
                  document['aboutText'],
                  trimLines: 3,
                ),
              ),
              CustomContainerText(
                child: Text(
                    "Supported languages: ${document['supportedLanguages']}"),
              ),
              CustomContainerText(
                child: Text("Release Date: ${document['releaseDate']}"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
