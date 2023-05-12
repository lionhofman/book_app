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
          autofocus: true,
          style: DefaultTextStyle.of(context)
              .style
              .copyWith(fontStyle: FontStyle.italic),
          controller: controller.typeAheadController,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
              border: OutlineInputBorder()),
        ),
        suggestionsCallback: (pattern) async {
          if (pattern.isEmpty) {
            return [];
          }
          return await controller.getAutocompleteList(pattern);
        },
        onSuggestionSelected: (suggestion) {
          // controller.typeAheadController.text = suggestion.volumeInfo!.title!;
          Get.toNamed('');
        },
        suggestionsBoxDecoration: SuggestionsBoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          elevation: 8.0,
          color: Theme.of(context).cardColor,
        ),
        itemBuilder: (context, suggestion) {
          return ListTile(
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: suggestion.volumeInfo!.imageLinks != null
                    ? Image.network(
                        suggestion.volumeInfo!.imageLinks!.smallThumbnail!,
                        fit: BoxFit.cover)
                    : Container(),
              ),
              title: Text(suggestion.volumeInfo!.title!),
              subtitle: Text(suggestion.saleInfo != null &&
                      suggestion.saleInfo!.retailPrice != null
                  ? controller.formatPrice(
                      price: suggestion.saleInfo!.retailPrice!.amount!)
                  : ""),
              trailing: Visibility(
                visible: suggestion.saleInfo != null &&
                    suggestion.saleInfo!.buyLink != null,
                child: ElevatedButton(
                  onPressed: () => controller.validateLaunchURL(
                      url: suggestion.saleInfo!.buyLink),
                  child: const Text('Comprar'),
                ),
              ));
        },
      ),
    );
  }
}
