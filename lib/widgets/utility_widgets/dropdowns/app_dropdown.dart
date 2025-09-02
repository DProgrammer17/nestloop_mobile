import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';

class AppDropDownField extends StatefulWidget {
  final List<String> list;
  final String labelText;
  final double? width;
  final double? height;
  final Function(String) onChanged;
  final TextEditingController? controller;
  final TextStyle? style;
  final TextStyle? itemStyle;
  const AppDropDownField({
    super.key,
    this.controller,
    required this.list,
    this.labelText = '',
    required this.onChanged,
    this.width,
    this.height,
    this.style,
    this.itemStyle,
  });

  @override
  State<AppDropDownField> createState() =>
      _AppDropDownFieldState();
}

class _AppDropDownFieldState extends State<AppDropDownField> {
  @override
  void initState() {
    super.initState();
    selectedValue = widget.controller?.text ?? widget.list[0];
  }

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 52.ah,
      width: widget.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.baseBackground,
          borderRadius: BorderRadius.circular(16.ar),
          border: Border.all(
            color: Colors.transparent,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: DropdownButtonFormField(
                  icon: const SizedBox.shrink(),
                  value: selectedValue,
                  decoration: InputDecoration(
                    labelText:
                    selectedValue == widget.list[0] ? "" : widget.labelText,
                    floatingLabelStyle: widget.style ?? AppTextStyles.h3Inter(context).copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.slateCharcoal80,
                    ),
                    labelStyle:  widget.style ?? AppTextStyles.h3Inter(context).copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.slateCharcoal80,
                    ),
                    contentPadding: EdgeInsets.only(
                      top:  -20.ah,
                      left: 15.aw,
                    ),
                    border: InputBorder.none,
                  ),
                  style: widget.style ??  AppTextStyles.h3Inter(context).copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.slateCharcoal80,
                  ),
                  items: widget.list.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        e,
                        softWrap: true,
                        style: widget.itemStyle ?? AppTextStyles.h3Inter(context).copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.slateCharcoal80,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? val) {
                    widget.onChanged.call(val ?? widget.list.first);
                    setState(() {
                      selectedValue = val;
                      widget.controller?.text = selectedValue ?? "";
                    });
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(right: 5.aw),
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.slateCharcoalMain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}