import 'package:sweetie/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../model/product.dart';
import '../model/products_repository.dart';

final Color mainColor = Color.fromARGB(255, 250, 218, 236);

class DetailPage extends StatefulWidget {
  // final List<Product> products;
  final Product product;
  // final Images1 images;

  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool addtofavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: Icon(
          Icons.icecream_outlined,
          color: Color(0xFFD63965),
          size: 35,
        ),
        actions: <Widget>[
          IconButton(
            color: Color(0xFFD63965),
            icon: addtofavorite
                ? Icon(Icons.favorite_rounded)
                : Icon(Icons.favorite_outline_rounded),
            tooltip: 'Add to favourite',
            onPressed: () {
              setState(() {
                addtofavorite = !addtofavorite;
              });
            },
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    DetailHeaderTop(
                      product: widget.product,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DetailHeader(
                            product: widget.product,
                          ),
                          DetailOverview(
                            product: widget.product,
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 30, 0, 20),
                              child: InkWell(
                                onTap: () async {},
                                child: Text(
                                  'View on Google Map',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
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
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addtofavorite = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: mainColor, // Background color
                      onPrimary: Colors.black, // Text Color (Foreground color)
                    ),
                    child: Container(
                        width: 150,
                        height: 40,
                        child: Row(
                          children: [
                            Text('Add to Favourite',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                            Icon(Icons.favorite_rounded,
                                color: Color(0xFFD63965))
                          ],
                        ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailHeader extends StatelessWidget {
  final Product product;

  const DetailHeader({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(6, 5, 0, 5),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Text(
                    product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6, 8, 0, 5),
                    child: Text(
                      product.distance,
                      style: TextStyle(
                        color: Color(0xFFD63965),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                      child: Icon(
                        Icons.star,
                        color: Color(0xFFD63965),
                      )),
                  Text(
                    product.rating,
                    style: TextStyle(
                      color: Color(0xFFD63965),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.8, 0),
                      child: Text(
                        product.isOpen,
                        style: TextStyle(
                          color: Color.fromARGB(255, 128, 127, 127),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class DetailHeaderTop extends StatelessWidget {
  final Product product;

  const DetailHeaderTop({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
              image: DecorationImage(
                image: NetworkImage(product.path),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ));
  }
}

class DetailOverview extends StatelessWidget {
  final Product product;

  const DetailOverview({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        child: Container(
            height: 200,
            width: double.infinity,
            margin: EdgeInsets.all(5),
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: Column(
              children: [
                Divider(
                  height: 2,
                  thickness: 2,
                  color: Color.fromARGB(255, 212, 211, 211),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  product.detail,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                )
              ],
            )));
  }
}
