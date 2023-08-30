import 'package:flutter/material.dart';
import 'package:multivendor_store/widget_setting/color_collections.dart';

class CategoryTextWidget extends StatelessWidget {
  final List<String> _categoryLabel = [
    'Laptop',
    'Phone',
    'Accessories',
    'Television'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          height: 40,
          child: Row(
            children: [
              Expanded(
                  child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categoryLabel.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ActionChip(
                      onPressed: (){},
                      backgroundColor: secondaryColorWithOpacity,
                        label: Text(
                      _categoryLabel[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    )),
                  );
                },
              )),
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
            ],
          ),
        )
      ],
    );
  }
}
