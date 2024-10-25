import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key, required this.category});

  Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(category.title),
    );
  }
}