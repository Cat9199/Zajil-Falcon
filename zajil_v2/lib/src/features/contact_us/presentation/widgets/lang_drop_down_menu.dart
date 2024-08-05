import 'package:flutter/material.dart';
import 'package:zajil_v2/src/core/api/constant_end_points.dart';
import 'package:zajil_v2/src/core/api/dio_factory.dart';

class LangDropDownMenu extends StatelessWidget {
  const LangDropDownMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        onSelected: (value) {
          Constants.language = value ?? 'ar';
          DioFactory.getDio();
        },
        inputDecorationTheme: InputDecorationTheme(
          constraints: BoxConstraints.tight(
            const Size(150, 45),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        initialSelection: Constants.language,
        textStyle: const TextStyle(color: Colors.black, fontSize: 15),
        dropdownMenuEntries: const [
          DropdownMenuEntry(
            value: 'ar',
            label: 'Arabic',
          ),
          DropdownMenuEntry(value: 'en', label: 'English'),
          DropdownMenuEntry(value: 'zh', label: 'Chinese'),
          DropdownMenuEntry(value: 'hi', label: 'Hindi'),
          DropdownMenuEntry(value: 'es', label: 'Spanish'),
        ]);
  }
}
