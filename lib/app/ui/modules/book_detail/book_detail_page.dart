import 'package:book_app/app/core/validation/custom_validation.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 4.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  leading: Image.network(
                      book!.volumeInfo!.imageLinks!.smallThumbnail!),
                  title: Text(
                    book!.volumeInfo!.title!,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'by ${book!.volumeInfo!.authors!.join(', ')}',
                    style: const TextStyle(
                        fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    book!.volumeInfo!.description!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Publisher: ${book!.volumeInfo!.publisher!}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Published Date: ${book!.volumeInfo!.publishedDate}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Page Count: ${book!.volumeInfo!.pageCount}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        _isFavorited ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorited ? Colors.red : null,
                      ),
                      onPressed: _toggleFavorite,
                    ),
                    Visibility(
                      visible: book!.saleInfo != null &&
                          book!.saleInfo!.buyLink != null,
                      child: ElevatedButton(
                        onPressed: () => CustomValidation.validateLaunchURL(
                            url: book!.saleInfo!.buyLink),
                        child: const Text('Buy this book'),
                      ),
                    ),
                  ],
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
