import 'package:flutter/material.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 84,right: 10,bottom: 20),
            child: Image.asset('lib/images/pngegg.png'),
          ),

          const Padding(
            padding: EdgeInsets.all(20.00),
            child:Text(

              "We Deliver Groceries to Your DoorStep",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ) ,

          ),
          Text(
              "Fresh Items everyday",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.grey[600],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                builder:(context){
                  return HomePage();
                },
            )),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12)
              ),
              padding: const EdgeInsets.all(24.0),
              child: const Text("Get Started",style: TextStyle(color: Colors.white) ,),
            ),
          ),

          const Spacer()
        ],

      ),

    );
  }
}
