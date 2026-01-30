import 'package:mingo/data/datasources/romote/code_remote_sb.dart';
import 'package:mingo/data/models/code_model.dart';

class CodeRepository {
  Future<bool> verifyCode(String code) async {

    final data = await CodeRemoteSb().fetchCode(code);
    if (data != null) {
      return true;
    } else {
      return false;
    }

  }

  Future<bool> createCode(String code) async {
    final data = await CodeRemoteSb().createCode(code);
    if (data) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<CodeModel>> fetchCodes() async {
    final data = await CodeRemoteSb().fetchCodes();
    final response = data.map((code) => CodeModel.fromJson(code)).toList();
    return response;
  }

}