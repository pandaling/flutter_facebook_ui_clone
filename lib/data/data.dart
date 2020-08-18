import 'package:flutter_facebook_ui_clone/models/models.dart';

final User currentUser = User(
  name: 'Panda',
  imageUrl:
      'https://i.pinimg.com/236x/dd/ec/4c/ddec4c0de5a1e45d8481056291ae112b.jpg',
);

final List<User> onlineUsers = [
  User(
    name: 'David Brooks',
    imageUrl:
        'https://img.pngio.com/panda-clipart-cute-red-panda-cute-clipart-panda-clipart-black-and-cute-black-and-white-png-640_640.jpg',
  ),
  User(
    name: 'Jane Doe',
    imageUrl:
        'https://www.epicentrofestival.com/wp-content/uploads/2020/01/epicentrofestival-bear-clipart-clipart-panda-free-clipart-images-cute-bear-clipart-1hdaz0mwpk-720x951.jpg',
  ),
  User(
    name: 'Matthew Hinkle',
    imageUrl:
        'https://www.pngitem.com/pimgs/m/107-1079866_bee-clip-art-images-bees-cute-clipart-panda.png',
  ),
  User(
    name: 'Amy Smith',
    imageUrl:
        'https://www.pikpng.com/pngl/m/35-357909_cute-baby-snake-clipart-panda-free-images-horse.png',
  ),
  User(
    name: 'Ed Morris',
    imageUrl:
        'https://www.pngkit.com/png/full/27-279958_cute-fox-clipart-clipart-panda-valentines-fox-clip.png',
  ),
  User(
    name: 'Carolyn Duncan',
    imageUrl:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
];

final List<Story> stories = [
  Story(
    user: onlineUsers[2],
    imageUrl:
        'https://orel.captainamericagifts.com/pic/7831908_full-clipart-panda-safari-party-animal-clipart-free-download-on-clipartmag.jpg',
  ),
  Story(
    user: onlineUsers[0],
    imageUrl:
        'https://www.pngitem.com/pimgs/m/189-1892757_cute-cat-clipart-cute-cat-clipart-clipart-panda.png',
    isViewed: true,
  ),
  Story(
    user: onlineUsers[3],
    imageUrl:
        'https://www.clipartmax.com/png/middle/47-479236_owl-math-clipart-clipart-panda-free-clipart-images-clip-art-owl-cute.png',
  ),
  Story(
    user: onlineUsers[5],
    imageUrl:
        'https://www.pinclipart.com/picdir/middle/21-215917_baby-pluto-clipart-clipart-panda-free-clipart-images.png',
    isViewed: true,
  ),
  Story(
    user: onlineUsers[4],
    imageUrl:
        'https://www.clipartmax.com/png/full/265-2654938_tiger-cute-cartoon-picture-of-clipart-panda-free-images-clip-art.png',
  ),
];

final List<Post> posts = [
  Post(
    user: currentUser,
    caption: 'Check out these cool puppers',
    timeAgo: '58m',
    imageUrl: 'https://orel.captainamericagifts.com/pic/7831908_full-clipart-panda-safari-party-animal-clipart-free-download-on-clipartmag.jpg',
    likes: 1202,
    comments: 184,
    shares: 96,
  ),
  Post(
    user: onlineUsers[5],
    caption:
        'Please enjoy this placeholder text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    timeAgo: '3hr',
    imageUrl: null,
    likes: 683,
    comments: 79,
    shares: 18,
  ),
  Post(
    user: onlineUsers[4],
    caption: 'This is a very good boi.',
    timeAgo: '8hr',
    imageUrl:
        'https://www.pngitem.com/pimgs/m/189-1892757_cute-cat-clipart-cute-cat-clipart-clipart-panda.png',
    likes: 894,
    comments: 201,
    shares: 27,
  ),
  Post(
    user: onlineUsers[3],
    caption: 'Adventure 🏔',
    timeAgo: '15hr',
    imageUrl:
        'https://www.pinclipart.com/picdir/middle/21-215917_baby-pluto-clipart-clipart-panda-free-clipart-images.png',
    likes: 722,
    comments: 183,
    shares: 42,
  ),
  Post(
    user: onlineUsers[0],
    caption:
        'More placeholder text for the soul: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    timeAgo: '1d',
    imageUrl: null,
    likes: 482,
    comments: 37,
    shares: 9,
  ),
  Post(
    user: onlineUsers[2],
    caption: 'A classic.',
    timeAgo: '1d',
    imageUrl:
        'https://www.clipartmax.com/png/full/265-2654938_tiger-cute-cartoon-picture-of-clipart-panda-free-images-clip-art.png',
    likes: 1523,
    shares: 129,
    comments: 301,
  )
];
