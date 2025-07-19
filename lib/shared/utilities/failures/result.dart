import 'package:japx/japx.dart';

class ResponseResult<T> {
  final T? data;
  final String? error;
  ResponseResult({this.data, this.error});
  bool get isSuccess => data != null;
}

class ValidationException implements Exception {
  final String message;

  ValidationException(this.message);

  @override
  String toString() => 'ValidationException: $message';
}

dynamic parseResponse(dynamic responseData) {
  if (responseData is Map<String, dynamic>) {
    if (isJsonApiFormat(responseData)) {
      try {
        return Japx.decode(responseData);
      } catch (e) {
        return responseData;
      }
    } else {
      return responseData;
    }
  }
  return responseData;
}

bool isJsonApiFormat(Map<String, dynamic> data) {
  if (!data.containsKey('data')) return false;
  final dataField = data['data'];
  if (dataField is Map<String, dynamic>) {
    return dataField.containsKey('type');
  } else if (dataField is List) {
    return dataField.isNotEmpty &&
        dataField.first is Map<String, dynamic> &&
        (dataField.first as Map<String, dynamic>).containsKey('type');
  }
  return false;
}
