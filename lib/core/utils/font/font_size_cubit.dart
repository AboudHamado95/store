
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:store_app/core/utils/font/font_manager.dart';

import '../../constants/enums.dart';
import 'font_size_cache_helper.dart';

part 'font_size_state.dart';

class FontSizeCubit extends Cubit<FontSizeState> {
  FontSizeCubit() : super(FontSizeInitial());
  FontSize fontSize = FontSize.medium;
  Future<FontSize> choosenCashedFontSize() async {
    final fontSizeIndex = await FontSizeCacheHelper().getCachedFontSizeIndex();
    if (fontSizeIndex == 0) {
      return FontSize.small;
    } else if (fontSizeIndex == 1) {
      return FontSize.medium;
    } else if (fontSizeIndex == 2) {
      return FontSize.large;
    } else {
      return FontSize.medium;
    }
  }


  FontSize selectedFontSizeInitialValue = FontSize.medium;
  Future<void> getCurrentFontSize() async {
    final fontSizeIndex = await FontSizeCacheHelper().getCachedFontSizeIndex();
    fontSize = FontSize.values
        .firstWhere((fontSize) => fontSize.index == fontSizeIndex);

    emit(FontSizeLoadedState(
        fontSize: FontManagerStyles().appFontSize[fontSize]!));
  }

  Future<void> fontSizeChanged({required FontSize fontSize}) async {
    final fontIndex = fontSize.index;
    await FontSizeCacheHelper().cacheFontSizeIndex(fontIndex);
    


    emit(FontSizeLoadedState(
        fontSize: FontManagerStyles().appFontSize[fontSize]!));
  }

  Future<void> chooseFontSizeFromDialog({required FontSize value}) async {
    fontSize = value;
    emit(FontSizeChooseDoneFromDialog(fontSize: value));
  }
}
