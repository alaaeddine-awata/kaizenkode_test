/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 50 (25 per locale)
///
/// Built on 2024-08-26 at 17:21 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	ar(languageCode: 'ar', build: _StringsAr.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get publicFeed => 'Public Feed';
	String get businessFeed => 'Business Feed';
	String get home => 'Home';
	String get search => 'Search';
	String get createPost => 'Create Post';
	String get add => 'Add';
	String get chat => 'Chat';
	String get profile => 'Profile';
	String get feeds => 'Feeds';
	String get now => 'now';
	String get minutes => 'minutes';
	String get ago => 'ago';
	String get hour => 'hour';
	String get hours => 'hours';
	String get days => 'days';
	String get day => 'day';
	String get week => 'week';
	String get message => 'Message';
	String get typeSomething => 'Type Something';
	String get changeLang => 'change Language';
	String get post => 'Post';
	String get public => 'Public';
	String get business => 'Business';
	String get topic => 'Topic';
	String get pleaseWriteSomething => 'Please write something';
}

// Path: <root>
class _StringsAr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsAr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsAr _root = this; // ignore: unused_field

	// Translations
	@override String get publicFeed => 'المنشورات العامة';
	@override String get businessFeed => 'منشورات الأعمال';
	@override String get home => 'الصفحة الرئيسية';
	@override String get search => 'بحث';
	@override String get createPost => 'إنشاء منشور';
	@override String get add => 'إضافة';
	@override String get chat => 'دردشة';
	@override String get profile => 'الملف الشخصي';
	@override String get feeds => 'آخر الأخبار';
	@override String get now => 'الآن';
	@override String get minutes => 'دقائق';
	@override String get ago => 'منذ';
	@override String get hour => 'ساعة';
	@override String get hours => 'ساعات';
	@override String get days => 'أيام';
	@override String get day => 'يوم';
	@override String get week => 'أسبوع';
	@override String get message => 'رسالة';
	@override String get typeSomething => 'أكتب أي شيئ';
	@override String get changeLang => 'تغيير اللغة';
	@override String get post => 'نشر';
	@override String get public => 'عام';
	@override String get business => 'عمل';
	@override String get topic => 'الموضوع';
	@override String get pleaseWriteSomething => 'الرجاء كتابة شيء';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'publicFeed': return 'Public Feed';
			case 'businessFeed': return 'Business Feed';
			case 'home': return 'Home';
			case 'search': return 'Search';
			case 'createPost': return 'Create Post';
			case 'add': return 'Add';
			case 'chat': return 'Chat';
			case 'profile': return 'Profile';
			case 'feeds': return 'Feeds';
			case 'now': return 'now';
			case 'minutes': return 'minutes';
			case 'ago': return 'ago';
			case 'hour': return 'hour';
			case 'hours': return 'hours';
			case 'days': return 'days';
			case 'day': return 'day';
			case 'week': return 'week';
			case 'message': return 'Message';
			case 'typeSomething': return 'Type Something';
			case 'changeLang': return 'change Language';
			case 'post': return 'Post';
			case 'public': return 'Public';
			case 'business': return 'Business';
			case 'topic': return 'Topic';
			case 'pleaseWriteSomething': return 'Please write something';
			default: return null;
		}
	}
}

extension on _StringsAr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'publicFeed': return 'المنشورات العامة';
			case 'businessFeed': return 'منشورات الأعمال';
			case 'home': return 'الصفحة الرئيسية';
			case 'search': return 'بحث';
			case 'createPost': return 'إنشاء منشور';
			case 'add': return 'إضافة';
			case 'chat': return 'دردشة';
			case 'profile': return 'الملف الشخصي';
			case 'feeds': return 'آخر الأخبار';
			case 'now': return 'الآن';
			case 'minutes': return 'دقائق';
			case 'ago': return 'منذ';
			case 'hour': return 'ساعة';
			case 'hours': return 'ساعات';
			case 'days': return 'أيام';
			case 'day': return 'يوم';
			case 'week': return 'أسبوع';
			case 'message': return 'رسالة';
			case 'typeSomething': return 'أكتب أي شيئ';
			case 'changeLang': return 'تغيير اللغة';
			case 'post': return 'نشر';
			case 'public': return 'عام';
			case 'business': return 'عمل';
			case 'topic': return 'الموضوع';
			case 'pleaseWriteSomething': return 'الرجاء كتابة شيء';
			default: return null;
		}
	}
}
