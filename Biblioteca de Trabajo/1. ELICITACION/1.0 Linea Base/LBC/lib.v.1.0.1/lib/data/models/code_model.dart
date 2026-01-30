class CodeModel {

  final int id;
  final String date;
  final String code;

  CodeModel({
    required this.id,
    required this.date,
    required this.code
  });

  factory CodeModel.fromJson(Map<String, dynamic> map) {
    return CodeModel(
      id: map['id'],
      date: map['date'],
      code: map['code']
    );
  }
}