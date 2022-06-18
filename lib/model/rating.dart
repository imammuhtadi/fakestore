// ignore_for_file: unnecessary_this

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = double.parse(json['rate'].toString());
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}