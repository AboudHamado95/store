import 'package:dio/dio.dart';
/// the remote data bundle 
/// used to hold data to the api 
class RemoteDataBundle {
  /// the endpoint of the api you are calling 
  final String networkPath;
  /// the request body
  Map<String, dynamic> body;
  /// the request parameters
  Map<String, dynamic> urlParams;
  /// the reques form data
  final FormData? data;

  RemoteDataBundle({
    this.data,
    required this.body,
    required this.networkPath,
    required this.urlParams,
  });
}
/// this abstract class holds 
/// all the function used to call the api
/// get - post - put - delete
/// we implement this class and add the 
/// implementation for this functions to 
/// call it all over the app
abstract class IRemoteDataSource {
  Future<dynamic> get(RemoteDataBundle remoteBundle);
  Future<dynamic> post(RemoteDataBundle remoteBundle,
      {BaseOptions? baseOptions ,Map<String ,String>?extraHeaders });
//   Future<dynamic> postFormData(RemoteDataBundle remoteBundle);
//   Future<dynamic> getAllNearPlaces(double lat,double long);
//    Future<dynamic> put(RemoteDataBundle remoteBundle,
//       {BaseOptions? baseOptions });
// Future<dynamic> delete(RemoteDataBundle remoteBundle,
//       {BaseOptions? baseOptions });
 /* Future<dynamic> pay(RemoteDataBundle remoteBundle,
      {BaseOptions? baseOptions,Map<String ,String>?extraHeaders });  */
}
