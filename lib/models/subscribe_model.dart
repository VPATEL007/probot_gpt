class SubscribeModel {
  String? planName;
  String? type;
  String? price;
  String? priceTpe;
  String? icon;
  String? chatCount;
  String? imageCount;
  String? textCompletionCount;
  List<String>? benefits;

  SubscribeModel(
      {this.planName,
      this.type,
      this.price,
      this.priceTpe,
      this.icon,
      this.chatCount,
      this.imageCount,
      this.textCompletionCount,
      this.benefits});

  SubscribeModel.fromJson(Map<String, dynamic> json) {
    planName = json['planName'];
    type = json['type'];
    price = json['price'].toString();
    priceTpe = json['priceTpe'];
    icon = json['icon'];
    chatCount = json['chatCount'];
    imageCount = json['imageCount'];
    textCompletionCount = json['textCompletionCount'];
    if (json["benefits"] != null) {
      benefits = json['benefits'].cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['planName'] = planName;
    data['type'] = type;
    data['price'] = price;
    data['priceTpe'] = priceTpe;
    data['icon'] = icon;
    data['chatCount'] = chatCount;
    data['imageCount'] = imageCount;
    data['textCompletionCount'] = textCompletionCount;
    if (benefits != null) {
      data['benefits'] = benefits;
    }
    return data;
  }
}
