import 'package:flutter/material.dart';
import 'package:sweetie/ListView/NearbyListView.dart';
import 'package:sweetie/pages/splash_page.dart';
import '../model/product.dart';
import '../model/products_repository.dart';

final Color mainColor = Color.fromARGB(255, 250, 218, 236);
final Color greyColor = Color(0xFF4E5156);
final Color darkColr = Color(0xFFD63965);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Category _currentCategory = Category.Icecream;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 250, 218, 236),
          title: Align(
              alignment: AlignmentDirectional(0, 0),
              child: Icon(
                Icons.icecream_outlined,
                color: Colors.black,
                size: 35,
              )),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_location),
              tooltip: 'Add location',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Wrap(
                      children: [
                        ListTile(
                          leading: Icon(Icons.add_location),
                          title: Text('Add your address here...'),
                        ),
                        Container(
                          child: Center(
                            child: SizedBox(
                              height: 40,
                              width: 300,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: mainColor, // Background color
                                    onPrimary: Colors.black, // Text Color
                                  ),
                                  child: const Text('Confirm',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: double.infinity,
                        )
                      ],
                    );
                  },
                );
              },
            ),
          ],
          iconTheme: IconThemeData(color: Colors.black),
        ),
        drawer: Drawer(
          child: Container(
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Icon(
                          Icons.icecream,
                          color: darkColr,
                          size: 100,
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Icon(
                          Icons.cake,
                          color: darkColr,
                          size: 100,
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Icon(
                          Icons.local_drink,
                          color: darkColr,
                          size: 100,
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Icon(
                          Icons.tag_faces,
                          color: darkColr,
                          size: 100,
                        )),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: RaisedButton(
                        child: Text(
                          'Log out',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: darkColr,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SplashPage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: ListView(children: <Widget>[
          SizedBox(
            height: 680,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSearch(),
                Expanded(
                    child: AppCategory(
                  currentCategory: _currentCategory,
                  onCategoryTap: _onCategoryTap,
                )),
                Expanded(
                    child: AppCakeNearbyListView(category: _currentCategory)),
              ],
            ),
          )
        ]));
  }
}

class AppSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromARGB(255, 230, 233, 237),
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                              child: Icon(
                                Icons.search_rounded,
                                color: Color(0xFF95A1AC),
                                size: 24,
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: TextFormField(
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Search here...',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}

// App category widget

class AppCategory extends StatelessWidget {
  final Category currentCategory;
  final ValueChanged<Category> onCategoryTap;
  final List<Category> _categories = Category.values;

  const AppCategory({
    Key? key,
    required this.currentCategory,
    required this.onCategoryTap,
  })  : assert(currentCategory != null),
        assert(onCategoryTap != null);

  Widget _buildCategory(Category category, BuildContext context) {
    final categoryString =
        category.toString().replaceAll('Category.', '').toUpperCase();
    return GestureDetector(
        onTap: () => onCategoryTap(category),
        child: category == currentCategory
            ? Column(
                children: <Widget>[
                  SizedBox(
                      height: 60,
                      child: Container(
                        width: 300,
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: mainColor,
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          categoryString,
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      )),
                ],
              )
            : Column(
                children: <Widget>[
                  SizedBox(
                      height: 60,
                      child: Container(
                          width: 300,
                          margin: EdgeInsets.only(
                            top: 10,
                          ),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: mainColor,
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Text(
                                categoryString,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ))),
                ],
              ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.only(left: 30),
        child: Row(
          children: [
            Text('BUILD YOUR SWEETIE DAY!',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.only(
          left: 30,
        ),
        child: Row(children: [
          Text('AT YOUR DOOR STEPS',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w300))
        ]),
      ),
      Container(
        height: 200,
        padding: EdgeInsets.only(top: 10.0),
        child: ListView(
            scrollDirection: Axis.vertical,
            children: _categories
                .map((Category c) => _buildCategory(c, context))
                .toList()),
      ),
      Container(
        padding: EdgeInsets.only(left: 30, top: 10),
        child: Row(
          children: [
            Text(' Desserts Nearby ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ]);
  }
}

// Desserts Nearby Listview
class AppCakeNearbyListView extends StatelessWidget {
  final Category category;

  const AppCakeNearbyListView({this.category: Category.Icecream});

  @override
  Widget build(BuildContext context) {
    // List<Product> list = ProductsRepository.loadProducts(category);
    return NearbyListView(
      products: ProductsRepository.loadProducts(category),
      // image: [],
    );

    // return InkWell(
    //   onTap: () async {
    //     await Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             // ignore: prefer_const_constructors
    //             builder: (context) => DetailPage(
    //                   products: ProductsRepository.loadProducts(category),
    //                   // list[0].name,
    //                 )));
    //   },
    //   child:
    //       NearbyListView(products: ProductsRepository.loadProducts(category)),
    // );
  }
}
