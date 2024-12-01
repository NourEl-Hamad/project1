import 'package:flutter/material.dart';

class Food {
  String name;
  int caloriesPerGram;

  Food(this.name, this.caloriesPerGram);

  int calculateCalories(int quantity) {
    return quantity * caloriesPerGram;
  }

  @override
  String toString() {
    return name;
  }
}

List<Food> foods = [
  Food('Apple', 1), // 1 calorie per gram
  Food('Banana', 2),
  Food('Chicken', 3),
  Food('Rice', 4),
  Food('Chocolate', 5),
];

class FoodDropdownMenu extends StatefulWidget {
  final Function(Food) f;

  const FoodDropdownMenu({required this.f, super.key});

  @override
  State<FoodDropdownMenu> createState() => _FoodDropdownMenuState();
}

class _FoodDropdownMenuState extends State<FoodDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
        child: DropdownMenu(

      width: 1000,
      initialSelection: foods[0],
      onSelected: (food) => widget.f(food as Food),
      dropdownMenuEntries: foods
          .map((food) => DropdownMenuEntry(
        value: food,
        label: food.name,
      ))
          .toList(),
    ),
    );
  }
}
//
final List<Map<String, String>> diets = [
  {
    'name': 'Low Carb',
    'info': 'The Low Carb diet focuses on reducing carbohydrate intake.',
  },
  {
    'name': 'Keto',
    'info': 'The Keto diet is a high-fat, low-carb diet that helps the body burn fat.',
  },
  {
    'name': 'Vegan',
    'info': 'The Vegan diet eliminates all animal products for a plant-based lifestyle.',
  },
];

class DietSelection extends StatefulWidget {
  final String? selectedDiet;
  final Function(String, String) onDietChanged;

  const DietSelection({this.selectedDiet, required this.onDietChanged, super.key});

  @override
  State<DietSelection> createState() => _DietSelectionState();
}

class _DietSelectionState extends State<DietSelection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: diets.map((diet) {
            return Row(
              children: [
                Text(diet['name']!, // we bring the diet name from the map function nd the ! to make sure it s not null
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Radio<String>(
                  value: diet['name']!,
                  groupValue: widget.selectedDiet,
                  onChanged: (selectedDiet) {
                    widget.onDietChanged(selectedDiet!, diet['info']!);
                  },
                ),
              ],
            );
          }).toList(),// row requires a list thats why we change map into list
        ),
      ],
    );
  }
}