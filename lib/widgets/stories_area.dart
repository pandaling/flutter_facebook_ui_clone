import 'package:flutter/material.dart';
import '../config/palette.dart';
import '../config/palette.dart';
import '../config/palette.dart';
import '../models/models.dart';

class StoriesArea extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const StoriesArea({
    Key key,
    @required this.currentUser,
    @required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: _BuildStoryCard(
                isAddStory: true,
                currentUser: currentUser,
              ),
            );
          }

          final Story story = stories[index - 1];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: _BuildStoryCard(story: story),
          );
        },
      ),
    );
  }
}

class _BuildStoryCard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story story;

  const _BuildStoryCard({
    Key key,
    this.isAddStory = false,
    this.currentUser,
    this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image(
            image: NetworkImage(
              isAddStory ? currentUser.imageUrl : story.imageUrl,
            ),
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory ? Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.add),
              iconSize: 30.0,
              color: Palette.facebookBlue,
              onPressed: () {},
            ),
          ) : CircleAvatar(
            radius: 20.0,
            backgroundColor: Palette.facebookBlue,
            child: CircleAvatar(
              radius: 17.0,
              backgroundColor: Colors.grey[200],
              backgroundImage: NetworkImage(story.user.imageUrl),
            ),
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            isAddStory ? 'Add to Story' : story.user.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}