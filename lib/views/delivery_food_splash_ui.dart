import 'dart:ffi';

import 'package:delivery_food_app/views/delivery_food_home_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryFoodSplashUI extends StatefulWidget {
  const DeliveryFoodSplashUI({super.key});

  @override
  State<DeliveryFoodSplashUI> createState() => _DeliveryFoodSplashUIState();
}

class _DeliveryFoodSplashUIState extends State<DeliveryFoodSplashUI> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DeliveryFoodHomeUI(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/fastfood.png',
                  ),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            Text(
              'สายด่วน ชวนกิน',
              style: GoogleFonts.kanit(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.08,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            Text(
              'หิวเมื่อไหร่ก็แวะมา\nDelivery Food App',
              style: GoogleFonts.itim(
                color: Colors.yellow,
                fontSize: MediaQuery.of(context).size.width * 0.05,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: MediaQuery.of(context).size.width * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
