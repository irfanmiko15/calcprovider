import 'dart:convert';
import 'dart:io';
import 'dart:math'; // as Math;

import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart' as g;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;
import 'package:sembast/sembast.dart';
import 'package:money_formatter/money_formatter.dart';

//import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../l10n/localization.dart';
import 'helper/dialog_helper.dart';
import 'others/message_utils.dart';

//var genUuid = Uuid();

class Utils {
//  static Utils instance = Utils();

  static void init(Locale appLocale) {
    if (appLocale != null) {
      _decimalFormat = NumberFormat("#,##0", Lang.validLocale(appLocale));
    }
  }

  static final ImagePicker imagePicker = ImagePicker();

  static NumberFormat _decimalFormat = NumberFormat("#,##0", "id_ID");
  static final NumberFormat _decimalCommaFormat =
      NumberFormat("#.##0", "id_ID");

  static final RegExp _removeTrailingZerosRegex = RegExp(r"([.]*0)(?!.*\d)");

//  static NumberFormat _decimalCommaFormat = NumberFormat("#,##0.00", "id_ID");

  static final DateFormat _dateFormat = DateFormat('dd MMM yyyy', "id_ID");
  static final DateFormat _dateTimeFormat =
      DateFormat('dd MMM yyyy - HH:mm', "id_ID");

  static const MethodChannel platform = MethodChannel('flutter.native/helper');

  static Future<String> updateImageGallery(String filePath) async {
    var response = "";
    try {
      final result = await platform
          .invokeMethod('updateImageGallery', {"filePath": filePath});
      response = result;
    } on PlatformException catch (e) {
      response = "Failed to Invoke: '${e.message}'.";
    }

    return response;
  }

  static void addAfterBuildCallback(VoidCallback afterLayout) {
    WidgetsBinding.instance.addPostFrameCallback((_) => afterLayout());
  }

//  static String cdnToAssetsUrl(String oldUrl) {
//    return oldUrl?.replaceAll(BaseApi.CDN_URL, BaseApi.ASSETS_URL);
//  }

  static String? listToStringQuery(List<String> input) {
    if (input == null || input.isEmpty) return null;

    var temp = "";
    for (var s in input) {
      temp += s + ",";
    }

    return temp.substring(0, temp.length - 1);
  }

  static String doubleToDecimal(double value) {
//    String temp = removeDecimalZeroFormat(value);
//    temp = _decimalCommaFormat.format(double.parse(temp));
    var temp = _decimalFormat.format(value);
//    return value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 2);
    return temp;
  }

  static String removeDecimalZeroFormat(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }

  static String intToDecimal(int value, {bool useComma = false}) {
    if (useComma) {
      return _decimalCommaFormat.format(value);
    }
    return _decimalFormat.format(value);
  }

 


//  static String dateToFormat({
//    @required DateTime date,
//    @required String format,
//    bool useLocalTime = true,
//  }) {
//    assert(date != null);
//    assert(format != null);
//    DateFormat df = DateFormat(format ?? "");
//    return df.format(useLocalTime ? date.toLocal() : date);
//  }

  static String toDate(
    DateTime date, {
    bool useLocalTime = true,
    String? format,
    String? locale,
  }) {
    assert(useLocalTime != null);
    if (date == null) return "";
    return (format == null ? _dateFormat : DateFormat(format, locale))
        .format(useLocalTime ? date.toLocal() : date);
  }

  static String toDateTime(
    DateTime date, {
    String ?emptyVal,
    bool showTimeZone = false,
    bool useLocalTime = true,
  }) {
    assert(showTimeZone != null);
    assert(useLocalTime != null);
    final locDate = useLocalTime ? date.toLocal() : date;
    if (date == null || date.millisecondsSinceEpoch <= 0) return emptyVal ?? "";
    return _dateTimeFormat.format(locDate) +
        (showTimeZone ? " " + locDate.timeZoneName : "");
  }

  static String toBase64(String str) {
    var bytes = utf8.encode(str);
    var base64Str = base64.encode(bytes);
    return base64Str;
  }

  static DateTime? dateTimeNotNull(String dateTime) {
    if (dateTime == null) return null;
    return DateTime.parse(dateTime);
  }

  static T between<T extends num>(T current, low, high) {
    if (min<T>(high, current) == high) return high;

    if (max<T>(low, current) == low) return low;

    return current;
  }

  static String stringPhoneFormat({
    required String phoneCode,
    required String plainPhone,
  }) {
    assert(phoneCode != null);
    assert(plainPhone != null);

    var splits = plainPhone.split(phoneCode);

    if (splits.length != 2) {
      return plainPhone;
    }

    var phoneOnly = splits[1];
    var newTextLength = phoneOnly.length;
    var usedSubstringIndex = 0;

    final newText = StringBuffer();
    if (newTextLength >= 4) {
      newText.write(phoneOnly.substring(0, usedSubstringIndex = 3) + '-');
    }
    if (newTextLength >= 8) {
      newText.write(phoneOnly.substring(3, usedSubstringIndex = 7) + '-');
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex) {
      newText.write(phoneOnly.substring(usedSubstringIndex));
    }

    return "+" + phoneCode + " " + newText.toString();
  }

