import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui_clone/config/palette.dart';
import 'package:flutter_facebook_ui_clone/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../config/palette.dart';
import '../data/data.dart';
import '../models/models.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(
                icon: Icons.search,
                iconSize: 30.0,
                onPressed: () {}
              ),
              CircleButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: 30.0,
                onPressed: () {}
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage(currentUser.imageUrl),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration.collapsed(hintText: 'What\s on your mind?'),
                        ),
                      )
                    ],
                  ),
                  Divider(height: 10.0, thickness: 0.5,),
                  Container(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.videocam,
                            color: Colors.red,
                          ),
                          label: Text('Live'),
                        ),
                        VerticalDivider(width: 8.0),
                        FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.photo_library,
                            color: Colors.green,
                          ),
                          label: Text('Photo'),
                        ),
                        VerticalDivider(width: 8.0),
                        FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.video_call,
                            color: Colors.purpleAccent,
                          ),
                          label: Text('Room'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: RoomsArea(onlineUsers: onlineUsers),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: StoriesArea(
                currentUser: currentUser,
                stories: stories,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final Post post = posts[index];
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                padding: EdgeInsets.symmetric(vertical: 8.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          _PostHeader(post: post),
                          SizedBox(height: 4.0),
                          Text(post.caption),
                          post.imageUrl != null ? SizedBox.shrink() : SizedBox(height: 6.0),
                        ],
                      ),
                    ),
                    post.imageUrl != null
                      ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Image(
                          image: NetworkImage(
                            post.imageUrl,
                          ),
                        ),
                      )
                      : SizedBox.shrink(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: _PostState(post: post),
                    )
                  ],
                )
              );
            },
            childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 17.0,
          backgroundColor: Colors.grey[200],
          backgroundImage: NetworkImage(post.user.imageUrl),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                post.user.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0
                    )
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  ),
                ],
              )
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.more_horiz),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _PostState extends StatelessWidget {
  final Post post;

  const _PostState({
    Key key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              )
            ),
            SizedBox(width: 4.0),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(width: 8.0),
            Text(
              '${post.shares} Shares',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: <Widget>[
            _buildActionButton(
              'Like',
              Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 25.0,
              ),
            ),
            _buildActionButton(
              'Comment',
              Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 25.0,
              ),
            ),
            _buildActionButton(
              'Share',
              Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 25.0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(String label, Icon icon) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 25.0,
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                icon,
                SizedBox(width: 4.0),
                Text(
                  label,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}