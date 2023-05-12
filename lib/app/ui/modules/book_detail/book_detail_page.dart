import 'package:book_app/app/domain/entities/book_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailPage extends StatelessWidget {
  final BookItem? book = Get.arguments;
  // final String argument = Get.arguments;

  BookDetailPage({
    super.key,
  });

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
                // ListView.builder(
                //   itemCount: book!.volumeInfo != null &&
                //           book!.volumeInfo!.authors != null
                //       ? book!.volumeInfo!.authors!.length
                //       : 0,
                //   itemBuilder: (context, index) {
                //     return ListTile(
                //       title: Text(
                //         'by ${book!.volumeInfo!.authors![index]}',
                //         style: const TextStyle(
                //             fontSize: 18, fontStyle: FontStyle.italic),
                //       ),
                //     );
                //   },
                // ),
                // Text(
                //   'by ${book!.author}',
                //   style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                // ),
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

  // void _launchURL(String _url) async => await canLaunch(_url)
  //     ? await launch(_url)
  //     : throw 'Could not launch $_url';
}
