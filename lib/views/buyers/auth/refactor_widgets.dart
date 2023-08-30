import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../widget_setting/color_collections.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.hintText,
      this.labelText,
      this.prefixIcon,
      this.suffixIcon,
      this.keyboardType,
      this.validator,
      this.onChanged // New parameter
      });

  final String? hintText, labelText;
  final Widget? prefixIcon, suffixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          onTapOutside: (event) {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          cursorColor: textOrange,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: textOrange),
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffix: suffixIcon,
            labelText: labelText,
            labelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: textBlack,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: textOrange, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: textOrange, width: 1),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;

  CustomPasswordField({
    required this.onChanged,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          onChanged: widget.onChanged,
          validator: widget.validator,
          onTapOutside: (event) {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          obscureText: _obscureText,
          cursorColor: textOrange,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textOrange,
          ),
          decoration: InputDecoration(
            hintText: 'Enter password',
            prefixIcon: Icon(
              Icons.lock_outline,
              color: textOrange,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              icon: Icon(
                _obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: textOrange,
              ),
            ),
            labelText: 'Password',
            labelStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: textBlack),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: textOrange, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: textOrange, width: 1),
            ),
          ),
        ),
      ),
    );
  }
}
errorFlutterToast(String msg){
  Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
  return;
}
successFlutterToast(String msg){
  Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
  return;
}