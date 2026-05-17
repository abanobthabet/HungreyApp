

abstract class ApiConsumer {
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  });

  Future<T> post<T>(
    String path, {
    dynamic data,
    bool formdata = false,
    Map<String, dynamic>? queryParameters,
  });

  Future<T> patch<T>(
    String path, {
    dynamic data,
    bool formdata = false,
    Map<String, dynamic>? queryParameters,
  });

  Future<T> delete<T>(
    String path, {
    dynamic data,
    bool formdata = false,
    Map<String, dynamic>? queryParameters,
  });
}







// abstract class ApiConsumer {
//   Future<dynamic> get(
//     String path, {
//     dynamic data,
//     Map<String, dynamic>? queryParameters,
//   });

//   Future<dynamic> post(
//     String path, {
//     dynamic data,
//     bool formdata=false,
//     Map<String, dynamic>? queryParameters,
//   });

//   Future<dynamic> patch(
//     String path, {
//     dynamic data,
//     bool formdata=false,
//     Map<String, dynamic>? queryParameters,
//   });

//   Future<dynamic> delete(
//     String path, {
//     dynamic data,
//     bool formdata=false,
//     Map<String, dynamic>? queryParameters,
//   });
// }
