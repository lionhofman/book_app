import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import 'controller/search_controller.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
          controller: controller.typeAheadController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search',
          ),
        ),
        suggestionsCallback: (pattern) async {
          await controller.setText(pattern);
          return controller.autocompleteList;
        },
        itemBuilder: (context, suggestion) {
          //     return ListView.builder(
          //       physics: const BouncingScrollPhysics(),
          // itemCount: controller.autocompleteList.length,
          // shrinkWrap: true,
          //       itemBuilder: (context, i){
          //       return  Column(children: [

          //       ],);
          //     });

          return ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: Text(suggestion.volumeInfo!.title!),
            subtitle: Text(suggestion.etag!),
          );
        },
        onSuggestionSelected: (suggestion) {
          Get.toNamed('');
        },
      ),
    );
  }
}
