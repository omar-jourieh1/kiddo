import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiddo/providers/cart_prodvider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/assets/assets.dart';
import '../../core/widgets/book_details/book_details.dart';
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
  bool _isBookListNotEmpty(BuildContext context) {
    return Provider.of<HomeProvider>(context, listen: false).books.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

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
        bottomNavigationBar: bottomNavWidget(
          onTap: () async {
            final url = DetailProvider.bookUrl;
            if (url != null) {
              if (!await launch(url)) {
                throw 'Could not launch $url';
              }
            }
          },
        ),
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
                    child: Image.network(
                      bookModel?.thumbnail ?? "-",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Text(
                      'subtitle: "${bookModel?.subtitle ?? 'no subtitle for this book'}',
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Text(
                      'description: "${bookModel?.description ?? 'no description for this book'}',
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: SizedBox(
                      height: 70.h,
                      child: MaterialButton(
                        color: Colors.orange,
                        onPressed: () {
                          cartProvider.toggleCart(bookModel?.title ?? '',
                              bookModel?.thumbnail ?? '');
                        },
                        child: cartProvider.isExist(bookModel?.title ?? '',
                                bookModel?.thumbnail ?? '')
                            ? const Icon(
                                Icons.thumb_up,
                              )
                            : Row(
                                children: [
                                  const Text('اضف الى السلة'),
                                  const Spacer(),
                                  LottieBuilder.asset(Assets.cartIcon),
                                ],
                              ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
