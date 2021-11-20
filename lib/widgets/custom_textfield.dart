import 'package:ar_portal/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ar_portal/utils/extensions.dart';

enum ValidType { none, name, password, email }

class CustomTextField extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final bool showSuffix;
  final bool obscureText;
  final VoidCallback? onSuffixIconTap;
  final ValidType validType;
  final bool enabled;
  final Function(bool)? onValid;
  final TextCapitalization textCapitalization;
  final String Function(String?)? validator;
  final String? hintText;
  final Color? colorDisable;
  final int? maxLength;
  final String? textError;
  final double? width;
  const CustomTextField({
    Key? key,
    this.label,
    this.controller,
    this.suffixIcon,
    this.inputFormatters,
    this.keyboardType,
    this.onChanged,
    this.showSuffix = false,
    this.obscureText = false,
    this.onSuffixIconTap,
    this.validType = ValidType.none,
    this.enabled = true,
    this.onValid,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.hintText,
    this.colorDisable,
    this.maxLength,
    this.textError,
    this.width,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hasChanged = false;
  bool valid = false;
  @override
  void initState() {
    if (widget.controller != null && widget.controller!.text.isNotEmpty) {
      hasChanged = true;
    }
    switch (widget.validType) {
      case ValidType.none:
        valid = true;
        break;
      case ValidType.name:
        if (widget.controller != null &&
            widget.controller!.text.isValidName()) {
          valid = true;
        } else {
          valid = false;
        }
        break;
      case ValidType.password:
        if (widget.controller != null &&
            widget.controller!.text.isValidPassword()) {
          valid = true;
        } else {
          valid = false;
        }
        break;
      case ValidType.email:
        if (widget.controller != null &&
            widget.controller!.text.isValidEmail()) {
          valid = true;
        } else {
          valid = false;
        }
        break;
    }
    super.initState();
  }

  String getError() {
    if (widget.textError != null) {
      return '${widget.textError}';
    }
    switch (widget.validType) {
      case ValidType.none:
        return '';
      case ValidType.name:
        return 'Name is too short';
      case ValidType.password:
        return 'Password is too short';
      case ValidType.email:
        return "Invalid Email";
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      textCapitalization: widget.textCapitalization,
      enabled: widget.enabled,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon != null
            ? GestureDetector(
                onTap: widget.onSuffixIconTap, child: widget.suffixIcon)
            : null,
        hintText: widget.hintText,
        errorText:
            (!valid && hasChanged) && getError().isNotEmpty ? getError() : null,
        hintStyle: AppStyles.textSize14(color: Colors.grey),
      ),
      onChanged: (value) {
        if (hasChanged == false && value.isNotEmpty) {
          setState(() {
            hasChanged = true;
          });
        }
        switch (widget.validType) {
          case ValidType.none:
            break;
          case ValidType.name:
            if (value.isValidName()) {
              setState(() {
                valid = true;
              });
            } else {
              setState(() {
                valid = false;
              });
            }
            break;
          case ValidType.password:
            if (value.isValidPassword()) {
              setState(() {
                valid = true;
              });
            } else {
              setState(() {
                valid = false;
              });
            }
            break;
          case ValidType.email:
            if (value.isValidEmail()) {
              setState(() {
                valid = true;
              });
            } else {
              setState(() {
                valid = false;
              });
            }
            break;
        }
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
        if (widget.onValid != null) {
          widget.onValid!(valid);
        }
      },
    );
  }
}