  static double? dynamicToDouble(dynamic value) {
    if (value is double) {
      return value;
    }
    if (value is int) {
      return value.toDouble();
    }
    return null;
  }

  static String getAliasAvatarImage({int size = 256, required String name}) {
    final uri = Uri.https('ui-avatars.com', '/api', {
      "size": size.toString(),
      "name": name,
    });
    return uri.toString();
  }

  static Future<MultipartFile> fileToMultipart(File file,
      {String? name, bool useExtension = true}) async {
    final basename = path.basename(file.path);
    var headerBytes = await file.openRead(0, 4).single;
    final contentType =
        MediaType.parse(lookupMimeType(basename, headerBytes: headerBytes)!);
    final fName = (name?.isNotEmpty == true ? name : basename) ?? "file";
    return MultipartFile.fromFile(
      file.path,
      filename: fName.endsWith(".${contentType.subtype}")
          ? fName
          : fName + (useExtension ? ".${contentType.subtype}" : ""),
      contentType: contentType,
    );
  }
   

  static String doubleToStringDecimal({
    required double value,
    int precision = 2,
    bool useCommaAsDecimal = true,
  }) {
    var n = ((value * 100).roundToDouble()) /
        100; //double.parse(value.toStringAsFixed(precision));
    var temp = n.toString().replaceAll(_removeTrailingZerosRegex, "");
//    removeDecimalZeroFormat(n); //n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
    var listTemp = temp.split(".");
    if (listTemp == null) return "";
    if (listTemp.length == 2) {
      temp =
          "${intToDecimal(int.parse(listTemp[0]))}${useCommaAsDecimal ? "," : "."}${listTemp[1]}";
    } else if (listTemp.length == 1) {
      temp = intToDecimal(int.parse(listTemp[0]));
    }
//    if (useCommaAsDecimal) return temp.replaceAll(".", ",");
    return temp;
  }

  static List<String> distinctList(List<String> old) => old.toSet().toList();

  static int? dynamicToInt(dynamic value) {
    if (value == null) return value;
    if (value is int) return value;
    if (value is String) return int.parse(value);
    return null;
  }

  static DateTime? dynamicToDateTime(dynamic value) {
    if (value == null) return null;
    if (value is String) {
      if (value.isEmpty) return null;
      if (value == "0000-00-00 00:00:00") return null;
    }
    return DateTime.parse(value);
  }

  static Future<LocationData?> getLocationData({
    Duration timeout = const Duration(seconds: 10),
    int retry = 3,
  }) async {
    final location = Location();
    var success = await getLocationPermission();
    if (!success) return null;

    for (var count = 0; count < retry; count++) {
      try {
        final locationData = await location.getLocation().timeout(
          timeout,
          onTimeout: () {
            throw ('Timeout');
          },
        );
        return locationData;
      } catch (e) {}
    }
    return null;
  }

  static Future<bool> getLocationPermission() async {
    var location = Location();
//    Permission.locationAlways
    var _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }
  static Future<g.Placemark> GetAddressFromLatLong(double lat, double long) async {
    List<g.Placemark> placemarks = await g.placemarkFromCoordinates(lat, long);
   
    g.Placemark place = placemarks[0];
    print(
        '${place.street}, ${place.subLocality}, ${place.locality},${place.postalCode}, ${place.country}');
    return place;
  }
  static Future<File?> pickImage(BuildContext context, ImageSource imageSource,
      {bool crop = true}) async {
    var image = await DialogHelper.loading(
      context: context,
      cancelable: false,
      future: _getImage(context, imageSource, crop: crop),
    );
    return image;
  }

  static Future<File?> _getImage(BuildContext context, ImageSource imageSource,
      {bool crop = true}) async {
    var file = await imagePicker.getImage(
        source: imageSource,
        imageQuality:10,
        preferredCameraDevice: CameraDevice.rear);
    if (file?.path.isNotEmpty != true) return null;
    return crop ? (await _cropImage(context, file!.path)) : File(file!.path);
  }

  

  static Future<File?> _cropImage(
    BuildContext context,
    String imageFilePath,
  ) async {
    if (imageFilePath.isNotEmpty != true) return null;
    var croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFilePath,
      aspectRatio: const CropAspectRatio(
        ratioX: 1,
        ratioY: 1,
      ),
      maxWidth: 512,
      maxHeight: 512,
    );
    return croppedFile;
  }
}




extension DynamicExt on dynamic {
  int? toInt() {
    if (this is int) return this;
    if (this is String) return int.parse(this);
    return null;
  }

  DateTime? toDateTime() {
    if (this is String) {
      if (this.isEmpty) return null;
      if (this == "0000-00-00 00:00:00") return null;
    }
    return DateTime.parse(this);
  }
  bool containIgnoreCase(String s1, String s2) =>
      s1 == null || s2 == null? false : s1.toLowerCase().contains(s2.toLowerCase());
}
extension MapExtension<K, V> on Map<K, V> {
  Map<K, V> get removeNull => this..removeWhere((key, value) => value == null);

  K getKey(V value) => keys.firstWhere(
        (k) => this[k] == value,
        orElse: () => null as K,
      );
}
