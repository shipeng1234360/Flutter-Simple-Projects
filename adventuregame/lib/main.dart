import 'package:adventuregame/story_brain.dart';
import 'package:flutter/material.dart';


void main() => runApp(AdventureGame());

class AdventureGame extends StatelessWidget {
  const AdventureGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // we are using the dark theme
      home: StoryPage(),
    );
  }
}

//new storyBrain object from the StoryBrain class.
StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  String story = storyBrain.getStory();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        //Linear Gradient Color for AppBar background
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2B5876),
                Color(0xFF4E4376),
                Color(0xFFB721FF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.5, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),

        title: const Center(
          child: Text('Jeffrey\'\s Adventures',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontFamily: 'Oswaldo',
            fontSize: 25.0,
          ),
        ),
        ),
      ),

      body: Container(
        //Background image for the Container.
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    //Story display in Text Widget.
                    story,
                    textAlign:TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'Slabo',
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    // Choice 1 made by the user
                      setState(() {
                        storyBrain.nextStory(1);
                        story = storyBrain.getStory();
                      });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.red),
                    foregroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white),
                    shape: MaterialStateProperty.resolveWith(
                            (states) => BeveledRectangleBorder()),
                  ),
                  child: Text(
                    //storyBrain to get the text for choice 1.
                    storyBrain.getChoice1(),
                    style: TextStyle(
                      fontSize: 21.0,
                      fontFamily: 'Oswaldo',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  child: Visibility(
                    // Set the visible to false if story number is 3,4,5
                    visible: storyBrain.buttonShouldBeVisible(),
                    child: TextButton(
                      onPressed: () {
                        // Choice 2 made by user
                          setState(() {
                            storyBrain.nextStory(2);
                            story = storyBrain.getStory();
                          });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.blue),
                        foregroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.white),
                        shape: MaterialStateProperty.resolveWith(
                                (states) => BeveledRectangleBorder()),
                      ),
                      child: Text(
                        //storyBrain to get the text for choice 2.
                        storyBrain.getChoice2(),
                        style: TextStyle(
                          fontSize: 21.0,
                          fontFamily: 'Oswaldo',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
