import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/data/data.dart';
import 'package:socialapp/widgets/custom_drawer.dart';

import '../data/data.dart';
import '../models/user_model.dart';
import '../widgets/profile_clipper.dart';
import '../widgets/your_posts_&_favourite_carousels.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen({required this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scoffoldState = GlobalKey<ScaffoldState>();

  PageController? _yourPostPageController;
  PageController? _favouritePostPageController;

  @override
  void initState() {
    super.initState();
    _yourPostPageController = PageController(initialPage: 0,viewportFraction: 0.8);
    _favouritePostPageController = PageController(initialPage: 0,viewportFraction: 0.8);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scoffoldState,
      // key is to used to open the drawer by accessing the scoffoldState
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    image: AssetImage(widget.user.backgroundImageUrl.toString()),
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: IconButton(
                    onPressed: () => _scoffoldState.currentState?.openDrawer(),
                    icon: Icon(Icons.menu),
                    iconSize: 30.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                      height: 110.0,
                      width: 110.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                        image: DecorationImage(
                          image:
                              AssetImage(widget.user.profileImageUrl.toString()),
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.user.name.toString(),
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Following',
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                    Text(
                      widget.user.following.toString(),
                      style:
                          TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Followers',
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                    Text(
                      widget.user.followers.toString(),
                      style:
                          TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            YourPostsAndFavouriteCarousel(pageController:_yourPostPageController,title:"Your Posts",posts:widget.user.posts),
            YourPostsAndFavouriteCarousel(pageController:_favouritePostPageController,title:"Favorites",posts:widget.user.favorites),
            SizedBox(height: 50.0,),
          ],
        ),
      ),
    );
  }
}
