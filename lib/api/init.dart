import 'package:get/get.dart';
import 'package:quotes/api/local_storage_api.dart';
import 'package:quotes/api/web_api.dart';
import 'package:quotes/constants/constants.dart';
import 'package:quotes/controlers/all_quote_controler.dart';
import 'package:quotes/controlers/auther_quote_controler.dart';
import 'package:quotes/controlers/favorate_quote_controler.dart';
import 'package:quotes/repos/cache_quote_repo.dart';
import 'package:quotes/repos/favorate_quotes_repo.dart';
import 'package:quotes/repos/web_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  // apis
  Get.lazyPut(
    () => WebApi(homeUrl: AppConstants.baseUrl),
  );
  Get.lazyPut(
    () => LocalStorageApi(sharedPreferences),
  );

  // repos
  Get.lazyPut(() => WebRepo(Get.find<WebApi>()));
  Get.lazyPut(() => FavorateQuoteRepo(Get.find<LocalStorageApi>()));
  Get.lazyPut(() => CacheQuoteRepo(Get.find<LocalStorageApi>()));

  // controlers

  Get.lazyPut(() =>
      AutherQuoteControler(Get.find<WebRepo>(), Get.find<CacheQuoteRepo>()));
  Get.lazyPut(
      () => AllQuoteControler(Get.find<WebRepo>(), Get.find<CacheQuoteRepo>()));
  Get.lazyPut(() => FavorateQuoteControler(Get.find<FavorateQuoteRepo>()));
}
