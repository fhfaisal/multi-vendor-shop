import 'package:flutter/material.dart';
import 'package:multivendor_store/views/buyers/nav_screens/widgets/bannar_widget.dart';
import 'package:multivendor_store/views/buyers/nav_screens/widgets/category_text.dart';
import 'package:multivendor_store/views/buyers/nav_screens/widgets/search_input_widget.dart';
import 'package:multivendor_store/views/buyers/nav_screens/widgets/welcome_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .02),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            WelcomeText(),
            SizedBox(
              height: 10,
            ),
            SearchInputWidget(),
            SizedBox(
              height: 10,
            ),
            BannerWidget(),
            CategoryTextWidget(),
          ],
        ),
      ),
    );
  }
}
