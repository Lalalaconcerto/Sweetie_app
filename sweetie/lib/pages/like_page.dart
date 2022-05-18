import 'package:sweetie/pages/detail_page.dart';
import 'package:flutter/material.dart';
import '../model/product.dart';
import '../model/products_repository.dart';

final Color mainColor = Color.fromARGB(255, 250, 218, 236);

class LikePage extends StatefulWidget {
  const LikePage({Key? key}) : super(key: key);

  @override
  _LikePageState createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  bool removefavorite = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      //stream: ,
      builder: (context, snapshot) {
        final myCollectionUsersRecord = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            automaticallyImplyLeading: false,
            title: Text(
              ' Favourites',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Generated code for this ListView Widget...
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        // CakeNearbyModel currentCakeNearby = FoodDishes[index];
                        return InkWell(
                          // onTap: () async {
                          //   await Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => DetailPage(),
                          //     ),
                          //   );
                          // },
                          child: Container(
                            height: 320,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Colors.white,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 320,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Image.network(
                                              'https://s2.loli.net/2022/05/17/p1LJYnqBmk2wAx6.jpg',
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1, -1),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 12, 12, 0),
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: IconButton(
                                                  color: Color(0xFFD63965),
                                                  icon: removefavorite
                                                      ? Icon(Icons
                                                          .favorite_outline_rounded)
                                                      : Icon(Icons
                                                          .favorite_rounded),
                                                  onPressed: () {
                                                    setState(() {
                                                      removefavorite =
                                                          !removefavorite;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Favoritebottom(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class Favoritebottom extends StatelessWidget {
  const Favoritebottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        child: Column(children: [
          Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
              child: Row(
                children: [
                  Text(
                    ' product.name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              )),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 6),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                  child: Icon(
                    Icons.star_rate_rounded,
                    color: Color(0xFFD63965),
                    size: 24,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                  child: Text(
                    ' product.rating',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.05, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                    child: Text(
                      'product.distance',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
