import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:innovative_net_test/core/themes/app_colors.dart';

class AppTextField extends StatefulWidget {
  final String? hint;
  final String? label;
  final double? labelSize;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String?)? onFieldSubmit;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final bool? autoFocus;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final Color? textColor;
  final double? textSize;
  final Color? backgroundColor;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final double? borderRound;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final int? minLines;
  final int? maxLines;
  final String? initialValue;
  final bool? enabled;
  final bool? readOnly;
  final Function(String?)? onChanged;
  final bool? expands;
  final bool? isDense;
  final Color? hintColor;
  final double? hintFontSize;
  final FontWeight? hintFontWeight;
  final bool isDatePicker;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final void Function(String)? onDateChanged;
  final void Function(PointerDownEvent)? onTapOutside;
  final Color? iconColor;
  final bool isSearchField;
  final Function? onCanceled;
  final BoxConstraints prefixIconConstraints;
  final List<TextInputFormatter>? inputFormatters;
  const AppTextField({
    super.key,
    this.hint,
    this.label,
    this.labelSize,
    this.controller,
    this.validator,
    this.onFieldSubmit,
    this.onEditingComplete,
    this.onTap,
    this.keyboardType,
    this.focusNode,
    this.autoFocus,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.contentPadding,
    this.backgroundColor,
    this.textInputAction,
    this.textAlign,
    this.textColor,
    this.textSize,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.borderRound,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.minLines,
    this.maxLines,
    this.initialValue,
    this.enabled,
    this.readOnly,
    this.onChanged,
    this.expands,
    this.isDense,
    this.hintColor,
    this.hintFontSize,
    this.hintFontWeight,
    this.isDatePicker = false,
    this.firstDate,
    this.lastDate,
    this.onDateChanged,
    this.onTapOutside,
    this.iconColor,
    this.isSearchField = false,
    this.onCanceled,
    this.prefixIconConstraints = const BoxConstraints(maxWidth: 30),
    this.inputFormatters,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      child: TextFormField(
        textDirection: TextDirection.ltr,
        textAlign: widget.textAlign ?? TextAlign.start,
        enabled: widget.enabled,
        readOnly: widget.readOnly ?? false,
        onTap: widget.onTap,
        autofocus: widget.autoFocus ?? false,
        inputFormatters: widget.inputFormatters,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: widget.initialValue,
        style: TextStyle(
          color: widget.textColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        onSaved: widget.onFieldSubmit,
        onTapOutside: widget.onTapOutside,
        onEditingComplete: widget.onEditingComplete,
        onChanged: (value) {
          setState(() {
            text = value;
          });
          widget.onChanged?.call(value);
        },
        expands: widget.expands ?? false,
        minLines: (widget.expands == true) ? null : widget.minLines,
        maxLines: (widget.expands == true)
            ? null
            : (widget.obscureText == true ? 1 : widget.maxLines),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: widget.hintColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: widget.isSearchField
              ? text.isEmpty
                    ? null
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.controller?.clear();
                            text = '';
                            widget.onCanceled?.call();
                            FocusScope.of(context).unfocus();
                          });
                        },
                        child: Icon(
                          Icons.close,
                          color: Get.theme.iconTheme.color,
                        ),
                      )
              : widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          prefixIconConstraints: widget.prefixIconConstraints,
          contentPadding:
              widget.contentPadding ??
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 5.w),
          isDense: widget.isDense,
          filled: true,
          fillColor: widget.backgroundColor ?? Colors.transparent,
          hintText: widget.hint,
          focusedErrorBorder:
              widget.errorBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent, width: 0.0),
                borderRadius: BorderRadius.circular(
                  (widget.borderRound ?? 12).r,
                ),
              ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular((widget.borderRound ?? 12).r),
          ),
          errorBorder:
              widget.errorBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.redAccent,
                  width: 0.0,
                ),
                borderRadius: BorderRadius.circular(
                  (widget.borderRound ?? 12).r,
                ),
              ),
          enabledBorder:
              widget.enabledBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(
                  (widget.borderRound ?? 12).r,
                ),
              ),
          focusedBorder:
              widget.focusedBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary, width: 1.0),
                borderRadius: BorderRadius.circular(
                  (widget.borderRound ?? 12).r,
                ),
              ),
        ),
        validator: widget.validator,
        controller: widget.controller,
        onFieldSubmitted: widget.onFieldSubmit,
        focusNode: widget.focusNode,
        keyboardType: widget.keyboardType,
        cursorColor: AppColors.primary,
        obscureText: widget.obscureText ?? false,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
      ),
    );
  }
}
