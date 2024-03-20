import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screen/categories.dart';
import 'package:meals_app/screen/fliters_screen.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widgets/drawer_item.dart';

class TabScreen extends StatefulWidget{
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreen();
}

class _TabScreen extends State<TabScreen>{

int _selectedPageIndex = 0;
void _selectPage(int index){
  setState(() {
    _selectedPageIndex = index;// bottomnavigationbar beyraga3 index el icon el dost 3aleh
  });
}
void showSnackBar(String message){
  ScaffoldMessenger.of(context).clearSnackBars();
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message)));
}

 final List<Meal> favoriteMeals = [];
  Map<Filter,bool>?_selectedfilters = {
   Filter.glutenFree:false,
   Filter.lactoseFree:false,
   Filter.vegan:false,
   Filter.vegetarian:false 
 };

 void selectScreen (String Identifier) async{
      Navigator.of(context).pop();

  if(Identifier=="filters") {
   final result= await Navigator.of(context).push<Map<Filter,bool>>(MaterialPageRoute(builder: (context) =>  FiltersScreen(currentvalue: _selectedfilters!,)));
  setState(() {
    _selectedfilters= result;
    print(result);
  }); 
  }
 
  }
    void _addFavorite(Meal meal){
      if(favoriteMeals.contains(meal)){
       setState(() {
         favoriteMeals.remove(meal);
         showSnackBar(" removed from favorites");

       }); 
      }
      else{
        setState(() {
          favoriteMeals.add(meal);
           showSnackBar(" added to favorites");      
        });      
      }
    }

  @override
  Widget build(BuildContext context) {
    final List<Meal> availableMeals = dummyMeals.where((meal) {
   if(_selectedfilters![Filter.glutenFree]! && !meal.isGlutenFree){
      return false;
    }
  if(_selectedfilters![Filter.lactoseFree]! && !meal.isLactoseFree){
      return false;
    }
  if(_selectedfilters![Filter.vegan]! && !meal.isVegan){
      return false;
    }
if(_selectedfilters![Filter.vegetarian]! && !meal.isVegetarian){
      return false;
    }
    return true;
  }).toList();
  print(availableMeals);
    var activepagetitle='Categories';
    Widget activepage = CategoriesScreen(onToggleFavorite: _addFavorite, availableMeals: availableMeals,);
    if(_selectedPageIndex == 1){
      activepagetitle = 'Favorites';
      activepage = MealsScreen(title: 'favorites', meals: favoriteMeals, name: '',onToggleFavorite: _addFavorite, screenindex: 1);

    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activepagetitle),
      ),
      body: activepage,
      drawer: DrawerItem(onSelectScreen: selectScreen,),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
      ),
    );
  }
}