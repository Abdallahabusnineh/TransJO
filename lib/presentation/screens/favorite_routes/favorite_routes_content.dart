import 'package:flutter/material.dart';

class FavoriteRoutesContent extends StatelessWidget {
  const FavoriteRoutesContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      // shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
              AssetImage('assets/images/bus_icon_blue.png'),
              backgroundColor: Colors.white,
            ),
            title: Text(
              'Zarqa complex to Hashemite university',
              style: TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Description',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: IconButton(
              icon: Icon(Icons.favorite),
              color: Colors.red.shade700,
              onPressed: (){
                //add this route to favorite routes
              },
            ),
            onTap: () {
              // when user click on this route navigate to Routes details
              // navigateTo(context, OnBoardingScreen());
            },
          );
        },
        separatorBuilder: (Context, i) {
          return Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey,
          );
        },
        itemCount: 25);
  }
}
