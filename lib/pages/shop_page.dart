import 'package:ecommerce_simple/components/my_drawer.dart';
import 'package:ecommerce_simple/components/my_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // get shops
    final products = context.watch<Shop>().shop;

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text("Shop Page"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'),
            icon: const Icon(Icons.shopping_cart)
          )
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(height: 25),
          Center(
            child: Text(
              "Pick from a selected list of premium products",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),
          ),
          SizedBox(
            height: 550,
            child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  // get each product
                  final product = products[index];
                  return MyProductTile(product: product);

                }
            ),
          )
        ],
      )
    );
  }
}
