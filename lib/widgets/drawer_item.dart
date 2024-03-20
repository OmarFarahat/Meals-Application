import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget{
  const DrawerItem({super.key, required this.onSelectScreen});

  final void Function(String Identifier) onSelectScreen;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors:[
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0.8)
              ], 
              begin: Alignment.topLeft, 
              end: Alignment.bottomRight
              
              )
            ),
            child: Row( 
              children: [
                Icon(Icons.fastfood, size: 48, color: Theme.of(context).colorScheme.onPrimary,),
                const SizedBox(width: 18,),
                Text("Cooking Up!", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.bold

                ),)
              ],

            ),
            ),
            ListTile(
              leading: Icon(Icons.restaurant, size: 26, color: Theme.of(context).colorScheme.onPrimary,),
              title: Text("Meals", style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.white.withOpacity(0.8),
                fontSize: 24
              ),
              ),
              onTap: (){
                onSelectScreen("meals");
              },
            ),
             ListTile(
              leading: Icon(Icons.restaurant, size: 26, color: Theme.of(context).colorScheme.onPrimary,),
              title: Text("Filters", style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.white.withOpacity(0.8),
                fontSize: 24
              ),
              ),
              onTap: (){
                onSelectScreen("filters");
              },
            )
        ],
      ),
    );
  }
}