import 'package:book_app/app/core/multilanguage/messages_en.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'messages.dart';
import 'messages_pt.dart';

class MessagesDelegate extends LocalizationsDelegate<Messages> {
  const MessagesDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'pt'].contains(locale.languageCode);

  @override
  Future<Messages> load(Locale locale) {
    return SynchronousFuture<Messages>(
        locale.languageCode == 'pt' ? MessagesPt() : MessagesEn());
  }

  @override
  bool shouldReload(MessagesDelegate old) => false;
}
