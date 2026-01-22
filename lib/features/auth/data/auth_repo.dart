import 'package:dio/dio.dart';
import 'package:hungry/core/network/api.exceptions.dart';
import 'package:hungry/core/network/api_errors.dart';
import 'package:hungry/core/network/api_service.dart';
import 'package:hungry/core/utils/pref_helpers.dart';
import 'package:hungry/features/auth/data/user_models.dart';

class AuthRepo {

ApiService apiService =ApiService();

 
Future<UserModels> login(String email, String password) async {
  try {
    
  final response = await apiService.post('/login', {'email': email,'password': password,});


  if (response is ApiErrors) {
    throw response;
    }  



 if (response is Map<String, dynamic>) {
        final msg = response['message'];
        final code = response['code'];
        final data = response['data'];
        
        if (code != 200 || data == null) {
          throw ApiErrors(message: msg );
        }


        final user =UserModels.fromJson(response['data']);
        if (user.token != null) {
          await PrefHelpers.saveUserToken(user.token!);
          } 
          return user;
         }else {
      throw ApiErrors(message: 'Invalid response format');
    }
 


  
  }on DioError catch (e) {
    throw ApiExceptions.handleError(e);
    } catch (e) { 
    throw ApiErrors(message: e.toString());
  }

}





}