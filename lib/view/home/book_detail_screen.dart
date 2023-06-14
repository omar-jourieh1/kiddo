import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../model/home/bookModel.dart';
import '../../providers/detail_provider.dart';
import '../../providers/home_provider.dart';
import 'homepage.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({
    super.key,
    this.bookId,
  });

  final String? bookId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffFFF5BE),
          centerTitle: true,
          elevation: 2,
          shadowColor: const Color(0xffFFED8C),
          title: const Text("تفاصيل الكتاب"),
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              if (_isBookListNotEmpty(context)) {
                Navigator.pop(context);
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              }
            },
          ),
        ),
        bottomNavigationBar: _bottomNavWidget(),
        body: FutureBuilder<BookModel?>(
          future: DetailProvider().getBookDetail(bookId),
          builder: (context, apiResponse) {
            final bookModel = apiResponse.data;
            DetailProvider.bookUrl = bookModel?.bookUrl;
            if (apiResponse.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (apiResponse.connectionState == ConnectionState.done &&
                bookModel == null) {
              return const Center(
                child: Text(
                  "لا توجد بيانات",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
              );
            }
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Text(
                      "${bookModel?.title}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Text(
                      bookModel?.subtitle ?? "-",
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                      height: 500,
                      child: WebView(
                        backgroundColor: Colors.black,
                        initialUrl: bookModel?.bookUrl,
                      )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  bool _isBookListNotEmpty(BuildContext context) {
    return Provider.of<HomeProvider>(context, listen: false).books.isNotEmpty;
  }

  Widget _bottomNavWidget() {
    final widget = Container(
      decoration: const BoxDecoration(color: Color(0xffFFF5BE), boxShadow: [
        BoxShadow(color: Color(0xffFFED8C), offset: Offset(1, 2))
      ]),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "اشتري الكتاب",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
    return InkWell(
      child: widget,
      onTap: () async {
        final url = DetailProvider.bookUrl;
        if (url != null) {
          if (!await launch(url)) {
            throw 'Could not launch $url';
          }
        }
      },
    );
  }
}
