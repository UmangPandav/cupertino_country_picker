import 'package:cupertino_country_picker/utils/country_code_enum.dart'
    show CountryCodeEnum;
import 'package:cupertino_country_picker/widget/country_picker_decoration.dart'
    show CountryPickerDecoration;
import 'package:cupertino_country_picker/widget/fade_animation.dart'
    show FadeAnimation, FadeFrom;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoButton, CupertinoListTile;
import 'package:cupertino_country_picker/utils/context.dart';
import 'package:cupertino_country_picker/helper/country_picker_helper.dart'
    show CountryPickerHelper;
import 'package:cupertino_country_picker/utils/const.dart'
    show borderRadius, defaultPadding, physics;
import 'package:cupertino_country_picker/utils/hide_keyboard.dart'
    show hideKeyboard;
import 'package:cupertino_country_picker/model/country_model.dart'
    show CountryModel;
import 'package:flutter/services.dart' show SystemSound, SystemSoundType;

Future<void> showCupertinoCountryPicker({
  required BuildContext context,
  required Function(CountryModel) onCountryPicked,
  List<CountryCodeEnum>? allowedCountries,
  CountryPickerDecoration decoration = const CountryPickerDecoration(),
}) async {
  hideKeyboard(context: context);

  final countryList = CountryPickerHelper.countryList;
  final List<CountryModel> allowedCountriesList = allowedCountries != null
      ? countryList
          .where(
              (country) => allowedCountries.contains(country.countryCodeEnum))
          .toList()
      : countryList;

  final filteredCountryListNotifier =
      ValueNotifier<List<CountryModel>>(allowedCountriesList);

  final searchController = TextEditingController();
  final searchTextNotifier = ValueNotifier('');

  Future<void> onChange(String query) async {
    searchTextNotifier.value = query.trim();
    filteredCountryListNotifier.value = CountryPickerHelper.getListByQuery(
        query.trim(),
        allowedCountryList: allowedCountriesList);
  }

  return await showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    barrierColor:
        context.isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black38,
    constraints: BoxConstraints(maxHeight: context.h * 0.75),
    sheetAnimationStyle: AnimationStyle(curve: Curves.bounceInOut),
    backgroundColor:
        decoration.backgroundColor ?? context.theme.scaffoldBackgroundColor,
    shape: decoration.shape ??
        RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(borderRadius))),
    builder: (context) {
      return Theme(
        data: context.theme,
        child: SafeArea(
          top: false,
          left: false,
          right: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                primary: false,
                leadingWidth: 60,
                centerTitle: true,
                toolbarHeight: 45,
                scrolledUnderElevation: 0,
                shadowColor: Colors.transparent,
                automaticallyImplyLeading: false,
                backgroundColor: decoration.appBarBackgroundColor ??
                    context.bottomSheetAppBarColor,
                leading: CupertinoButton(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.only(left: defaultPadding),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    decoration.closeButtonText,
                    style: (decoration.closeButtonTextStyle as TextStyle? ??
                            context.titleMediumThick)
                        .copyWith(color: Colors.blue.shade600),
                  ),
                ),
                title: Text(decoration.titleText,
                    style: (decoration.titleTextStyle as TextStyle?) ??
                        context.titleMediumThick,
                    textScaler: TextScaler.linear(1.05),
                    textAlign: TextAlign.center),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(borderRadius))),
              ),
              context.divider(height: 0),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (decoration.canSearch)
                        Container(
                          decoration:
                              BoxDecoration(boxShadow: context.boxShadow),
                          padding: EdgeInsets.only(bottom: defaultPadding),
                          child: TextFormField(
                            cursorWidth: 1.5,
                            cursorHeight: 18,
                            onChanged: onChange,
                            style: context.titleMedium,
                            controller: searchController,
                            cursorColor: context.theme.dividerColor,
                            textInputAction: TextInputAction.search,
                            cursorRadius: const Radius.circular(10000),
                            keyboardAppearance:
                                context.theme.colorScheme.brightness,
                            onTapOutside: (event) =>
                                hideKeyboard(context: context),
                            decoration: decoration.searchInputDecoration ??
                                InputDecoration(
                                  filled: true,
                                  isDense: true,
                                  hintText: 'Search',
                                  hoverColor: Colors.transparent,
                                  fillColor: decoration.cardColor ??
                                      context.theme.cardColor,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: defaultPadding),
                                  hintStyle: context.titleMedium
                                      .copyWith(color: context.black50),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(borderRadius),
                                      borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(borderRadius),
                                      borderSide: context.borderSide),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(borderRadius),
                                      borderSide: context.borderSide),
                                  suffixIcon: ValueListenableBuilder(
                                      valueListenable: searchTextNotifier,
                                      builder: (_, searchText, __) {
                                        if (searchText.trim().isNotEmpty) {
                                          return CupertinoButton(
                                            minimumSize: Size.zero,
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              searchController.clear();
                                              onChange('');
                                            },
                                            child: Icon(Icons.cancel_rounded,
                                                color:
                                                    context.theme.dividerColor),
                                          );
                                        }

                                        return SizedBox.shrink();
                                      }),
                                ),
                          ),
                        ),
                      Flexible(
                        child: ValueListenableBuilder(
                          valueListenable: filteredCountryListNotifier,
                          builder: (_, filteredList, __) {
                            if (filteredList.isEmpty) {
                              return FadeAnimation(
                                fadeFrom: FadeFrom.bottom,
                                child: Center(
                                    child: Text('Country not found',
                                        style: context.titleMedium)),
                              );
                            }
                            return Container(
                              decoration: context.boxDecoration
                                  .copyWith(color: decoration.cardColor),
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: physics,
                                itemCount: filteredList.length,
                                itemBuilder: (_, index) {
                                  final data = filteredList[index];
                                  final isFirst = index == 0;
                                  final isLast =
                                      index == filteredList.length - 1;
                                  return ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(
                                            isFirst ? borderRadius : 0),
                                        bottom: Radius.circular(
                                            isLast ? borderRadius : 0)),
                                    child: FadeAnimation(
                                      key: ValueKey(index),
                                      child: LongPressDraggable<int>(
                                        data: index,
                                        feedback: SizedBox.shrink(),
                                        delay: Duration(milliseconds: 250),
                                        onDragStarted: () {
                                          SystemSound.play(
                                              SystemSoundType.click);
                                        },
                                        child: DragTarget<int>(
                                            onWillAcceptWithDetails:
                                                (draggedIndex) => true,
                                            onAcceptWithDetails: (_) {
                                              Navigator.pop(context);
                                              onCountryPicked(data);
                                            },
                                            builder: (_, candidateData,
                                                rejectedData) {
                                              final isHovered =
                                                  candidateData.isNotEmpty;
                                              return MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                child: AnimatedContainer(
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                  color: isHovered
                                                      ? context
                                                          .theme.dividerColor
                                                          .withValues(
                                                              alpha: 0.05)
                                                      : null,
                                                  child: CupertinoListTile(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      onCountryPicked(data);
                                                    },
                                                    backgroundColorActivated:
                                                        context
                                                            .theme.dividerColor
                                                            .withValues(
                                                                alpha: 0.05),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical:
                                                                defaultPadding *
                                                                    0.5,
                                                            horizontal:
                                                                defaultPadding),
                                                    leading: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3),
                                                        child: Image.asset(
                                                            data.flag,
                                                            width: 30,
                                                            package:
                                                                CountryPickerHelper
                                                                    .packageName)),
                                                    title: Text(data.name,
                                                        style:
                                                            context.titleMedium,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                    trailing: Text(
                                                        data.callingCode,
                                                        style: context
                                                            .titleMedium
                                                            .copyWith(
                                                                color: context
                                                                    .black50)),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (_, index) {
                                  return context.divider(height: 0);
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
