import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screen/meal_detail.dart';
import 'package:transparent_image/transparent_image.dart';

class MealGridItem extends StatelessWidget{
  const MealGridItem({super.key, required this.meal, required this.onToggleFavorite});
  
  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;


@override
  Widget build(BuildContext context) {
    return 
       InkWell(
         onTap: () {
           Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MealDetail(meal: meal, onToggleFavorite: onToggleFavorite,),
          ),
        );
         },
         splashColor: Theme.of(context).primaryColor,
         child: Card(
          margin: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          clipBehavior: Clip.hardEdge,
          elevation: 2,
          child: Stack(
            children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage), 
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,),
                Positioned( 
                bottom:0,
                left:0,
                right: 0,
                 child: Container(
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Text(meal.title, 
                      style: TextStyle(fontSize: 24, 
                    color: Colors.white,
                    fontWeight:FontWeight.bold), 
                    textAlign: TextAlign.center,),
                    SizedBox(height: 12),
                    Row(
                      children: [

                      SizedBox(width: 40),
                        Icon(Icons.schedule, size: 20,),
                        SizedBox(width: 5,),  
                        Text(meal.duration.toString(), style: TextStyle(fontSize: 13, color: Colors.white),),


                        SizedBox(width: 80),
                        Icon(Icons.work, size: 20,),
                        SizedBox(width: 7,),  
                        Text(meal.complexity.name.toUpperCase(), style: TextStyle(fontSize: 10, color: Colors.white),),

                        SizedBox(width: 45,),
                        Icon(Icons.currency_pound_rounded, size: 15,),
                        SizedBox(width: 7,),  
                        Text(meal.affordability.name.toUpperCase(), style: TextStyle(fontSize: 10, color: Colors.white),),


                      ],
                    )
                    ],
                  ),
                
                ))
            ],
          ),
               ),
       );
    
  }
}


  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       gradient: LinearGradient(
  //         colors: [Theme.of(context).primaryColor.withOpacity(0.5,), 
  //         Theme.of(context).primaryColor.withOpacity(0.9)]
  //         ),
  //         ),
  //         child: Column(
  //           children: [
  //             Row(
  //               children: [
  //                 Text(meal.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),
  //                 ),
  //                 Text(meal.affordability.name, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),
  //                 ),
  //                 Text(meal.complexity.name, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),
  //                 ),  ],
                    
  //             ),
  //             Image.network(meal.imageUrl),
  //             Column(
  //               children: [
  //                 ListView.builder(
  //                   itemCount: meal.ingredients.length,
  //                   itemBuilder: (context, index){
  //                     return ListTile(
  //                       leading: Text('${index+1}'),
  //                       title: Text(meal.ingredients[index], style: TextStyle(color: Theme.of(context).colorScheme.onBackground),), 
  //                     );
  //                   },
                    
  //                 ),
  //                 ListView.builder(
  //                   itemCount: meal.steps.length,
  //                   itemBuilder: (context, index){
  //                     return ListTile(
  //                       leading: Text('${index+1}'),
  //                       title: Text(meal.steps[index], style: TextStyle(color: Theme.of(context).colorScheme.onBackground),), 
  //                     );
  //                   },
                    
  //                 )
  //               ],
              
  //             )
  //           ],
  //         ),
      
  //     );
    
  // }
  