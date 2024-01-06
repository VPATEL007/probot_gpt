class HomeOptionModel {
  String? image;
  String? title;
  String? desc;
  String? chat;

  HomeOptionModel({this.image, this.title, this.desc, this.chat});

  HomeOptionModel.fromJson(Map<String, dynamic> json) {
    image = json['icon'];
    title = json['title'];
    desc = json['desc'];
    chat = json['chat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon'] = image;
    data['title'] = title;
    data['desc'] = desc;
    data['chat'] = chat;
    return data;
  }
}