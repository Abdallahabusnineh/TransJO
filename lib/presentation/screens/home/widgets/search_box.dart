import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:transjo/core/utils/tools.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: TextFormField(
        controller: TextEditingController(),
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
      ),
    );
  }
}
