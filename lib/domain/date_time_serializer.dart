class DateTimeSerializer {
  static String fromJson(Map<String, dynamic> json) {
    var dateString = "${json['year']}${_ensureIntWithTwoCharacters(json['month'])}${_ensureIntWithTwoCharacters(json['day'])}";
    return dateString;
  }

  static String _ensureIntWithTwoCharacters(int input) {
    String inputString = input.toString();
    return inputString.length == 1 ? "0$inputString" : inputString;
  }
}