import 'package:flutter/material.dart';
import 'package:o_learning/pages/main_page.dart';
import 'package:o_learning/pages/welcome_page.dart';
import 'package:o_learning/repository/app_locale_repository.dart';
import 'package:o_learning/repository/auth_repository.dart';
import 'package:o_learning/repository/category_repository.dart';
import 'package:o_learning/utils/cache_helper.dart';
import 'package:o_learning/utils/object_helper.dart';
import 'package:o_learning/utils/page_helper.dart';
import 'package:provider/provider.dart';

class DefaultMiddleware extends StatefulWidget {
  final BuildContext context;

  DefaultMiddleware({this.context});

  @override
  _DefaultMiddleware createState() => _DefaultMiddleware(context: this.context);
}

class _DefaultMiddleware extends State<DefaultMiddleware> {
  final BuildContext context;

  _DefaultMiddleware({this.context});

  @override
  void initState() {
    super.initState();
    this.middleware();
  }

  Future<void> middleware() async {
    AppLocaleRepository appLocaleRepo =
        Provider.of<AppLocaleRepository>(this.context);
    AuthRepository authRepo = Provider.of<AuthRepository>(this.context);
    CacheHelper cacheHelper = new CacheHelper();
    CategoryRepository categoryRepository = new CategoryRepository();

    await cacheHelper.initial();
    await appLocaleRepo.initContext(context: this.context);
    await appLocaleRepo.loadAsset();
    await authRepo.initCacheHelper(cacheHelper);

    await precacheImage(
        Image.asset('lib/statics/experience_book_a_lot.png').image, context);
    await precacheImage(
        Image.asset('lib/statics/experience_book_base.png').image, context);
    await precacheImage(
        Image.asset('lib/statics/experience_book_little.png').image, context);
    await precacheImage(Image.asset('lib/statics/logo.png').image, context);
    await precacheImage(
        Image.asset('lib/statics/discovery_goal.png').image, context);
    await precacheImage(
        Image.asset('lib/statics/discovery_notification.png').image, context);
    await precacheImage(
        Image.asset('lib/statics/login_old_man.png').image, context);
    await precacheImage(
        Image.asset('lib/statics/login_man.png').image, context);
    await precacheImage(
        Image.asset('lib/statics/login_girl.png').image, context);

    // Mocks
    await precacheImage(
        Image.asset('lib/statics/mocks/course_web_development.png').image,
        context);
    await precacheImage(
        Image.asset('lib/statics/mocks/course_python.png').image, context);

    IUserCache userCache = await cacheHelper.getUser();
    if (userCache != null) {
      authRepo.setEmail(userCache.email);
      authRepo.setAccessToken(userCache.access_token);
      await authRepo.fetchMe();
      await categoryRepository.fetchMyCourse();

      if (categoryRepository.myCourseItems.length > 0) {
        authRepo.setCourseId(categoryRepository.myCourseItems[0].id);
        authRepo.setCourseName(categoryRepository.myCourseItems[0].title);
      }
    } else {
      await categoryRepository.fetchAllCourse();
    }

    if (authRepo.isNotAuth) {
      pageLauncher(WelcomePage(), context);
    } else {
      pageLauncher(MainPage(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
