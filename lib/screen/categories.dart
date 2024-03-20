import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widgets/category_grid_item.dart';
import 'package:meals_app/models/meal.dart';

class CategoriesScreen extends StatefulWidget{
  const CategoriesScreen({super.key, required this.onToggleFavorite, required this.availableMeals});
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin {
late AnimationController _animationController;
@override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
      );
    _animationController.forward();
  }

@override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Pick Your Category!"),
        ),
        body: AnimatedBuilder(
          animation: _animationController,
          child: GridView(
            padding: EdgeInsets.all(24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, 
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20 ),
            children: [
              for(int i =0; i<availableCategories.length; i++)
              CategoryGridItem(category: availableCategories[i], onToggleFavorite: widget.onToggleFavorite, availableMeals: widget.availableMeals,),
            ],
          ),
          builder: (context,child) => Padding(
          padding: EdgeInsets.only(
          top: 100 - 100 * _animationController.value
           ), 
           child: child,
           ),         
        ),
      )   ; 
  }
}