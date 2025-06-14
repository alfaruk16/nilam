import 'package:flutter/material.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/utils/text_styles.dart';
import 'package:nilam/core/widgets/text.dart';

class TextFieldB extends StatefulWidget {
  final String? hintText, fieldTitle, labelText, errorText, helperText;
  final double? paddingHeight, paddingWidth, height;
  final TextStyle? textStyle;
  final bool isReadOnly;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? maxLength;
  final TextEditingController? controller;
  final FocusNode focusNode;
  final bool obscureText;
  final TextInputType? textInputType;
  final TextAlign? textAlign;
  final VoidCallback? onTouch;
  final Function onChanged;
  final Color? bgColor, hintColor;
  final bool isMandatory;
  final double labelSize;
  final bool loading;
  final bool isDate;

  const TextFieldB(
      {Key? key,
      this.hintText = "",
      this.fieldTitle = "",
      this.textStyle = bBody2,
      this.labelText,
      this.errorText = '',
      this.helperText = '',
      this.maxLines = 1,
      this.maxLength,
      this.controller,
      required this.focusNode,
      this.obscureText = false,
      this.textInputType = TextInputType.text,
      this.suffixIcon,
      this.prefixIcon,
      this.textAlign = TextAlign.start,
      this.paddingHeight = 5,
      this.paddingWidth = 15,
      this.onTouch,
      this.height,
      this.bgColor,
      required this.onChanged,
      this.isReadOnly = false,
      this.isMandatory = false,
      this.hintColor,
      this.labelSize = 16,
      this.loading = false,
      this.isDate = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TextField();
  }
}

class _TextField extends State<TextFieldB> {
  @override
  Widget build(BuildContext context) {
    widget.focusNode.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.fieldTitle != null && widget.fieldTitle != '')
          Row(
            children: [
              TextB(
                text: widget.fieldTitle!,
                textStyle: TextStyle(fontSize: widget.labelSize),
                fontColor: nDark,
              ),
              const SizedBox(width: 5),
              if (widget.isMandatory)
                const TextB(
                  text: '*',
                  textStyle: bBody1,
                  fontColor: nBrand,
                ),
            ],
          ),
        if (widget.fieldTitle != null && widget.fieldTitle != '')
          const SizedBox(height: 5),
        TextField(
          readOnly: widget.isReadOnly,
          obscureText: widget.obscureText,
          keyboardType: widget.textInputType!,
          onTap: widget.onTouch,
          onChanged: (value) {
            widget.onChanged(value);
          },
          textInputAction: TextInputAction.next,
          cursorColor: nGray,
          style: widget.textStyle!,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          controller: widget.controller,
          focusNode: widget.focusNode,
          textAlign: widget.textAlign!,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon != null
                ? Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Icon(
                      widget.prefixIcon,
                      color: nLightGray,
                    ),
                  )
                : null,
            suffixIconConstraints:
                const BoxConstraints(minHeight: 16, minWidth: 16),
            counterText: widget.maxLength == null ? '' : null,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: widget.paddingWidth!,
              vertical: widget.paddingHeight!,
            ),
            suffixIcon: (widget.loading && (widget.isReadOnly))
                ? Container(
                    height: 16,
                    width: 16,
                    margin: const EdgeInsets.only(right: 12),
                    child: const CircularProgressIndicator(
                        color: nGray, strokeWidth: 2))
                : widget.suffixIcon != null
                    ? Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: widget.suffixIcon)
                    : null,
            labelText: widget.labelText,
            labelStyle: const TextStyle(color: nGray, fontSize: 14),
            hintText: widget.hintText!,
            hintStyle: TextStyle(color: widget.hintColor),
            fillColor: widget.bgColor ?? const Color(0XFFF1F4FA),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(7),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
        if (widget.errorText != "")
          TextB(
            text: widget.errorText!,
            fontSize: 12,
            fontColor: nBrand,
          ),
      ],
    );
  }
}
