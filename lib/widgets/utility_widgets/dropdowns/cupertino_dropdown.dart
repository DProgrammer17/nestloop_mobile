import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';

class AppCupertinoDropdown extends StatefulWidget {
  final List<String> items;
  final String? hintText;
  final ValueChanged<String?>? onChanged;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Color? dropIconColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? dropDownTextColor;
  final Color? textColor;
  final String? dropdownValue;
  final bool withHint;
  final double? height;
  final double? paddingWidth;
  const AppCupertinoDropdown({
    super.key,
    required this.items,
    this.hintText,
    this.onChanged,
    required this.dropdownValue,
    this.dropIconColor,
    this.backgroundColor,
    this.dropDownTextColor,
    this.borderColor,
    this.textColor,
    this.height,
    this.paddingWidth,
    this.hintStyle,
    this.style,
    this.withHint = true,
  })  : assert(!withHint || (withHint && hintText != null),
  'hint text shouldn\'t be null if withHint is true');

  @override
  State<AppCupertinoDropdown> createState() => _AppCupertinoDropdownState();
}

class _AppCupertinoDropdownState extends State<AppCupertinoDropdown> {
  late final ValueNotifier<String?> dropdownValueNotifier =
  ValueNotifier(widget.dropdownValue);

  @override
  void didUpdateWidget(covariant AppCupertinoDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    dropdownValueNotifier.value = widget.dropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (widget.onChanged == null) return;

        dropdownValueNotifier.value = await _showPicker(
            context, widget.items, dropdownValueNotifier.value);
        widget.onChanged!(dropdownValueNotifier.value);
      },
      child: Container(
        height: widget.height ?? 52.ah,
        padding: EdgeInsets.symmetric(horizontal: widget.paddingWidth ?? 16.0.aw),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16.ar),
          border: Border.all(
            width: 0.5,
            color: widget.borderColor ?? Colors.transparent,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.withHint)
                    ValueListenableBuilder(
                        valueListenable: dropdownValueNotifier,
                        builder: (context, String? value, child) {
                          if (value == null) {
                            return const SizedBox.shrink();
                          }
                          return Text(
                            widget.hintText!,
                            style: widget.hintStyle ?? AppTextStyles.body1RegularInter(context),
                            textAlign: TextAlign.start,
                          );
                        }),
                  SizedBox(height: 3.ah),
                  ValueListenableBuilder(
                    valueListenable: dropdownValueNotifier,
                    builder: (context, String? value, child) {
                      return Text(
                        value ?? widget.hintText ?? '',
                        style:  value == null
                            ? widget.style ??
                            AppTextStyles.h3Inter(context).copyWith(
                              fontWeight: FontWeight.w400,
                              color:widget.textColor ?? AppColors.slateCharcoal80,
                            )
                            : widget.style ??
                            AppTextStyles.h3Inter(context).copyWith(
                              fontWeight: FontWeight.w400,
                              color:widget.dropDownTextColor ?? AppColors.slateCharcoal80,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.start,
                      );
                    },
                  ),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 24.ar,
              color: widget.dropIconColor ?? AppColors.slateCharcoalMain,
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _showPicker(
      BuildContext ctx, List<String> items, String? dropdownValue) async {
    String? dropdownValue;
    int valueIndex;
    valueIndex = -1;
      return await showCupertinoModalBottomSheet(
      context: ctx,
      builder: (_) => CupertinoActionSheet(
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.slateCharcoalMain,
                      width: 0.0,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CupertinoButton(
                      onPressed: () => Navigator.pop(
                          context,
                          dropdownValue ??
                              items[valueIndex == -1 ? 0 : valueIndex]),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 5.0,
                      ),
                      child: Text(
                        'Done',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.sp),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: AppConstants.deviceWidth,
                height: 200.ah,
                child: CupertinoPicker(
                  useMagnifier: false,
                  selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                    background: AppColors.slateCharcoal60.withOpacity(0.2),
                  ),
                  backgroundColor: Colors.white,
                  itemExtent: 50,
                  scrollController: FixedExtentScrollController(
                      initialItem: valueIndex == -1 ? 0 : valueIndex),
                  children: items.map((String value) {
                    return Center(
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 25.sp,
                          color: widget.dropDownTextColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  onSelectedItemChanged: (value) {
                    setState(
                          () {
                        dropdownValue = items[value];
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}