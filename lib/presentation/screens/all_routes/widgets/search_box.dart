import 'package:flutter/material.dart';
import 'package:transjo/core/utils/tools.dart';
import 'package:transjo/presentation/blocs/routs/routs_bloc.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<RoutsBloc>();
    return TextFormField(
      controller: bloc.searchRouteController,
      onChanged: (val) {
        bloc.add(RoutsSearchEvent(val));
      },
      decoration: InputDecoration(
        hintText: "Write something ...",
        fillColor: AppColors.myGrey,
        filled: true,
        prefixIcon: Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
