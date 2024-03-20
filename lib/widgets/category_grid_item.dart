import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screen/meals.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoryGridItem extends StatelessWidget{
  const CategoryGridItem({super.key, required this.category, required this.onToggleFavorite, required this.availableMeals});

final Category category;
final void Function(Meal meal) onToggleFavorite;
final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MealsScreen(title: category.id, meals: availableMeals, name: category.title, onToggleFavorite: onToggleFavorite, screenindex: 0,),
          ),
        );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration:  BoxDecoration(  
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
           category.color.withOpacity(0.55),         
           category.color.withOpacity(0.9)
           ],
           begin: Alignment.topLeft,
           end: Alignment.bottomRight)
        ),
        child: Text(category.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground
        ),),
      ),
    );
  }
}