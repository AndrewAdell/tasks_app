import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key, required this.onChanged, required this.obscureText});
  Function(String) onChanged;
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required ';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white))),
    );
  }
}

// class CustomTextField extends StatelessWidget {          
//   const CustomTextField(
//       {super.key,
//       required this.hint,
//       this.maxLines = 1,
//       this.onSaved,
//       this.onChanged});

//   final String hint;
//   final int maxLines;

//   final void Function(String?)? onSaved;

//   final Function(String)? onChanged;
//   @override
//   Widget build(BuildContext context) {         
//     return TextFormField(
//       onChanged: onChanged,
//       onSaved: onSaved,
//       validator: (value) {
//         if (value?.isEmpty ?? true) {
//           return 'Field is required ';
//         } else {
//           return null;
//         }
//       },
//       cursorColor: kPrimaryColor,
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         hintText: hint,
//         border: buildBorder(),
//         enabledBorder: buildBorder(),
//         focusedBorder: buildBorder(kPrimaryColor),
//       ),
//     );
//   }

//   OutlineInputBorder buildBorder([color]) {
//     return OutlineInputBorder(
//         borderRadius: BorderRadius.circular(
//           8,
//         ),
//         borderSide: BorderSide(
//           color: color ?? Colors.white,
//         ));
//   }
// }
