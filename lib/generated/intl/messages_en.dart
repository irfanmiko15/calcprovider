// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(what) => "Open ${what} ?";

  static String m1(what) => "Add ${what}";

  static String m2(what) => "${what} Detail";

  static String m3(what) => "Edit ${what}";

  static String m4(what) => "${what} required";

  static String m5(what) => "\'${what}\' will be deleted. Are you sure?";

  static String m6(what) => "${what} is not available in your phone.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "action_not_reversible_msg": MessageLookupByLibrary.simpleMessage(
            "This action is not reversible. Continue?"),
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "app_name": MessageLookupByLibrary.simpleMessage("Gringgo"),
        "are_you_sure": MessageLookupByLibrary.simpleMessage("Are you sure?"),
        "camera": MessageLookupByLibrary.simpleMessage("Camera"),
        "confirm_new_password":
            MessageLookupByLibrary.simpleMessage("Confirm New Password"),
        "confirm_new_password_must_be": MessageLookupByLibrary.simpleMessage(
            "Confirm new password must be between 6-30 characters"),
        "confirm_new_password_must_be_same_with_new_password":
            MessageLookupByLibrary.simpleMessage(
                "Confirm new password must be same with new password"),
        "confirm_new_password_required": MessageLookupByLibrary.simpleMessage(
            "Confirm new password required"),
        "delete_pict": MessageLookupByLibrary.simpleMessage("Delete Picture"),
        "detail": MessageLookupByLibrary.simpleMessage("Detail"),
        "direktur": MessageLookupByLibrary.simpleMessage("Direktur"),
        "do_you_want_to_exit":
            MessageLookupByLibrary.simpleMessage("Do you want to exit ?"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "email_body": MessageLookupByLibrary.simpleMessage(""),
        "email_required":
            MessageLookupByLibrary.simpleMessage("Email required"),
        "email_subject": MessageLookupByLibrary.simpleMessage("App Support"),
        "email_too_short":
            MessageLookupByLibrary.simpleMessage("Email too short"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "exit": MessageLookupByLibrary.simpleMessage("Exit"),
        "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
        "image_error": MessageLookupByLibrary.simpleMessage("Image error"),
        "image_removed": MessageLookupByLibrary.simpleMessage("Image removed."),
        "image_success_changed":
            MessageLookupByLibrary.simpleMessage("Image successfully changed."),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "latitude": MessageLookupByLibrary.simpleMessage("Latitude"),
        "locale_code": MessageLookupByLibrary.simpleMessage("en"),
        "locale_date_format":
            MessageLookupByLibrary.simpleMessage("dd MMMM yyyy"),
        "locale_str": MessageLookupByLibrary.simpleMessage("English"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "logo_upload": MessageLookupByLibrary.simpleMessage("Logo Upload"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "longitude": MessageLookupByLibrary.simpleMessage("Longitude"),
        "new_password": MessageLookupByLibrary.simpleMessage("New Password"),
        "new_password_must_be": MessageLookupByLibrary.simpleMessage(
            "New Password must be between 6-30 characters"),
        "new_password_required":
            MessageLookupByLibrary.simpleMessage("New password required"),
        "no_connection_error":
            MessageLookupByLibrary.simpleMessage("No connection error"),
        "not_found": MessageLookupByLibrary.simpleMessage("Not found."),
        "open_what": m0,
        "other_str": MessageLookupByLibrary.simpleMessage("Other"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "password_must_be": MessageLookupByLibrary.simpleMessage(
            "Password must be between 6-30 characters"),
        "password_required":
            MessageLookupByLibrary.simpleMessage("Password required"),
        "phone": MessageLookupByLibrary.simpleMessage("Phone"),
        "phone_length_must_be": MessageLookupByLibrary.simpleMessage(
            "Phone length must be between 5-15 digits"),
        "phone_required":
            MessageLookupByLibrary.simpleMessage("Phone required"),
        "please_check_your_connection": MessageLookupByLibrary.simpleMessage(
            "Please check your connection"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "save_to_phone": MessageLookupByLibrary.simpleMessage("Save to phone"),
        "saved": MessageLookupByLibrary.simpleMessage("Saved"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "sign_out": MessageLookupByLibrary.simpleMessage("Sign Out"),
        "sign_up": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "take_pict_from":
            MessageLookupByLibrary.simpleMessage("Take picture from"),
        "try_again": MessageLookupByLibrary.simpleMessage("Try Again"),
        "unknown_error": MessageLookupByLibrary.simpleMessage("Unknown error."),
        "upload_error": MessageLookupByLibrary.simpleMessage("Upload error."),
        "w_add": m1,
        "w_detail": m2,
        "w_edit": m3,
        "w_required": m4,
        "w_will_be_deleted": m5,
        "what_not_available_in_your_phone": m6,
        "whatsapp": MessageLookupByLibrary.simpleMessage("WhatsApp")
      };
}
