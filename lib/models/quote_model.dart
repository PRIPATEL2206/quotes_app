class Quote {
  String sId;
  String content;
  String author;
  List<String> tags;
  String authorId;
  String authorSlug;
  int length;
  String dateAdded;
  String dateModified;
  bool isFavorite;

  Quote({
    required this.sId,
    required this.content,
    required this.author,
    required this.tags,
    required this.authorId,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
    required this.isFavorite,
  });

  Quote.fromJson(Map<String, dynamic> json)
      : sId = json['_id'],
        content = json['content'],
        author = json['author'],
        tags = json['tags'].cast<String>(),
        authorId = json['authorId'],
        authorSlug = json['authorSlug'],
        length = json['length'],
        dateAdded = json['dateAdded'],
        dateModified = json['dateModified'],
        isFavorite = json['isFavorite'] ?? false;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['content'] = content;
    data['author'] = author;
    data['tags'] = tags;
    data['authorId'] = authorId;
    data['authorSlug'] = authorSlug;
    data['length'] = length;
    data['dateAdded'] = dateAdded;
    data['dateModified'] = dateModified;
    data['isFavorite'] = isFavorite;
    return data;
  }
}
