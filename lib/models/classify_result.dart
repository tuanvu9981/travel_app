class ClassifyResult {
  int? status;
  String? result;
  Object? explanation;

  ClassifyResult({this.status, this.result, this.explanation});

  ClassifyResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'];
    explanation = json['explanation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['result'] = result;
    data['explanation'] = explanation;
    return data;
  }
}
