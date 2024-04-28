import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 450,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/map_image.jpg'))),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: Text(
            'Routes',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.separated(
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
                    icon: Icon(Icons.favorite_border),
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
              itemCount: 10),
        )
      ],
    ));
  }
}
