import 'package:flutter/material.dart';
import 'package:local_event/appstate.dart';
import 'package:local_event/style_guide.dart';
import 'package:provider/provider.dart';
import '../../model/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryId == category.categoryId;
    return GestureDetector(
      onTap: (){
        if(!isSelected){
          appState.updateCategoryId(category.categoryId);
        }
      },
      child: Container(
        margin: const  EdgeInsets.symmetric(horizontal: 8),
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.white:const Color(0x99ffffff),width: 3),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: isSelected? Colors.white:Colors.transparent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(category.icon, color: isSelected?Theme.of(context).primaryColor:Colors.white, size: 40,),
            const SizedBox(height: 10,),
            Text(category.name,style: isSelected ? selectedCategoryTextStyle : categoryTextStyle,)
          ],
        ),
      ),
    );
  }
}
