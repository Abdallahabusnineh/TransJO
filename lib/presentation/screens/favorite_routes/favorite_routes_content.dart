import 'package:flutter/material.dart';
import 'package:transjo/core/utils/tools.dart';
import 'package:transjo/presentation/blocs/routs/routs_bloc.dart';

class FavoriteRoutesContent extends StatelessWidget {
  const FavoriteRoutesContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<RoutsBloc>();
    print('the route of  ${bloc.favoriteRoutes}');
    return ListView.separated(
      // shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 7.h),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
              AssetImage('assets/images/bus_icon_blue.png'),
              backgroundColor: Colors.white,
            ),
            title: Text(
              "${bloc.favoriteRoutes[index].startName} - ${bloc.favoriteRoutes[index].endName}",
              style: TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              bloc.favoriteRoutes[index].fare.toString(),
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
        itemCount: bloc.favoriteRoutes.length);
  }
}
