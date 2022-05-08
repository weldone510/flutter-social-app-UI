import 'package:flutter/material.dart';
import 'package:socialapp/screens/login_screen.dart';
import 'package:socialapp/screens/profile_screen.dart';
import '../data/data.dart';
import '../screens/home_screen.dart';

class CustomDrawer extends StatelessWidget {
  // Widget _buildDrawerOptions(Icon icon, String title) {
  //   return ListTile(
  //     leading: icon,
  //     title: Text(
  //       title, //home , info, contact us.......
  //       style: TextStyle(
  //         fontSize: 18.0,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(
                  currentUser.backgroundImageUrl.toString(),
                ),
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 3.0,
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                            currentUser.profileImageUrl.toString(),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      currentUser.name.toString(),
                      style: TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.0,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          // _buildDrawerOptions(Icon(Icons.dashboard), 'Home'),  // call custom function for listTile
          // _buildDrawerOptions(Icon(Icons.message), 'Chats'),   // call custom function for listTile
          // _buildDrawerOptions(Icon(Icons.location_on), 'Map'), // call custom function for listTile
          // _buildDrawerOptions(Icon(Icons.account_circle), 'Your Profile'), // call custom function for listTile
          // _buildDrawerOptions(Icon(Icons.settings), 'Settings'),  // call custom function for listTile
          // Expanded(
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: _buildDrawerOptions(Icon(Icons.directions_run), 'Logout'), // call custom function for listTile,
          //   ),
          // ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Home',style: TextStyle(fontSize: 18.0),),
            onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen())),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Chats',style: TextStyle(fontSize: 18.0),),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Map',style: TextStyle(fontSize: 18.0),),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Your Profile',style: TextStyle(fontSize: 18.0),),
            onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfileScreen(user:currentUser))),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings',style: TextStyle(fontSize: 18.0),),
            onTap: (){},
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                leading: Icon(Icons.directions_run),
                title: Text('Logout',style: TextStyle(fontSize: 18.0),),
                onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
