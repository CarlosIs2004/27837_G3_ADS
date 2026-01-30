class ContentModel {

  final int id;
  final String date;
  final String title;
  final String description;
  final String url;
  final int id_category;
  final int id_level;


  ContentModel({
    required this.id,
    required this.date,
    required this.title,
    required this.description,
    required this.url,
    required this.id_category,
    required this.id_level
  });

  factory ContentModel.fromJson(Map<String, dynamic> map) {
    return ContentModel(
      id: map['id'],
      date: map['date'],
      title: map['title'],
      description: map['description'],
      url: map['url'],
      id_category: map['id_category'],
      id_level: map['id_level']
    );
  }
}