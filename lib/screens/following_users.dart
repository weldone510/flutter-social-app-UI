import 'package:flutter/material.dart';

import '../data/data.dart';
import '../models/user_model.dart';

class FollowingUser extends StatefulWidget {
  const FollowingUser({Key? key}) : super(key: key);

  @override
  _FollowingUserState createState() => _FollowingUserState();
}

class _FollowingUserState extends State<FollowingUser> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          child: Text(
            "Following",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
        ),
        Container(
          height: 90.0,
          // decoration: BoxDecoration(
          //   color: Colors.blue,
          // ),
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: users.length,
            itemBuilder: (BuildContext context,int index){
              User user = users[index];
              return Container(
                margin: EdgeInsets.all(10.0),
                height: 70.0,
                width: 70.0,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0,3),
                      blurRadius: 6.0,
                    ),
                  ],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2.0,
                  ),
                ),
                child: ClipOval(
                  child: Image(
                    image: AssetImage(user.profileImageUrl.toString()),
                    height: 70.0,
                    width: 70.0,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
