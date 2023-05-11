
import '../model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiConstants {
  static String baseUrl = 'https://jsonplaceholder.typicode.com';
  static String usersEndpoint = '/users';
}

class APIService{

  Future<List<User>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<User>listUser  = userFromJson(response.body);
        return listUser;
      }
    } catch (e) {
        throw(2009);
    }
    return null;





  }
}