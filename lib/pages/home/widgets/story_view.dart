import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoryViewAdvertising extends StatelessWidget {
  final List<String> stories = [
    'Story 1',
    'Story 2',
    'Story 3',
    // Qo'shmoqchi bo'lgan hikoyalarni shu yerga qo'shing
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.primaries[index % Colors.primaries.length],
            child: Center(
              child: Text(
                stories[index],
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}

