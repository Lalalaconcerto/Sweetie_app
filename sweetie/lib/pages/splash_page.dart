import 'package:flutter/material.dart';
import 'package:sweetie/pages/splash_page2.dart';

final Color mainColor = Color.fromARGB(255, 249, 212, 239);

// splash page
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              //image: DecorationImage(
              //image: NetworkImage(splashUrl), fit: BoxFit.cover)
              color: Color.fromARGB(255, 250, 218, 236)),
        ),
        Align(
          alignment: Alignment(0, 0.7),
          child: GestureDetector(
            onTap: () {
              // Use Navigator to jump page
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return SplashPage2();
              }));
            },
            child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(60, 0, 0, 0),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.5,
                  ),
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color.fromARGB(255, 248, 194, 233),
                      Color.fromARGB(255, 79, 35, 182)
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(26)),
                ),
                child: Center(
                    child: Text(
                  "Let's start",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ))),
          ),
        ),
        Align(
            alignment: Alignment(0, -0.2),
            child: Icon(Icons.icecream, color: Colors.black, size: 90)),

        // Container(
        //  color: Colors.black.withOpacity(0.3),
        //  width: double.infinity,
        // ),
        Align(
            alignment: Alignment(0, 0.1),
            child: Stack(
              children: <Widget>[
                Text(
                  'Sweetie',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 45,
                    color: Colors.black,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
