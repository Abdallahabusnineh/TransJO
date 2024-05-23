import 'package:flutter/material.dart';
import 'package:transjo/core/utils/tools.dart';
import 'package:transjo/presentation/blocs/routs/routs_bloc.dart';
import 'package:transjo/presentation/screens/all_routes/widgets/search_box.dart';
import 'package:transjo/presentation/screens/routes_details/routes_details_view.dart';

class AllRoutesContent extends StatelessWidget {
  const AllRoutesContent({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<RoutsBloc>();
    var blocListener = context.watch<RoutsBloc>();
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      children: [
        const SearchBox(),
        const VerticalSpacing(2),
        TextWidget(
          text: "Routes",
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
        ),
        const VerticalSpacing(2),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var model = blocListener.searchRouteController.text.isNotEmpty
                ? blocListener.searchRoutes[index]
                : blocListener.routes[index];
            return InkWell(
              onTap: () {
                bloc.add(RoutsGetByIdEvent(model.id));
                navigateTo(
                  context,
                  RoutesDetailsView(
                    route:model,
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: AppColors.myGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      child: TextWidget(
                        text: model.id.toString(),
                        textColor: Colors.white,
                        fontSize: 10.sp,
                      ),
                    ),
                    const HorizontalSpacing(2),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "${model.startName} - ${model.endName}",
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                    const HorizontalSpacing(2),
                    IconButton(
                      onPressed: () {
                        if (model.fav) {
                          bloc.add(RoutesDeleteNewRouteToFavoritesEvent(
                              index, model.id));
                        } else {
                          bloc.add(
                            RoutesAddNewRouteToFavoritesEvent(index, model.id),
                          );
                        }
                      },
                      icon: Icon(
                        model.fav ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const VerticalSpacing(2),
          itemCount: blocListener.searchRouteController.text.isNotEmpty
              ? blocListener.searchRoutes.length
              : bloc.routes.length,
        ),
      ],
    );
  }
}
