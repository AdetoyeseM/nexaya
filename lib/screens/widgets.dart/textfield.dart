import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key, required this.hintText, required this.label});

  final String? hintText, label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: TextFormField(
        decoration:   InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            hintText: hintText ?? "example@gmail.com",
            hintStyle: const TextStyle(
                color: Color(0xff765959),
                fontSize: 12,
                fontWeight: FontWeight.w400),
            label: Text(
             label ?? "Email",
              style: const TextStyle(
                  color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
            )),
      ),
    );
  }
}
