import 'package:flutter/material.dart';
import 'package:newstragram/data/category_info.dart';

class CategoryChip extends StatefulWidget {
  const CategoryChip({Key? key}) : super(key: key);

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  var value = 0;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List<Widget>.generate(categories.length, (int index) {
        return ChoiceChip(
          label: Text(categories[index].nameJp),
          selected: value == index,
          onSelected: (bool isSelected) {
            setState(() {
              value = isSelected ? index : 0;
            });
          },
        );
      })
    );
  }
}
