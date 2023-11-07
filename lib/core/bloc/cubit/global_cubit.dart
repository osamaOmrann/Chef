import 'package:chef/core/database/cache/cache_helper.dart';
import 'package:chef/core/services/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());
  bool isArabic = false;
  String langCode = 'ar';
  void changeLangToArabic() async {
    if (isArabic == true) return;
    emit(ChangeLangLoading());
    isArabic = true;
    langCode = 'ar';
    await sl<CacheHelper>().cacheLanguage(langCode);
    emit(ChangeLangSuccess());
  }

  void changeLangToEnglish() async {
    if (isArabic == false) return;
    emit(ChangeLangLoading());
    isArabic = false;
    langCode = 'en';
    await sl<CacheHelper>().cacheLanguage(langCode);
    emit(ChangeLangSuccess());
  }

  void getCachedLang() {
    emit(ChangeLangLoading());
    final cachedLang = sl<CacheHelper>().getCachedLanguage();
    langCode = cachedLang;
    emit(ChangeLangSuccess());
  }
}
