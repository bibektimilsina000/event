import 'package:event/config/theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? textEditingController;
  final Widget? icon;
  final Widget? trallingIcon;
  final bool? obscureText;

  const CustomTextField({
    super.key,
    this.hintText,
    this.textEditingController,
    this.icon,
    this.obscureText,
    this.trallingIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _hasFocus = false;
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText ?? false,
      controller: widget.textEditingController,
      focusNode: _focusNode,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: widget.icon,
        ),
        suffixIcon: _hasFocus
            ? Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: widget.trallingIcon,
              )
            : null,
        hintText: widget.hintText,
        filled: true,
        fillColor: _hasFocus
            ? ColorConstant.darkBlueWithWhiteShade
            : Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
