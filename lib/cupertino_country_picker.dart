import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoButton, CupertinoListTile;
import 'package:cupertino_country_picker/utils/context.dart';
import 'package:cupertino_country_picker/helper/country_picker_helper.dart'
    show CountryPickerHelper;
import 'package:cupertino_country_picker/utils/const.dart'
    show borderRadius, defaultPadding, physics;
import 'package:cupertino_country_picker/utils/hide_keyboard.dart'
    show hideKeyboard;
import 'package:cupertino_country_picker/widget/fade_animation.dart'
    show FadeAnimation;
import 'package:cupertino_country_picker/model/country_model.dart'
    show CountryModel;
import 'package:flutter/services.dart' show SystemSound, SystemSoundType;

Future<void> showCupertinoCountryPicker({
  required BuildContext context,
  required Function(CountryModel) onCountryPicked,
  String titleText = 'Country',
  String closeButtonText = 'Close',
  TextStyle? titleTextStyle,
  TextStyle? closeButtonTextStyle,
  Color? backgroundColor,
  Color? cardColor,
  ShapeBorder? shape,
  InputDecoration? searchInputDecoration,
}) async {
  hideKeyboard(context: context);

  final countryList = CountryPickerHelper.countryList;
  final filteredCountryListNotifier = ValueNotifier(countryList);

  final searchController = TextEditingController();

  Future<void> onChange(String query) async {
    filteredCountryListNotifier.value =
        CountryPickerHelper.getListByQuery(query);
  }

  return await showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    barrierColor:
        context.isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black38,
    constraints: BoxConstraints(maxHeight: context.h * 0.75),
    sheetAnimationStyle: AnimationStyle(curve: Curves.bounceInOut),
    backgroundColor: backgroundColor ?? context.theme.scaffoldBackgroundColor,
    shape: shape ??
        RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(borderRadius))),
    builder: (context) {
      return Theme(
        data: context.theme,
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: defaultPadding,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(titleText,
                        style: titleTextStyle ?? context.titleMediumThick),
                    CupertinoButton(
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(closeButtonText,
                            style: closeButtonTextStyle ??
                                context.titleMediumThick
                                    .copyWith(color: Colors.red.shade600))),
                  ],
                ),
                SizedBox(height: defaultPadding * 0.5),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(boxShadow: context.boxShadow),
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
                          onTapOutside: (event) {
                            hideKeyboard(context: context);
                          },
                          decoration: searchInputDecoration ??
                              InputDecoration(
                                filled: true,
                                isDense: true,
                                hintText: 'Search',
                                hoverColor: Colors.transparent,
                                fillColor: cardColor ?? context.theme.cardColor,
                                contentPadding: EdgeInsets.all(defaultPadding),
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
                                suffixIcon: CupertinoButton(
                                  minSize: 0,
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    searchController.clear();
                                    onChange('');
                                  },
                                  child: Icon(Icons.cancel_rounded,
                                      color: context.theme.dividerColor),
                                ),
                              ),
                        ),
                      ),
                      SizedBox(height: defaultPadding),
                      Flexible(
                        child: ValueListenableBuilder(
                          valueListenable: filteredCountryListNotifier,
                          builder: (_, filteredList, __) {
                            if (filteredList.isEmpty) {
                              return Center(
                                  child: Text('Country not found',
                                      style: context.titleMedium));
                            }
                            return Container(
                              decoration: context.boxDecoration
                                  .copyWith(color: cardColor),
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
                                            builder: (context, candidateData,
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
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
