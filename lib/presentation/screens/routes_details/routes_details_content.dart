import 'package:flutter/material.dart';
import 'package:transjo/core/utils/tools.dart';
import 'package:transjo/domain/entites/routs.dart';

import 'widgets/route_details_map.dart';

class RoutesDetailsContent extends StatelessWidget {
  const RoutesDetailsContent({super.key, required this.route});
  final Routs route;
  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
        const RouteDetailsMap(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: "# ${route.id}",
                fontWeight: FontWeight.w900,
                fontSize: 20.sp,
              ),
              const VerticalSpacing(2),
              Row(
                children: [
                  TextWidget(
                    text: "Route Name:",
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.primary,
                    fontSize: 14.sp,
                  ),
                  const HorizontalSpacing(2),
                  TextWidget(
                    text: "${route.startName} - ${route.end}",
                    fontSize: 14.sp,
                  ),
                ],
              ),
              const VerticalSpacing(2),
              Row(
                children: [
                  TextWidget(
                    text: "Price:",
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.primary,
                    fontSize: 14.sp,
                  ),
                  const HorizontalSpacing(2),
                  TextWidget(
                    text: "${route.fare} JD",
                    fontSize: 14.sp,
                  ),
                ],
              ),
              const VerticalSpacing(2),
              Row(
                children: [
                  TextWidget(
                    text: "Estimation:",
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.primary,
                    fontSize: 14.sp,
                  ),
                  const HorizontalSpacing(2),
                  TextWidget(
                    text: "10 min",
                    fontSize: 14.sp,
                  ),
                ],
              ),
              const VerticalSpacing(2),
              TextWidget(
                text: "Stop Points",
                fontSize: 14.sp,
                fontWeight: FontWeight.w900,
              ),
              const VerticalSpacing(1),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3.w, vertical: 1.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.myGrey,
                      ),
                      child: Center(
                        child: TextWidget(
                          text: route.stopPoints[index].stopName,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const VerticalSpacing(2),
                  itemCount: route.stopPoints.length),
            ],
          ),
        )
      ],
    );
  }
}
