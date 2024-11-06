import 'package:zendesk_test/app/data/model/error_model.dart';

abstract class DataState<T> {
  final T? data;
  final ErrorResponseModel? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(ErrorResponseModel error) : super(error: error);
}

class DataNotSet<T> extends DataState<T> {
  const DataNotSet();
}

// class ErrorResponseModel {
//   int statusCode;
//   String message;
//   dynamic data;
//   ErrorResponseModel({required this.statusCode, required this.message, this.data});
//   final a = ErrorResponseModel();
// }
