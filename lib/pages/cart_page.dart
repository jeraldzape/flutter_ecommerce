import 'package:ecommerce_simple/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  void removeItemFromCart(BuildContext context, Product product){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text("Remove this item from your cart?"),
          actions: [
            // cancel
            MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel")
            ),
            // proceed
            MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<Shop>().removeFromCart(product);
                },
                child: const Text("Yes")
            )
          ],
        )
    );
  }

  void payNow(BuildContext context){

    showDialog(context: context, builder: (context) => const AlertDialog(
      content: Text("User wants to pay!")
    ));
  }

  @override
  Widget build(BuildContext context) {

    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text("Cart Page"),
      ),
      body: Center(
        child: cart.isEmpty ? Text("Your cart is empty") : Column(
          children: [
            // cart list
            Expanded(
                child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final item = cart[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text('\$' + item.price.toStringAsFixed(2)),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => removeItemFromCart(context, item),
                      ),
                    );
                  },
                )
            ),

            // pay button
            Padding(
              padding: const EdgeInsets.all(25),
              child: MyButton(child: const Text("PAY NOW"), onTap: () => payNow(context)),
            )
          ],
        ),
      )
    );
  }
}
