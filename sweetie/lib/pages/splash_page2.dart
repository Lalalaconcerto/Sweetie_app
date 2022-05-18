import 'package:sweetie/navigator/tab_navigator.dart';
import 'package:flutter/material.dart';

final Color mainColor = Color.fromARGB(255, 249, 212, 239);
final Color darkColr = Color(0xFFD63965);

class SplashPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => TabNavigator()));
    });

    return Scaffold(
        body: Container(
            color: mainColor,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  color: mainColor,
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      // Container(
                      //   padding: EdgeInsets.only(top: 40, left: 90),
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.max,
                      //     children: [
                      //       Container(
                      //         width: 80,
                      //         height: 80,
                      //         clipBehavior: Clip.antiAlias,
                      //         decoration: BoxDecoration(
                      //           shape: BoxShape.circle,
                      //         ),
                      //         child: Image.network(
                      //           'https://s2.loli.net/2022/05/17/LZh5k92QUO3jSmp.jpg',
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Container(
                          padding: EdgeInsets.only(top: 60),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: Text(
                                  'WELCOME TO ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Text(
                              'SWEETIE!',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 55,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: Icon(
                                Icons.icecream,
                                color: darkColr,
                                size: 100,
                              )),
                          Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: Icon(
                                Icons.cake,
                                color: darkColr,
                                size: 100,
                              )),
                          Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: Icon(
                                Icons.local_drink,
                                color: darkColr,
                                size: 100,
                              )),
                          Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: Icon(
                                Icons.tag_faces,
                                color: darkColr,
                                size: 100,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                // Align(
                //   alignment: Alignment.center,
                //   child: Text(
                //     'BUILD YOUR SWEETIE DAY!',
                //     style: TextStyle(
                //       fontWeight: FontWeight.w600,
                //       fontSize: 20,
                //       color: Colors.black,
                //     ),
                //   ),
                // ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        margin: EdgeInsets.only(bottom: 80),
                        child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white))))
              ],
            )));
  }
}
