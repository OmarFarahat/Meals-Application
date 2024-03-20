import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_grid_item.dart';
class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals, required this.name, required this.onToggleFavorite, required this.screenindex});
 

  final String title;
  final String name;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;
  final int screenindex;




  @override
Widget build(BuildContext context) {
  List<Meal> mealsToShow = [];
  if (screenindex == 1) {
    mealsToShow = meals;
  } else {
    //  mealsToShow = dummyMeals.where((meal) => meal.categories.contains(title)).toList();
         mealsToShow = meals.where((meal) => meal.categories.contains(title)).toList();

  }
    print(mealsToShow);

     return Scaffold(
       appBar: AppBar(
         title: Text(name),
                  
       ),
       body: ListView(     
        children: [   
         if(mealsToShow.isEmpty)
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
             children: [Text("Nothing To Show Here!", style: Theme.of(context).textTheme.titleLarge!.copyWith(
               color: Theme.of(context).colorScheme.onBackground,
               fontWeight: FontWeight.bold,
               
             ),),
        ]),
        for(int i=0; i<mealsToShow.length;i++)
           MealGridItem(meal: mealsToShow[i], onToggleFavorite: onToggleFavorite,),        
        ],
       
       ),
     );
   }

  }