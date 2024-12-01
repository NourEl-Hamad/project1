import 'package:flutter/material.dart';
import 'car.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Car car= cars[0];

  void updateCar(Car c){
    setState(() {
      car = c ;
    });
  }
  void updateWarranty(int years){
    setState(() {
      car.warranty = years ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
             title: const Text ('calculator App '),
             centerTitle: true ,
              backgroundColor: Colors.blue,
              foregroundColor:  Colors.white,
      ),
      body: Center(
             child: Column(
                      children: [
                        const SizedBox( height : 10),
                        const Text('Select Model ' , style: TextStyle(fontSize: 24)),
                      const SizedBox( height: 10.0 ),
                         CarDropdownMenu(f: updateCar),
                        const SizedBox(height:10.0),
                        CarWarranty(car: car, f:updateWarranty),
                        const SizedBox(height:10.0),
                        Row(mainAxisAlignment: MainAxisAlignment.center ,children: [
                          const Text('Insurance ', style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Checkbox(value: car.insurance, onChanged: (insurance)=> setState(() {
                          car.insurance =insurance as bool;
                        })),
                        ],),
                        Text(car.getTotalPrice(), style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold)),
                      ],




             ),


      ),
    );
  }
}

