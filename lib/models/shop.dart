
import 'package:ecommerce_simple/models/product.dart';
import 'package:flutter/cupertino.dart';

class Shop extends ChangeNotifier{
  // products for sale
  final List<Product> _shop = [
    Product(name: 'Product A', price: 99.99, description: "Some long description here..more description about this product", imagePath: '/'),
    Product(name: 'Product B', price: 99.99, description: "Some long description here", imagePath: '/'),
    Product(name: 'Product C', price: 99.99, description: "Some long description here", imagePath: '/'),
    Product(name: 'Product D', price: 99.99, description: "Some long description here", imagePath: '/'),
    Product(name: 'Product E', price: 99.99, description: "Some long description here", imagePath: '/'),
  ];

  // user cart
  final List<Product> _cart =  [];

  // get product list
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(Product item){
    _cart.remove(item);
    notifyListeners();
  }

}