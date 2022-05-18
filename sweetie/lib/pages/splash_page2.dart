import 'package:sweetie/navigator/tab_navigator.dart';
import 'package:flutter/material.dart';

final Color mainColor = Color.fromARGB(255, 249, 212, 239);

// splash page2
class SplashPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => TabNavigator()));
    });

    return Container(
        color: mainColor,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'BUILD YOUR SWEETIE DAY!',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: EdgeInsets.only(bottom: 80),
                    child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.white))))
          ],
        ));
  }
}
