import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/providers/category_provider.dart';
import 'package:todo_app_flutter/screen/category/components/category_item.dart';

class CategoriesDisplay extends StatefulWidget {
  const CategoriesDisplay({Key? key}) : super(key: key);

  @override
  _CategoriesDisplayState createState() => _CategoriesDisplayState();
}

class _CategoriesDisplayState extends State<CategoriesDisplay> {
  @override
  Widget build(BuildContext context) {
    CategoryProvider categoryProv = Provider.of<CategoryProvider>(context);

    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: categoryProv.categories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryItem(category: categoryProv.categories[index]);
        });
  }
}
