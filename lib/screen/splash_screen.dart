import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../route_config/route_config.dart';
import '../styles/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              "Welcome to DailyVita",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Hello, we are here to make your life healthier and happier",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                decoration: TextDecoration.none,
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(30),
              child: SvgPicture.asset(
                'assets/icons/launch.svg',
                width: MediaQuery.of(context).size.width / 3 * 2,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "We will ask a couple of questions to better understand your vitamin needs",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                decoration: TextDecoration.none,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.5 * 2.2,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button tap
                  Navigator.pushReplacementNamed(context, RouteConfig.ROUTE_HOME);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.redAccent, // Text color
                ),
                child: const Text('Get started'),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );


  }}


