import 'package:http/http.dart' as http;

class AuthService 
{

  Future<http.Response> signup({required String name, required String email, required String password}) async
  {

    /// This is the Localhost URL for the API, take into account that the emulator have their own localhost
    /// so you need to use the gateway IP address instead of localhost, which is 10.0.2.2
    /// 
    /// For more info see: https://stackoverflow.com/questions/5806220/how-to-connect-to-my-http-localhost-web-server-from-android-emulator
    /// 
    var url = Uri.parse('http://10.0.2.2:3000/signup');

    final response = await http.post(url, body: {
      'name': name,
      'email': email,
      'password': password,
    });

    return response;
  }

    Future<http.Response> login({required String email, required String password}) async
  {

    /// This is the Localhost URL for the API, take into account that the emulator have their own localhost
    /// so you need to use the gateway IP address instead of localhost, which is 10.0.2.2
    /// 
    /// For more info see: https://stackoverflow.com/questions/5806220/how-to-connect-to-my-http-localhost-web-server-from-android-emulator
    /// 
    var url = Uri.parse('http://10.0.2.2:3000/login');

    final response = await http.post(url, body: {
      'email': email,
      'password': password,
    });

    return response;
  }

}