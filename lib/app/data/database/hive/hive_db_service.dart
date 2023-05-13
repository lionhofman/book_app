import 'package:book_app/app/core/constants/local_storage_constants.dart';
import 'package:book_app/app/domain/entities/book_item.dart';
import 'package:book_app/app/domain/entities/image_links.dart';
import 'package:book_app/app/domain/entities/price.dart';
import 'package:book_app/app/domain/entities/sale_info.dart';
import 'package:book_app/app/domain/entities/volume_info.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDbService {
  static final HiveDbService _instance = HiveDbService._internal();
  static HiveDbService instance = HiveDbService();

  var bookItemsBox;
  factory HiveDbService() {
    return _instance;
  }
  HiveDbService._internal();

  Future<void> asyncInit() async {
    await Hive.initFlutter();

    Hive.registerAdapter(BookItemAdapter());
    Hive.registerAdapter(VolumeInfoAdapter());
    Hive.registerAdapter(ImageLinksAdapter());
    Hive.registerAdapter(SaleInfoAdapter());
    Hive.registerAdapter(PriceAdapter());

    bookItemsBox =
        await Hive.openBox<BookItem>(LocalStorageConstants.BOOK_ITEMS_HIVE_BOX);
  }

  void storeBookItems({required BookItem bookItem}) async {
    var box =
        await Hive.openBox<BookItem>(LocalStorageConstants.BOOK_ITEMS_HIVE_BOX);
    box.add(bookItem);
  }

  void removeBookItem({required BookItem bookItem}) async {
    var box =
        await Hive.openBox<BookItem>(LocalStorageConstants.BOOK_ITEMS_HIVE_BOX);

    var keyToRemove;

    for (var key in box.keys) {
      if (box.get(key)!.id == bookItem.id) {
        keyToRemove = key;
        break;
      }
    }

    if (keyToRemove != null) {
      box.delete(keyToRemove);
    }
  }

  Future<bool> isFavoritedBookItem({required BookItem bookItem}) async {
    var box =
        await Hive.openBox<BookItem>(LocalStorageConstants.BOOK_ITEMS_HIVE_BOX);

    bool isFavorited = false;

    for (var key in box.keys) {
      if (box.get(key)!.id == bookItem.id) {
        return true;
      }
    }

    return isFavorited;
  }
}
