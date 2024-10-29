import 'package:flutter/material.dart';
import 'package:calendar_scheduler/const/color.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool expand;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final String? initialValue;

  const CustomTextField({
    super.key,
    required this.label,
    this.expand = false,
    required this.onSaved,
    required this.validator,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (!expand) renderTextFormField(),
        if (expand)
          Expanded(
            child: renderTextFormField(),
          ),
      ],
    );
  }

  Widget renderTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],
      ),
      // 저장했을때
      onSaved: onSaved,
      // 검증할때 로직
      validator: validator,
      minLines: expand ? null : 1,
      maxLines: expand ? null : 1,
      expands: expand,
      cursorColor: Colors.grey,
      initialValue: initialValue,
    );
  }
}
