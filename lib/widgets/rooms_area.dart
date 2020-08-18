import 'package:flutter/material.dart';
import '../config/palette.dart';
import '../models/models.dart';

class RoomsArea extends StatelessWidget {
  final List<User> onlineUsers;

  const RoomsArea({
    Key key,
    @required this.onlineUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: OutlineButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.white,
                borderSide: BorderSide(
                  width: 3.0,
                  color: Colors.blueAccent[100],
                ),
                textColor: Palette.facebookBlue,
                child: Row(
                  children: <Widget>[
                    ShaderMask(
                      shaderCallback: (rect) => Palette.createRoomGradient.createShader(rect),
                      child: Icon(
                        Icons.video_call,
                        size: 35.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      'Create\nRoom'
                    )
                  ],
                ),
              ),
            );
          }

          final User user = onlineUsers[index - 1];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: NetworkImage(user.imageUrl),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: Container(
                    height: 15.0,
                    width: 15.0,
                    decoration: BoxDecoration(
                      color: Palette.online,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2.0,
                        color: Colors.white
                      )
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}