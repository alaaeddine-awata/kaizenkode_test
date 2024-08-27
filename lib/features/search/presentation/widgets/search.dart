import 'package:flutter/cupertino.dart';

import '../../../../i18n/strings.g.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return  CupertinoPageScaffold(
        child: Center(
      child: Text(t.search),
    ));
  }
}
