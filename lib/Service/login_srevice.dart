import 'package:dio/dio.dart';
import 'package:onof/Models/login_model.dart';

class UserService 
{
  static Dio dio = Dio();
  static Future<List<LoginModel>>getData()async
  { 
    try{
    Response response = await dio.get(
      'https://fakestoreapi.com/users'
    );
    List<LoginModel>users = (response.data as List)
    .map((userJson)=>LoginModel.fromJson(userJson))
    .toList();
    return users;
  }catch(e)
  {
    throw Exception("The Error is $e");
  }
}

static Future<bool>loginSerivce({
  required String username,
  required String email,
  required String password,
})async
  {
    try{
    Response response = await dio.post(
      'https://fakestoreapi.com/users',
      data: {
        "email": email,
        "username": username,
        "password": password,
      }
    );
    if(response.statusCode ==200)
    {
      List<LoginModel>users = await getData();
      for(var user in users)
      {
        if(user.email == email && user.password == password && user.username == username)
        {
          return true;
        }
      }
    }
    return false;
    }catch(e)
    {
      throw Exception("The Error is $e");
    }
  }
}