import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:kiddo/model/home/bookModel.dart';

class HomeProvider with ChangeNotifier {
  List<BookModel> books = [];
  int page = 0;
  bool isLoading = true;
  String? query = "kids";

  Future<void> getBooks() async {
    try {
      final response = await http.get(Uri.parse(
          "https://www.googleapis.com/books/v1/volumes?q=$query&startIndex=$page&maxResults=40"));

      //print("response.body ${response.body}");
      final items = jsonDecode(response.body)['items'];
      List<BookModel> bookList = [];
      for (var item in items) {
        bookList.add(BookModel.fromJson(item));
      }

      books.addAll(bookList);
      page += 40;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print("error get books $e");
    }
  }

  void showLoading() {
    isLoading = true;
    notifyListeners();
  }
}
