import 'package:book_app/app/core/constants/local_storage_constants.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Books'),
      ),
      body: ValueListenableBuilder(
        valueListenable: bookItemsBox.listenable(),
        builder: (context, Box<BookItem> box, _) {
          if (box.values.isEmpty) {
            return Center(child: Text('No books saved.'));
          }
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              BookItem book = box.getAt(index)!;
              return ListTile(
                leading: book.volumeInfo!.imageLinks != null
                    ? Image.network(
                        book.volumeInfo!.imageLinks!.smallThumbnail!,
                        fit: BoxFit.cover)
                    : Container(),
                title: Text(book.volumeInfo!.title!),
                subtitle: Text(
                    book.saleInfo != null && book.saleInfo!.retailPrice != null
                        ? "Price: ${book.saleInfo!.retailPrice!.amount!}"
                        : ""),
                trailing:
                    book.saleInfo != null && book.saleInfo!.buyLink != null
                        ? ElevatedButton(
                            onPressed: () {},
                            child: const Text('Comprar'),
                          )
                        : null,
              );
            },
          );
        },
      ),
    );
  }
}
