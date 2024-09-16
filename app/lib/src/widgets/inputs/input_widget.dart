import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label, hint, counter;
  final Widget? prefix, suffix;
  final String? initialValue;
  final Function(String) onChanged;
  const InputWidget({
    super.key,
    this.prefix,
    this.suffix,
    this.initialValue,
    required this.label,
    this.hint = "Hint",
    this.counter = "",
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      controller: controller,
      style: const TextStyle(
        // fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        labelText: label,
        hintText: hint,
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
    );
  }
}
