import 'package:book_app/app/data/datasources/book_remote_data_source.dart';
import 'package:book_app/app/data/repositories/book_repository_impl.dart';
import 'package:book_app/app/domain/repositories/book_repository.dart';
import 'package:book_app/app/domain/usecases/search/get_autocomplete_list_use_case.dart';
import 'package:book_app/app/ui/modules/search/controller/search_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookRemoteDataSource>(() => BookRemoteDataSourceImpl());
    Get.lazyPut<BookRepository>(() => BookRepositoryImpl(
          Get.find<BookRemoteDataSource>(),
        ));
    Get.lazyPut<GetAutocompleteListUseCase>(
        () => GetAutocompleteListUseCase(Get.find<BookRepository>()));
    Get.put<SearchController>(
      SearchController(
        Get.find<GetAutocompleteListUseCase>(),
      ),
    );
  }
}
