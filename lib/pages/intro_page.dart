import 'package:flutter/material.dart';
import 'package:grocery_app/pages/home_screen.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // logo
          Padding(
            padding: const EdgeInsets.only(left: 80, right: 80, bottom: 20, top: 160),
            child: Image.asset("lib/images/healthy-food_6077219.png"),
          ),

          //we deliver groceries at your doorstep
          const Text(
            "We deliver groceries at your doorstep",
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10,),
          // fresh items everyday
          const Text(
            "Fresh items everyday",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const Spacer(),
          // get started button
          SizedBox(
            width: 240,
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
              ),
              child: const Text(
                "Get Started",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}