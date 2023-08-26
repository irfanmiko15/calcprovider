// import 'dart:io';


// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';


// class DefaultFormField extends StatelessWidget {
//   final BuildContext context;
//   final FocusNode focus;
//   final FocusNode nextFocus;
//   final String label;
//   final String hint;
//   final IconData icon;
//   final String initialValue;
//   final FormFieldValidator<String> validator;
//   final FormFieldSetter<String> onSaved;
//   final TextInputType inputType;
//   final int maxLength;
//   final int minLines;
//   final int maxLines;
//   final List<TextInputFormatter> inputFormatters;
//   final TextInputAction textInputAction;
//   final TextCapitalization textCapitalization;
//   final ValueChanged<String> onChanged;
//   final GestureTapCallback onTap;
//   final VoidCallback onEditingComplete;
//   final bool readOnly;
//   final bool enabled;
//   final AutovalidateMode autovalidateMode;
//   final FloatingLabelBehavior floatingLabelBehavior;
//   final bool filled;
//   final InputBorder border;

//   final TextEditingController controller;

//   final TextStyle errorStyle;

//   const DefaultFormField({
//     Key key,
//     @required this.context,
//     this.focus,
//     this.nextFocus,
//     this.label,
//     this.icon,
//     this.initialValue,
//     this.validator,
//     this.onSaved,
//     this.inputType,
//     this.maxLength,
//     this.minLines,
//     this.maxLines,
//     this.textInputAction = TextInputAction.done,
//     this.textCapitalization = TextCapitalization.none,
//     this.controller,
//     this.errorStyle,
//     this.inputFormatters,
//     this.readOnly = false,
//     this.onChanged,
//     this.onTap,
//     this.onEditingComplete,
//     this.floatingLabelBehavior = FloatingLabelBehavior.always,
//     this.enabled = true,
//     this.autovalidateMode = AutovalidateMode.disabled,
//     this.hint = '',
//     this.filled = true,
//     this.border = const UnderlineInputBorder(),
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       focusNode: focus,
//       controller: controller,
//       minLines: minLines,
//       maxLines: maxLines,
//       readOnly: readOnly,
//       enabled: enabled,
//       initialValue: initialValue,
//       textCapitalization: textCapitalization,
//       inputFormatters: inputFormatters,
//       decoration: InputDecoration(
//         border: border,
//         errorStyle: errorStyle,
//         filled: filled,
//         icon: icon != null ? Icon(icon) : null,
//         hintText: hint,
//         labelText: label,
//         floatingLabelBehavior: floatingLabelBehavior,
//       ),
//       maxLength: maxLength,
//       onTap: onTap,
//       onChanged: onChanged,
//       onEditingComplete: onEditingComplete,
//       autovalidateMode: autovalidateMode,
//       textInputAction: textInputAction,
//       onSaved: onSaved,
//       onFieldSubmitted: (term) {
//         if (nextFocus != null) {
//           FocusScope.of(context).requestFocus(nextFocus);
//         } else {
//           focus.unfocus();
//         }
//       },
//       validator: validator,
//       keyboardType: inputType,
//     );
//   }
// }

// Widget phoneField({
//   @required BuildContext context,
//   FocusNode focus,
//   FocusNode nextFocus,
//   IconData icon,
//   String initialValue,
//   TextInputAction textInputAction = TextInputAction.done,
//   @required String label,
//   @required FormFieldValidator<String> validator,
//   @required FormFieldSetter<String> onSaved,
// }) {
//   return TextFormField(
//     focusNode: focus,
//     initialValue: initialValue,
//     inputFormatters: <TextInputFormatter>[
//       FilteringTextInputFormatter.digitsOnly,
//       LengthLimitingTextInputFormatter(15),
//     ],
//     decoration: InputDecoration(
//       border: UnderlineInputBorder(),
//       filled: true,
//       icon: icon != null ? Icon(icon) : null,
//       hintText: '',
//       labelText: label,
//     ),
//     keyboardType: TextInputType.phone,
// //    buildCounter: (
// //      BuildContext context, {
// //      int currentLength,
// //      int maxLength,
// //      bool isFocused,
// //    }) {
// //      return const SizedBox();
// //    },
//     textInputAction: textInputAction,
//     onSaved: onSaved,
//     onFieldSubmitted: (term) {
//       if (nextFocus != null) {
//         FocusScope.of(context).requestFocus(nextFocus);
//       } else {
//         focus.unfocus();
//       }
//     },
//     validator: validator,
//   );
// }

// Widget passField({
//   @required BuildContext context,
//   FocusNode focus,
//   FocusNode nextFocus,
//   String initialValue,
//   GlobalKey formFieldState,
//   TextInputAction textInputAction = TextInputAction.done,
//   IconData icon,
//   @required String label,
//   @required FormFieldValidator<String> validator,
//   @required FormFieldSetter<String> onSaved,
//   int maxLength,
// }) {
//   return PasswordField(
//     fieldKey: formFieldState,
// //    helperText: 'No more than 8 characters.',
//     labelText: label,
//     initialValue: initialValue,
//     icon: icon,
//     textInputAction: textInputAction,
//     onSaved: onSaved,
//     validator: validator,
//     onFieldSubmitted: (term) {
//       if (nextFocus != null) {
//         FocusScope.of(context).requestFocus(nextFocus);
//       } else {
//         focus.unfocus();
//       }
//     },
//   );
// }

// //Widget pictureField({
// //  File file,
// //  String hint,
// //  IconData hintIcon, // = Icons.add,
// //  IconData labelIcon, // = Icons.photo,
// //  double width = 100,
// //  double height = 100,
// //  FormFieldSetter<String> onSaved,
// //}) {
// //  return Row(
// //    children: <Widget>[
// //      if (labelIcon != null)
// //        Row(
// //          children: <Widget>[
// //            Icon(
// //              labelIcon,
// //              color: Colors.grey,
// //            ),
// //            SizedBox(
// //              width: 16,
// //            )
// //          ],
// //        ),
// //      file != null
// //          ? Image.file(
// //              file,
// //              width: width,
// //              height: height,
// //            )
// //          : Container(
// //              width: width,
// //              height: height,
// //              child: Container(
// //                width: width / 2,
// //                height: height / 2,
// //                decoration: BoxDecoration(
// //                  color: Colors.grey[200],
// //                  borderRadius: BorderRadius.circular(5),
// //                ),
// //                child: Center(
// //                  child: Column(
// //                    mainAxisAlignment: MainAxisAlignment.center,
// //                    children: <Widget>[
// //                      Icon(
// //                        hintIcon,
// //                        color: Colors.grey,
// //                      ),
// //                      if (hint != null)
// //                        Text(
// //                          hint,
// //                          style: TextStyle(
// //                            color: Colors.grey,
// //                          ),
// //                        ),
// //                    ],
// //                  ),
// //                ),
// //              ),
// //            ),
// //    ],
// //  );
// //}

// Container buildEmptyData(String label) {
//   return Container(
//     width: double.infinity,
//     margin: const EdgeInsets.all(8),
//     child: Text(
//       "$label : - ",
//       textAlign: TextAlign.left,
//     ),
//   );
// }
