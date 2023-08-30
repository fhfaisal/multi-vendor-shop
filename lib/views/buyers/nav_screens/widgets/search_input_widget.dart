
import 'package:flutter/material.dart';

class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: TextField(
        decoration: InputDecoration(
            fillColor: Colors.blue.withOpacity(0.1),
            filled: true,
            hintText: 'Search Product',
            border: OutlineInputBorder(
                borderSide: BorderSide.none
            ),
            prefixIcon: Icon(Icons.search_outlined)
        ),
      ),
    );
  }
}