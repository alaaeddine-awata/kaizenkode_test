import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaizenkode_test/core/color_manager.dart';

import '../../../../i18n/strings.g.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(t.profile),
          CupertinoButton(color: ColorManager.secondary,child: Text(t.changeLang), onPressed: (){
            setState(() {});
            if(LocaleSettings.currentLocale.languageCode == 'en'){
              LocaleSettings.setLocaleRaw('ar');
            }else{
              LocaleSettings.setLocaleRaw('en');
            }
          }),
          Text(LocaleSettings.currentLocale.languageCode == 'en' ? 'English':'عربي')
        ],
      ),
    ));
  }
}
