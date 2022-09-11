import 'package:flutter/material.dart';
import 'package:saldah_shop/components/text_field_container.dart';
import 'package:saldah_shop/app/app_consts.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: AppColors.darkGrey,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: AppColors.darkGrey,
          ),
          // suffixIcon: Icon(
          //   Icons.visibility,
          //   color: AppColors.kPrimaryColor,
          // ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
