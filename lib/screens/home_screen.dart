import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:socialapp/data/data.dart';
// import 'package:socialapp/models/user_model.dart';
import 'package:socialapp/widgets/following_users.dart';

import '../data/data.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? _myController;
  PageController? _pageController;

  @override
  void initState() {
    _myController = TabController(
      length: 2,
      vsync: this,
    );

    _pageController = PageController(initialPage: 0,viewportFraction: 0.8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // status bar Color is white
          // Status bar color
          statusBarColor: Colors.white,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          'FRENZY',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
            letterSpacing: 7.0,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontSize: 17.0),
          indicatorWeight: 3.0,
          tabs: [
            Tab(
              text: "Trending",
            ),
            Tab(
              text: "Latest",
            ),
          ],
          controller: _myController,
        ),
      ),
      drawer: CustomDrawer(),  // call custom drawer
      body: ListView(
        children: [
          FollowingUser(), // call custom Widget
          PostsCarousel(
            pageController: _pageController,
            // title: 'Posts',
            // posts: posts,   // posts of array(import library of data)
          ),
        ],
      ),
    );
  }
}
