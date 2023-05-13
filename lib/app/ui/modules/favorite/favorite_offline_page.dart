import 'package:book_app/app/core/constants/local_storage_constants.dart';
import 'package:book_app/app/core/multilanguage/messages.dart';
import 'package:book_app/app/core/validation/custom_validation.dart';
import 'package:book_app/app/domain/entities/book_item.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoriteOfflinePage extends StatefulWidget {
  const FavoriteOfflinePage({
    super.key,
  });

  @override
  State<FavoriteOfflinePage> createState() => _FavoriteOfflinePageState();
}

class _FavoriteOfflinePageState extends State<FavoriteOfflinePage> {
  late Box<BookItem> bookItemsBox;

  @override
  void initState() {
    super.initState();
    bookItemsBox =
        Hive.box<BookItem>(LocalStorageConstants.BOOK_ITEMS_HIVE_BOX);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(Messages.of(context).favoriteBooks),
      ),
      body: ValueListenableBuilder(
        valueListenable: bookItemsBox.listenable(),
        builder: (context, Box<BookItem> box, _) {
          if (box.values.isEmpty) {
            return Center(child: Text(Messages.of(context).noBooksSaved));
          }
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              BookItem book = box.getAt(index)!;
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      book.volumeInfo!.imageLinks != null
                          ? Image.network(
                              book.volumeInfo!.imageLinks!.smallThumbnail!,
                              fit: BoxFit.cover,
                              width: 50,
                              height: 80,
                            )
                          : const SizedBox(
                              width: 50,
                              height: 80,
                              child: Icon(Icons.image_not_supported),
                            ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.volumeInfo!.title!,
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              book.saleInfo != null &&
                                      book.saleInfo!.retailPrice != null
                                  ? "${Messages.of(context).price}: ${CustomValidation.formatPrice(price: book.saleInfo!.retailPrice!.amount!)}"
                                  : "",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.favorite, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            box.deleteAt(index);
                          });
                        },
                      ),
                      book.saleInfo != null && book.saleInfo!.buyLink != null
                          ? ElevatedButton(
                              onPressed: () =>
                                  CustomValidation.validateLaunchURL(
                                      url: book.saleInfo!.buyLink),
                              child: Text(Messages.of(context).buyThisBook),
                            )
                          : Container(),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    ));
  }
}
