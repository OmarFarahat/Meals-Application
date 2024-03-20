import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';
import '../models/meal.dart';


class SingleMealItem extends StatelessWidget{
  const SingleMealItem({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [
            Positioned(
              height: 0,
              width: double.infinity,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: meal.imageUrl,
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 10),
            Text("Ingredients", style: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            SizedBox(height: 10),
            for(final ingredient in meal.ingredients)
              Text(ingredient , style: TextStyle(fontSize: 12,color: Colors.white),textAlign: TextAlign.left, ),

            SizedBox(height: 10),
            Text("Steps", style: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            SizedBox(height: 10),
            for(final steps in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5), 
                child: Text(steps , style: TextStyle(fontSize: 12,color: Colors.white),textAlign: TextAlign.center,),
              ),
            
          ],
        ),
    );
   
     
    
  }
}