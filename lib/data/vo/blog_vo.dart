class BlogVO {
  int? id;
  String? title;
  String? subtitle;
  String? description;
  String? photo;
  String? author;
  String? writeBy;
  String? createdAt;
  bool? isExpanded;

  BlogVO({
    this.id,
    this.title,
    this.subtitle,
    this.description,
    this.photo,
    this.author,
    this.writeBy,
    this.createdAt,
    this.isExpanded,
  });

  BlogVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
    photo = json['photo'];
    author = json['author'];
    writeBy = json['write_by'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['description'] = this.description;
    data['photo'] = this.photo;
    data['author'] = this.author;
    data['write_by'] = this.writeBy;
    data['created_at'] = this.createdAt;
    return data;
  }
}
