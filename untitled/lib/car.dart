import 'package:flutter/material.dart';

class Car {
  String model;

  int price;

  int warranty = 1; // by defailt warrenty =1
  bool insurance = false;

  // constructor will take only model and price and the rest will deal with them later
  Car(this.model, this.price);

  @override
  String toString() {
    return '$model price :\$ $price';
  }

  String getTotalPrice() {

    /*if warranty is 1 then 5% else 10%

  if insurance is added, then add 1000 to total price*/


    int insuranceAmount = insurance ? 1000 : 0;

    if (warranty == 1) {
      return (price * 1.05 + insuranceAmount).toString();
    } else {
      return (price * 1.1 + insuranceAmount).toString();
    }
  }

}//end class
List<Car> cars = [

  Car('Honda', 10000),

  Car('Toyota', 20000),

  Car('BMW', 30000),

  Car('Hyundai', 8000)

];

class CarDropdownMenu extends StatefulWidget {

  final  Function (Car) f ;
  const CarDropdownMenu({ required this.f ,super.key});

  @override
  State<CarDropdownMenu> createState() => _CarDropdownMenuState();
}

class _CarDropdownMenuState extends State<CarDropdownMenu> {
  @override
  Widget build(BuildContext context) {

    return DropdownMenu(
        width: 230,
        initialSelection: cars[0],
        onSelected: (car)=> widget.f(car as Car),
        dropdownMenuEntries: cars.map( (car) =>DropdownMenuEntry(value: car , label: car.toString())).toList());
  }
}

 class CarWarranty extends StatefulWidget {

  final Car car;
  final Function (int) f ;
   const CarWarranty({ required this.car, required this.f ,super.key});

   @override
   State<CarWarranty> createState() => _CarWarrantyState();
 }

 class _CarWarrantyState extends State<CarWarranty> {
   @override
   Widget build(BuildContext context) {
     return Row(
       mainAxisAlignment: MainAxisAlignment.center , children: [
         const Text('Warranty', style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
         Radio(value: 1, groupValue: widget.car.warranty, onChanged: (years)=> widget.f(years as int )),
         const Text ('1 Year ' , style: TextStyle(fontSize: 18),),
       Radio(value: 5, groupValue: widget.car.warranty, onChanged: (years)=> widget.f(years as int )),
       const Text ('5 Year ' , style: TextStyle(fontSize: 18),)

     ],

     );
   }
 }

 


