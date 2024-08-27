import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:kaizenkode_test/core/routes_manager.dart';
import 'package:image_picker/image_picker.dart';


import '../i18n/strings.g.dart';extension IntExtension on int {
  String get tabPath {
    switch (this) {
      case 1:
        return RoutesPaths.searchRoute;
      case 2:
        return RoutesPaths.createPostRoute;
      case 3:
        return RoutesPaths.chatRoute;
      case 4:
        return RoutesPaths.profileRoute;
      default:
        return RoutesPaths.homeRoute;
    }
  }

  bool get isHome => this == 0;

  bool get isSearch => this == 1;

  bool get isChat => this == 3;

  bool get isProfile => this == 4;
}

extension DateTimeExtension on DateTime{
  String get getDateFormat =>
      DateFormat("yyyy-MM-dd")
          .format(this);
}

List<int> minutes = [ for (var i = 60; i > 1; i--) i];
List<int> hours = [ for (var i = 24; i > 2; i--) i];
List<int> days = [ for (var i = 7; i > 2; i--) i];
extension StringDateFormat on String {
  String get getDateFormat {
    DateTime createDate = DateTime.tryParse(this) ?? DateTime.now();
    if (createDate.isAfter(
        DateTime.now().subtract(const Duration(minutes: 1)))) {
      return t.now;
    }
    else
    if (createDate.isAfter(DateTime.now().subtract(const Duration(hours: 1)))) {
      int m = 2;
      for (var i in minutes) {
        if (createDate.isAfter(DateTime.now().subtract(Duration(minutes: i)))) {
          m = i;
        }
      }
      return '$m ${t.minutes} ${t.ago}';
    }
    else
    if (createDate.isAfter(DateTime.now().subtract(const Duration(hours: 2)))) {
      return '${t.hour} ${t.ago}';
    }
    else if (createDate.isAfter(
        DateTime.now().subtract(const Duration(hours: 24)))) {
      int h = 2;
      for (var i in hours) {
        if (createDate.isAfter(DateTime.now().subtract(Duration(hours: i)))) {
          h = i;
        }
      }
      return '$h ${t.hours} ${t.ago}';
    }
    else
    if (createDate.isAfter(DateTime.now().subtract(const Duration(days: 2)))) {
      return '1 ${t.day} ${t.ago}';
    }
    else
    if (createDate.isAfter(DateTime.now().subtract(const Duration(days: 7)))) {
      int d = 2;
      for (var i in days) {
        if (createDate.isAfter(DateTime.now().subtract(Duration(hours: i)))) {
          d = i;
        }
      }
      return '$d ${t.days} ${t.ago}';
    }
    else
    if (createDate.isAfter(DateTime.now().subtract(const Duration(days: 8)))) {
      return '1 ${t.week} ${t.ago}';
    }
    else {
      return DateFormat("yyyy-MM-dd")
          .format(DateTime.tryParse(
        this,
      ) ??
          DateTime.now())
          .toString();
    }
  }
}

extension GoRouterExtension on GoRouter {
  String get location {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    final String location = matchList.uri.pathSegments.length > 1 ? matchList.uri.pathSegments.last : matchList.uri.toString();
    return location;
  }
}

Future<XFile?> takePhoto() async {
  final ImagePicker picker = ImagePicker();
  final XFile? photo = await picker.pickImage(source: ImageSource.camera);
  return photo;
}

Future<XFile?> addImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  return image;
}