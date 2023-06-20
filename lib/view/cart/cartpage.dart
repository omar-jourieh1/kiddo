import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../core/assets/assets.dart';
import '../../providers/cart_prodvider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    final books = provider.books;
    final images = provider.images;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffFFF5BE),
          centerTitle: true,
          elevation: 2,
          shadowColor: const Color(0xffFFED8C),
          title: const Text('السلة'),
        ),
        body: ListView.builder(
          itemBuilder: ((context, index) => ListTile(
                title: Text(books[index]),
                leading: Image.network(images[index]),
                trailing: MaterialButton(
                    height: 70.h,
                    onPressed: () {
                      provider.toggleCart(books[index], images[index]);
                    },
                    child: provider.isExist(books[index], images[index])
                        ? LottieBuilder.asset(Assets.cartIcon)
                        : LottieBuilder.asset(Assets.cartIcon)),
              )),
          itemCount: books.length,
        ));
  }
}
