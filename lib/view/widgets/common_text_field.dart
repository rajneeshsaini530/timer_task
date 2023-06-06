import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final bool? isPassword;
  final TextInputType? inputType;
  final bool? showBorder;
  final bool? isContainer;
  final double? horizontalMargin;
  final List<TextInputFormatter>? inputFormatter;
  final String? Function(String?)? validator;

  const CommonTextField(
      {Key? key,
      this.controller,
      this.hint,
      this.isPassword = false,
      this.isContainer = false,
      this.showBorder = true,
      this.inputFormatter = const [],
      this.horizontalMargin = 28,
      this.inputType = TextInputType.text, this.validator})
      : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool isShow = true;

  @override
  void initState() {
    isShow = widget.isPassword!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.inputFormatter!,
      keyboardType: widget.inputType,
      obscureText: isShow,
      maxLines: widget.isContainer! ? 6 : 1,
      controller: widget.controller,
      validator: widget.validator!,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: widget.hint,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.grey.withOpacity(.5),
        ),
        suffixIconConstraints: BoxConstraints(
            maxWidth:
                widget.isPassword! ? double.infinity : double.minPositive),
        suffixIcon: widget.isPassword!
            ? Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                  onTap: () {
                    setState(() {
                      isShow = !isShow;
                    });
                  },
                  child: Icon(
                    !isShow
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.grey.withOpacity(.5),
                  ),
                ),
            )
            : const SizedBox(
                width: 0,
              ),
      ),
    );
  }
}
