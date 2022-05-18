import 'package:flutter/material.dart';
import 'package:sweetie/pages/detail_page.dart';
import '../model/product.dart';

class NearbyListView extends StatelessWidget {
  final List<Product> products;
  // final List<Images1> image;

  const NearbyListView({Key? key, required this.products}) : super(key: key);

  List<Widget> _buildColumns(BuildContext context) {
    if (products.isEmpty) {
      return <Container>[];
    }

    return List.generate((products.length), (int index) {
      Widget column;
      column = InkWell(
        onTap: ()

            // {
            //   print(products[index].name);
            // },

            async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  // ignore: prefer_const_constructors
                  builder: (context) => DetailPage(
                        product: products[index],
                        // list[0].name,
                      )));
        },
        child: ProductCardColumn(
          product: products[index],
        ),
      );

      return SizedBox(
        width: 300,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: column,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 10.0),
      children: _buildColumns(context),
    );
  }
}

class ProductCardColumn extends StatelessWidget {
  const ProductCardColumn({required this.product, Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ProductCard(
          product: product,
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.transparent, width: 2),
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(product.path),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 50,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 10),
              Text(
                product.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 4.0),
              Text(
                product.distance,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
