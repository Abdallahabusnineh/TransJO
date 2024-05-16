import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transjo/core/utils/tools.dart';
import 'package:transjo/presentation/blocs/maps/maps_bloc.dart';
import 'package:transjo/presentation/blocs/routs/routs_bloc.dart';
import 'package:transjo/presentation/screens/maps/map_builder.dart';
import 'package:transjo/presentation/screens/routes_details/routes_details_view.dart';

import 'widgets/search_box.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<MapsBloc>();
    var routeBloc = context.read<RoutsBloc>();
    var routeBlocListener = context.watch<RoutsBloc>();
    return Stack(
      children: [
        Container(
          height: 50.h,
          width: double.infinity,
          // margin: EdgeInsets.only(top: 15.h),
          decoration: const BoxDecoration(
            color: AppColors.myGrey,
          ),
          child: MapBuilder(
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              bloc.setterNewGoogleController = controller;
            },
          ),
        ),
        Column(children: [
          // const VerticalSpacing(4),
          // const SearchBox(),
          const Spacer(),
          Container(
            height: 50.h,
            width: 100.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                shrinkWrap: true,
                children: [
                  Row(
                    children: [
                      TextWidget(
                        text: "Routs",
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                      const Spacer(),
                      CustomTextButtons(
                        onPressed: () {
                          // navigateTo(context, const BusRoutsView());
                        },
                        text: "All routs",
                      )
                    ],
                  ),
                  const VerticalSpacing(1),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 1.h),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            navigateTo(
                                context,
                                RoutesDetailsView(
                                  route: routeBloc.routes[index],
                                ));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w, vertical: 1.h),
                            decoration: BoxDecoration(
                              color: AppColors.myGrey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.w, vertical: 1.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red,
                                  ),
                                  child: TextWidget(
                                    text: routeBloc.routes[index].id.toString(),
                                    textColor: Colors.white,
                                    fontSize: 10.sp,
                                  ),
                                ),
                                const HorizontalSpacing(2),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text:
                                            "${routeBloc.routes[index].startName} - ${routeBloc.routes[index].end}",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const VerticalSpacing(1.5),
                      itemCount: routeBlocListener.routes.length)
                ],
              ),
            ),
          ),
          const VerticalSpacing(2),
        ]),
      ],
    );
  }
}
