import 'package:tutorial27_mvvm/data/network/base_api_services.dart';
import 'package:tutorial27_mvvm/data/network/network_api_services.dart';
import 'package:tutorial27_mvvm/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch(e){
      throw e;
    }
  }

Future<dynamic> signUpApi(dynamic data) async {
  try{
    dynamic response = await _apiServices.getPostApiResponse(AppUrl.registrationUrl, data);
    return response;
  } catch(e){
    throw e;
  }
}
}
