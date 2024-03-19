class MultiLang {
  String? en;
  String? vi;

  MultiLang({this.en, this.vi});

  MultiLang.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    vi = json['vi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    data['vi'] = vi;
    return data;
  }

  String? get(String? locale) {
    switch (locale) {
      case "en":
        return en;
      case "vi":
        return vi;
    }
    return null;
  }
}
