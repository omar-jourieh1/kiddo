import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<String> _books = [];
  List<String> get books => _books;
  List<String> _images = [];
  List<String> get images => _images;

  void toggleCart(String books, String images) {
    final isExistBooks = _books.contains(books);
    if (isExistBooks) {
      _books.remove(books);
      _images.remove(images);
    } else {
      _books.add(books);
      _images.add(images);
    }
    notifyListeners();
  }

  bool isExist(String books, String images) {
    final isExistBooks = _books.contains(books);
    return isExistBooks;
  }

  void clearCart() {
    _books = [];
    _images = [];
    notifyListeners();
  }
}
