import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({
    super.key,
    required this.hintText,
    required this.textInputType,
    required this.textEditingController,
    this.isPass = false,
    this.icon,
  });

  final String hintText;
  final TextInputType textInputType;
  final bool isPass;
  final TextEditingController textEditingController;
  final IconData? icon;

  @override
  InputTextFieldState createState() => InputTextFieldState();
}

class InputTextFieldState extends State<InputTextField> {
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isPass;
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: Divider.createBorderSide(context, color: const Color.fromARGB(255, 220, 220, 220), width: 1.0),
    );

    return TextField(
      controller: widget.textEditingController,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(8),
        prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
        suffixIcon: widget.isPass
            ? IconButton(
                icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              )
            : null,
      ),
      keyboardType: widget.textInputType,
      obscureText: _isObscured,
    );
  }
}
