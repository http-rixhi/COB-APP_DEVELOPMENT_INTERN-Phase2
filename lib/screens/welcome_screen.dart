import 'package:flutter/material.dart';
import 'package:service_provider/screens/user/login_screen.dart';
import 'package:service_provider/screens/user/signup_screen.dart';

import '../widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
            /*
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
          ),
          */

            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 130,
              //width: 180,
              child: Column(
                children: [
                  Text("Service Provider App",
                    style: TextStyle(
                      fontSize: 33,
                    ),
                  ),
                  Text('-by Rishi Raj'),
                ],
              )
            ),
            const SizedBox(height: 20),
            CustomButton(
              buttonText: "Login",
              buttonColor: Colors.black,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginScreen(),
                  ),
                );
              },
            ),
            CustomButton(
              buttonText: "Register",
              buttonColor: Colors.white,
              textColor: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SignUpScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Get your Freelance!",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
