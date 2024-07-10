/// this class contains all the network endpoints
/// in the app
class NetworkConfigurations {
  static final NetworkConfigurations _instanceKey =
      NetworkConfigurations._internalKey();

  factory NetworkConfigurations() => _instanceKey;

  NetworkConfigurations._internalKey();

  static const String baseUrl = "http://glowme-up.com/api";
  static const String kSignInEndPoint = '/auth/login';
  static const String kOffersEndPoint = '/offers';
  

  static Map<String, String> BaseHeaders = {
    "accept": "application/json, */* ,charset=UTF-8",
    "Content-Type": "application/json",
    'Charset': 'utf-8',
    'Accept-language': "en",
  };
}
