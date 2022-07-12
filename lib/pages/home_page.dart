import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/util/coffee_tile.dart';
import 'package:untitled/util/coffee_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // list of coffee types
  final List coffeeType = [
    // [ coffee type, isSelectd ]
    [
    'Cappucino', true,
    ],
    [
      'Latte', false,
    ],
    [
      'Black', false,
    ],
    [
      'Tea', false,
    ],
  ];

  // user tapped on coffee types
  void coffeeTypeSelected(int index) {
  setState ((){

    // this for loop makes every selection false
    for(int i=0; i<coffeeType.length; i++) {
      coffeeType[i][1] = false;
    }
    coffeeType[index] [1] = true;
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          )
        ],
      ),
      body:  Column(children: [
        // find the best coffee for you
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
              "Find the best coffee for you",
          style: GoogleFonts.bebasNeue(
            fontSize: 56,
            ),
          ),
        ),

        SizedBox(height: 25),

        //search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Find your coffee..',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
            ),
          ),
        ),

        SizedBox(height: 25),

        //horizontal listview of coffee types
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: coffeeType.length,
              itemBuilder: (context,index){
            return CoffeeType(
                coffeeType: coffeeType[index] [0],
                isSelected: coffeeType [index] [1],
                onTap: () {
                  coffeeTypeSelected(index);
                }
                );
              },
            ),
          ),

        //horizontal listview of coffee titles
        Expanded(
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/latte.jpg',
                    coffeeName: 'Latte',
                    coffeePrice: '4.20',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/cappucino.jpg',
                    coffeeName: 'Cappucino',
                    coffeePrice: '4.50',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/milk.jpg',
                    coffeeName: 'Milk Coffee',
                    coffeePrice: '4.00',
                  ),
             ],
            ),
          ),
        ],
      ),
    );
  }
}
