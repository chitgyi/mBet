extension StringExtension on String {
  String concat(String path) {
    return "${this}$path";
  }

  String toBearerToken() {
    return "Bearer $this";
  }

  String toMMNumber() {
    var tmp = '';
    var mm = {
      "0": '၀',
      "1": '၁',
      "2": '၂',
      "3": '၃',
      "4": '၄',
      "5": '၅',
      "6": '၆',
      "7": '၇',
      "8": '၈',
      "9": '၉'
    };

    this.split('').forEach((element) => tmp += "${mm[element]}");
    return tmp;
  }
}
