import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:task1/presentation/styles/colors.dart';

class DefaultPhoneFormField extends StatelessWidget {
  final TextEditingController? controller;
  final InputBorder? border;
  final String? hintText;
  final String? Function(String?)? validator;

  const DefaultPhoneFormField(
      {Key? key,
      required this.controller,
      this.border = const OutlineInputBorder(borderSide: BorderSide(width: 1)),
      this.hintText = 'Eg. 812345678',
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: CountryCodePicker(
          onChanged: print,
          initialSelection: 'EG',
          favorite: const ['+20', 'EG'],
          textStyle: TextStyle(fontSize: 12.sp),
          searchStyle: TextStyle(fontSize: 12.sp),
        ),
        isDense: true,
        border: border,
        hintText: hintText,
        hintStyle: TextStyle(color: defaultGreyColor, fontSize: 11.sp),
        hintTextDirection: TextDirection.ltr,
      ),
    );
  }
}
