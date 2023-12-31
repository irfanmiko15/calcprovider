/// An instance of text to be re-cased.
class ReCase {
  final RegExp _upperAlphaRegex = RegExp(r'[A-Z]');
  final RegExp _symbolRegex = RegExp(r'[ ./_\-]');

  String? originalText;
  List<String>? _words;

  ReCase(String text) {
    originalText = text;
    _words = _groupIntoWords(text);
  }

  List<String> _groupIntoWords(String text) {
    var sb = StringBuffer();
    var words = <String>[];
    var isAllCaps = !text.contains(RegExp('[a-z]'));

    for (var i = 0; i < text.length; i++) {
      var char = String.fromCharCode(text.codeUnitAt(i));
      var nextChar = (i + 1 == text.length
          ? null
          : String.fromCharCode(text.codeUnitAt(i + 1)));

      if (_symbolRegex.hasMatch(char)) {
        continue;
      }

      sb.write(char);

      var isEndOfWord = nextChar == null ||
          (_upperAlphaRegex.hasMatch(nextChar) && !isAllCaps) ||
          _symbolRegex.hasMatch(nextChar);

      if (isEndOfWord) {
        words.add(sb.toString());
        sb.clear();
      }
    }

    return words;
  }

  /// camelCase
  String get camelCase => _getCamelCase();

  /// CONSTANT_CASE
  String get constantCase => _getConstantCase();

  /// Sentence case
  String get sentenceCase => _getSentenceCase();

  /// snake_case
  String get snakeCase => _getSnakeCase();

  /// dot.case
  String get dotCase => _getSnakeCase(separator: '.');

  /// param-case
  String get paramCase => _getSnakeCase(separator: '-');

  /// path/case
  String get pathCase => _getSnakeCase(separator: '/');

  /// PascalCase
  String get pascalCase => _getPascalCase();

  /// Header-Case
  String get headerCase => _getPascalCase(separator: '-');

  /// Title Case
  String get titleCase => _getPascalCase(separator: ' ');

  String _getCamelCase({String separator = ''}) {
    var words = _words!.map(_upperCaseFirstLetter).toList();
    words[0] = words[0].toLowerCase();

    return words.join(separator);
  }

  String _getConstantCase({String separator = '_'}) {
    var words = _words!.map((word) => word.toUpperCase()).toList();

    return words.join(separator);
  }

  String _getPascalCase({String separator = ''}) {
    var words = _words!.map(_upperCaseFirstLetter).toList();

    return words.join(separator);
  }

  String _getSentenceCase({String separator = ' '}) {
    var words = _words!.map((word) => word.toLowerCase()).toList();
    words[0] = _upperCaseFirstLetter(words[0]);

    return words.join(separator);
  }

  String _getSnakeCase({String separator = '_'}) {
    var words = _words!.map((word) => word.toLowerCase()).toList();

    return words.join(separator);
  }

  String _upperCaseFirstLetter(String word) {
    return '${word.substring(0, 1).toUpperCase()}${word.substring(1)
        .toLowerCase()}';
  }
}

class Str {
  final String value;

  Str(this.value);
  bool get isNotNullEmpty => value!=null && value.isNotEmpty;
}

bool containIgnoreCase(String s1, String s2) =>
    s1 == null || s2 == null? false : s1.toLowerCase().contains(s2.toLowerCase());