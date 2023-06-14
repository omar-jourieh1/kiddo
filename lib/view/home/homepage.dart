import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/book/book_widget.dart';
import '../../core/widgets/book/bottom_sheet_widget.dart';
import '../../core/widgets/fab/fab.dart';
import '../../model/home/bookModel.dart';
import '../../providers/home_provider.dart';
import 'book_detail_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  HomeProvider? _provider;

  void _openBookDetail(BookModel book) {
    print("book.id ${book.id}");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BookDetailScreen(bookId: book.id)));
  }

  void _getBooksApi() {
    _provider?.showLoading();
    _provider?.getBooks();
  }

  void _openSearchBottomSheet() {
    showModalBottomSheet(
        context: context,
        barrierColor: Colors.transparent,
        elevation: 10,
        isScrollControlled: true,
        builder: (ctx) {
          return FractionallySizedBox(
            child: BottomSheetWidget(),
          );
        }).then((value) {
      if (value != null) {
        _provider?.query = value;
        _provider?.books.clear();
        _getBooksApi();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<HomeProvider>(context, listen: false);
    _provider?.getBooks();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getBooksApi();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, widget) => Scaffold(
        appBar: AppBar(
          title: const Text('الكتب'),
          backgroundColor:  const Color(0xffFFF5BE),
          centerTitle: true,
          elevation: 2,
          shadowColor: const Color(0xffFFED8C),
        ),
        floatingActionButton:
            floatingActionWidget(onPressed: _openSearchBottomSheet),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                      child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    shrinkWrap: true,
                    itemCount: provider.books.length,
                    controller: _scrollController,
                    itemBuilder: (context, position) {
                      final book = provider.books[position];
                      return InkWell(
                        onTap: () {
                          _openBookDetail(book);
                        },
                        child: BookWidget(book.title, book.thumbnail),
                      );
                    },
                  )),
                  provider.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
