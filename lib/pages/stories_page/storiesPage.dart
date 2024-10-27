import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';

class StoriesPage extends StatelessWidget {
   StoriesPage({super.key});

  final storyController = StoryController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: StoryView(
          storyItems: [
            StoryItem.inlineImage(url: 'assets/images/app_logo.png', controller: storyController)
          ],
          controller: storyController,
          repeat: true,
          onComplete: () {},
          onVerticalSwipeComplete: (direction) {
            if (direction == Direction.down) {
              Navigator.pop(context);
            }
          }),
    );
  }
}
