import 'package:coffeeapp/utilities/bottom_navbar.dart';
import 'package:coffeeapp/utilities/coffee_tile.dart';
import 'package:coffeeapp/utilities/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  }

  class _HomePageState extends State <HomePage> {

    // list of coffee types
    final List coffeeType = [
      
      ['Cappuccino',false], // this is index 0..
      ['latte',false],
      ['Iced Coffee',true],
      ['Turkish coffee',false]

    ];

    // user taps on coffee types
    void coffeeTypeSelected(int index) {
      setState(() {

        // this is a loop that makes me when i select one coffeetype unselect the rest
        for(int i = 0; i< coffeeType.length; i++) {
          coffeeType[i][1] = false;
        }
        coffeeType[index][1] = true; //this is the selected one
      });
    }

    int _selectedIndex = 0;

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,//beige 0xFFE5DDD1
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
            bottomNavigationBar: MyBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),

    
    body: SingleChildScrollView(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    child: Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        // Find the best coffee
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),//equal hor padding (right and left)
          child: Text('Find the Best Coffee Sip Here.',
          style: GoogleFonts.bebasNeue(
            fontSize: 48, //color: Color(0xFF4C2B08)
          )
        ),
      ),
      SizedBox(height: 25),

        // search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Find Your Coffee..',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen), //the color when i select the textfield
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 85, 60, 51))
              )
            ),
          ),
        ),
        SizedBox(height: 25),

        // horizontal listview of coffee types(capuccino,latte..)
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: coffeeType.length,
            itemBuilder: (context,index) {
            return CoffeeType(
              coffeeType: coffeeType[index][0], 
              isSelected: coffeeType[index][1], 
              onTap: () {
                coffeeTypeSelected(index);
              }
            );
          }
        ),
      ),    
            
              // First horizontal list
              SizedBox(height:385,
              child: 
              ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/Capuccino2.png',
                    coffeeName: 'Cappuccino',
                    coffeeDescription: 'With regular Milk',
                    coffeePrice: '54'
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/Hotlatte.png',
                    coffeeName: 'Hot latte',
                    coffeeDescription: 'Mocha latte',
                    coffeePrice: '54'
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/Turkish coffee.png',
                    coffeeName: 'Turkish Coffee',
                    coffeeDescription: 'Regular',
                    coffeePrice: '25'
                  )
                ],
              ),
             ),
             SizedBox(height: 20),
             // Best sellers
             Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),
             child: Text(
              'Best Sellers',
              style: GoogleFonts.bebasNeue(
                fontWeight: FontWeight.bold,fontSize: 24,
                letterSpacing: 1.5
              ),
             ),   
            ),
            SizedBox(height:10),
            // Second List
            SizedBox(
              height: 385,
            child: 
            ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: 'lib/images/Iced coffee.png',
                  coffeeName: 'Iced latte',
                  coffeeDescription: 'With Vanilla Flavour',
                  coffeePrice: '55'
                  ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/coffee2.png',
                  coffeeName: 'Cappucino',
                  coffeeDescription: 'with regular Milk',
                  coffeePrice: '55'
                  )
                ],
              ),
            ),             
          ],
        ),
      ),  
    );
  }
}
