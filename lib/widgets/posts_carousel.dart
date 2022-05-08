import 'package:flutter/material.dart';

import '../data/data.dart';

import '../models/post_model.dart';

class PostsCarousel extends StatefulWidget {
  final PageController? pageController;

  // final String? title;
  // final List? posts;

  PostsCarousel({this.pageController}); //constructor

  @override
  _PostsCarouselState createState() => _PostsCarouselState();
}

class _PostsCarouselState extends State<PostsCarousel> {
  //custom Widget of Carousel
  Widget _buildCarousel(BuildContext context, Post posts) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            // color: Colors.deepOrange,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image(
              image: AssetImage(posts.imageUrl.toString()),
              height: 350.0,
              width: 300.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 10.0,
          right: 10.0,
          left: 10.0,
          child: Container(
            height: 110.0,
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0,),
                  bottomRight: Radius.circular(15.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(posts.title.toString(),style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,),),
                SizedBox(height: 5.0,),
                Text(posts.location.toString(),style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w500,),),
                SizedBox(height: 5.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite,color: Colors.red,),
                        SizedBox(width: 4.0,),
                        Text(posts.likes.toString(),),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.message,color:Theme.of(context).primaryColor,),
                        SizedBox(width: 4.0,),
                        Text(posts.comments.toString(),),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          child: Text(
            "Posts",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
        ),
        Container(
          height: 350,
          child: PageView.builder(
            controller: widget.pageController,
            // I have use widget bcz i created a statefull widget
            itemCount: posts.length,
            // import data
            itemBuilder: (BuildContext context, int index) {
              Post post = posts[index]; // type Post and objec is post
              return _buildCarousel(context, post);
            },
          ),
        ),
      ],
    );
  }
}
