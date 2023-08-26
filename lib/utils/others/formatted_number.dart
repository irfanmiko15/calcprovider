import '../utils.dart';

class FormattedNumber {
  final num? value;

  final bool? useCommaAsDecimal;

  const FormattedNumber(this.value,{this.useCommaAsDecimal = true});

  @override
  String toString() {
    if (value is int) {
      return Utils.intToDecimal(value as int);
    } else if (value is double) {
      return Utils.doubleToStringDecimal(
        value: value as double,
        useCommaAsDecimal: useCommaAsDecimal!,
      );
    } else {
      assert(() {
        print(value);
        print("Not a Number (NaN)");
        return true;
      }());
      return "";
    }
  }
}
