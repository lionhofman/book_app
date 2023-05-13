import 'package:book_app/app/data/database/hive/hive_db_service.dart';
import 'package:book_app/app/domain/entities/book_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailPage extends StatefulWidget {
  const BookDetailPage({
    super.key,
  });

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  final BookItem? book = Get.arguments;
  bool _isFavorited = false;

  @override
  void initState() {
    asyncInit();
    super.initState();
  }

  Future<void> asyncInit() async {
    bool favorited =
        await HiveDbService.instance.isFavoritedBookItem(bookItem: book!);
    setState(() {
      _isFavorited = favorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book!.volumeInfo!.title!),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  book!.volumeInfo!.title!,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 50,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemCount: book!.volumeInfo != null &&
                            book!.volumeInfo!.authors != null
                        ? book!.volumeInfo!.authors!.length
                        : 0,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          'by ${book!.volumeInfo!.authors![index]}',
                          style: const TextStyle(
                              fontSize: 14, fontStyle: FontStyle.italic),
                        ),
                      );
                    },
                  ),
                ),

                Divider(),
                Text(
                  book!.volumeInfo!.description!,
                  style: TextStyle(fontSize: 18),
                ),
                Divider(),
                Text(
                  'Publisher: ${book!.volumeInfo!.publisher!}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Published Date: ${book!.volumeInfo!.publishedDate}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Page Count: ${book!.volumeInfo!.pageCount}',
                  style: TextStyle(fontSize: 18),
                ),
                Divider(),
                IconButton(
                  icon: Icon(
                    _isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: _isFavorited ? Colors.red : null,
                  ),
                  onPressed: _toggleFavorite,
                ),
                // Text(
                //   'Price: ${book!.saleInfo!.retailPrice!.amount}',
                //   style: TextStyle(fontSize: 18),
                // ),
                ElevatedButton(
                  // onPressed: () => _launchURL(book!.saleInfo!.buyLink!),
                  onPressed: () {},
                  child: Text('Buy this book'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });

    if (_isFavorited) {
      HiveDbService.instance.storeBookItems(bookItem: book!);
    } else {
      HiveDbService.instance.removeBookItem(bookItem: book!);
    }
  }
}
