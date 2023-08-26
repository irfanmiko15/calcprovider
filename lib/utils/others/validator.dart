class Validator {
  final String _validate;

  Validator(this._validate);

  get isEmpty => _validate.isEmpty;
  get isNotEmpty => _validate.isNotEmpty;
  get isNotNullEmpty => _validate !=null && _validate.isNotEmpty;

  bool between(int low, int high) {
    return _validate.length >= low && _validate.length <= high;
  }

  bool isNumeric() {
    if (_validate == null) {
      return false;
    }
    return double.parse(_validate) != null;
  }

  bool equal(String compare) => _validate == compare;

  bool isEmail() {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    var regex = RegExp(pattern as String);
    return regex.hasMatch(_validate);
  }
}
