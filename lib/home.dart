import 'package:flutter/material.dart';
import 'food.dart';

class CalorieCalculatorHome extends StatefulWidget {
  const CalorieCalculatorHome({super.key});

  @override
  State<CalorieCalculatorHome> createState() => _CalorieCalculatorHomeState();
}

class _CalorieCalculatorHomeState extends State<CalorieCalculatorHome> {
  Food selectedFood = foods[0];
  int quantity = 0;
  String result = '';
  String selectedDiet = '';
  String dietInfo = '';

  void updateFood(Food food) {
    setState(() {
      selectedFood = food;
      result = '';
    });
  }

  void updateQuantity(String value) {
    setState(() {
      quantity = int.tryParse(value) ?? 0;
      result = '';
    });
  }

  void calculateCalories() {
    setState(() {
      if (quantity > 0) {
        result = 'Total Calories: ${selectedFood.calculateCalories(quantity)}';
      } else {
        result = 'Please enter a valid quantity!';
      }
    });
  }

  void updateDiet(String diet, String info) {
    setState(() {
      selectedDiet = diet;
      dietInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.blue, Colors.green],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Select Food',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              const SizedBox(height: 10),
              FoodDropdownMenu(f: updateFood),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter Quantity (grams)',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.number,
                onChanged: updateQuantity,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateCalories,
                child: const Text('Calculate Calories'),
              ),
              const SizedBox(height: 20),
              Text(
                result,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 30),
              const Text(
                "Let's explore diets:",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              const SizedBox(height: 10),
              DietSelection(
                selectedDiet: selectedDiet,
                onDietChanged: updateDiet,
              ),
              const SizedBox(height: 20),
              Text(
                selectedDiet.isEmpty
                    ? 'No Diet Selected'
                    : 'Selected Diet: $selectedDiet',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 10),
              if (dietInfo.isNotEmpty)
                Text(
                  dietInfo,
                  style: const TextStyle(fontSize: 16, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

