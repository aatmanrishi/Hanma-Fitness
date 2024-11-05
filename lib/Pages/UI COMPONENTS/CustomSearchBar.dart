import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20, right: 20),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Exercise, Target Muscles and Equipment',
        hintMaxLines: 2,
        hintStyle: TextStyle(color: Colors.grey[400]),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(Icons.search_rounded),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
