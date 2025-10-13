import 'package:flutter_bloc/flutter_bloc.dart';

class SelectionCubit extends Cubit<String> {
  SelectionCubit(super.initialLocaleCode);

  void selectLanguage(String languageCode) {
    if (languageCode != state) {
      emit(languageCode);
    }
  }
}
