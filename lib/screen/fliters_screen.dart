import 'package:flutter/material.dart';

enum Filter{
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian
}

class FiltersScreen extends StatefulWidget{
  const FiltersScreen ({super.key, required this.currentvalue});

  final Map<Filter,bool> currentvalue;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen>{
var _gluternFreeState=false;
var _lactoseFreeState=false;
var _veganFreeState=false;
var _vegetarianFreeState=false;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
      _gluternFreeState=widget.currentvalue[Filter.glutenFree]!;
      _lactoseFreeState=widget.currentvalue[Filter.lactoseFree]!;
      _veganFreeState=widget.currentvalue[Filter.vegan]!;
      _vegetarianFreeState=widget.currentvalue[Filter.vegetarian]!;
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if(didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _gluternFreeState,
            Filter.lactoseFree: _lactoseFreeState,
            Filter.vegan: _veganFreeState,
            Filter.vegetarian: _vegetarianFreeState

          });
          
        },
        child: Column(
          children: [
            SwitchListTile(value: _gluternFreeState, 
            onChanged: (isChecked){
              setState(() {
                _gluternFreeState=isChecked;
              });
            },
            title: Text("Gluten-free", style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white.withOpacity(0.8)
            ),
            ),
            subtitle: Text("Only include Gluten-free meals", style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
            ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(value: _lactoseFreeState, 
            onChanged: (isChecked){
              setState(() {
                _lactoseFreeState=isChecked;
              });
            },
            title: Text(" Lactose-free", style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white.withOpacity(0.8)
            ),
            ),
            subtitle: Text("Only include Lactose-free meals", style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
            ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(value: _veganFreeState, 
            onChanged: (isChecked){
              setState(() {
                _veganFreeState=isChecked;
              });
            },
            title: Text("Vegan", style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white.withOpacity(0.8)
            ),
            ),
            subtitle: Text("Only include Vegan meals", style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
            ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(value: _vegetarianFreeState, 
            onChanged: (isChecked){
              setState(() {
                _vegetarianFreeState=isChecked;
              });
            },
            title: Text("Vegetarian", style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white.withOpacity(0.8)
            ),
            ),
            subtitle: Text("Only include Vegetarian meals", style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
            ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      )
    ); 
  }
}