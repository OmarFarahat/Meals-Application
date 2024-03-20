import 'package:flutter/material.dart';
import 'package:meals_app/widgets/single_meal_item.dart';

import '../models/meal.dart';

class MealDetail extends StatelessWidget{
  const MealDetail({super.key, required this.meal, required this.onToggleFavorite});
  
  final void Function(Meal meal) onToggleFavorite;
  final Meal meal;
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: (){
            onToggleFavorite(meal);
          }, icon: Icon(Icons.star)
          )
        ],
      ),
      body: SingleMealItem(meal: meal),
    )   ; 
  }
  }
