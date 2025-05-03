import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeeImagePath;
  final String coffeeName;
  final String coffeeDescription;
  final String coffeePrice;

  CoffeeTile({
    required this.coffeeImagePath, 
    required this.coffeeName,
    required this.coffeeDescription, 
    required this.coffeePrice,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25),
      child: Container(
        padding: EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
          color: Color(0xFFB6C687),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Coffee image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(coffeeImagePath,
              height: 200,
              width: double.infinity, // fill the container s width
              fit: BoxFit.cover, // fills the space with no disortion m 
              ),
            ),

            // Coffee name
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffeeName,
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFF4C2B08)),
                  ),
                  SizedBox(height: 4),
                  Text(
                    coffeeDescription,
                    style: TextStyle(color: Color(0xFF65493B)),
                  ),
                ],
              ),
            ),

            // Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$coffeePrice EGP',style: TextStyle(
                    color:Color(0xFF3d251e),
                  ),
                ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(color: Colors.white30, // the plus icon box
                    borderRadius: BorderRadius.circular(6)
                    ),
                    child: Icon(Icons.add)
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
