import 'package:flutter/material.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/utils/constants.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.category,
    @required this.onTap,
  }) : super(key: key);

  final Category category;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          image: DecorationImage(
            image: NetworkImage(category.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.black54,
          ),
          child: Text(
            category.name,
            textAlign: TextAlign.center,
            style: headline3.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
