import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_model.freezed.dart';
part 'faq_model.g.dart';

@freezed
class FaqModel with _$FaqModel {
  const factory FaqModel({
    List<FaqData>? data,
    Pagination? pagination,
  }) = _FaqModel;

  factory FaqModel.fromJson(Map<String, dynamic> json) =>
      _$FaqModelFromJson(json);
}

@freezed
class FaqData with _$FaqData {
  const factory FaqData({
    String? answer,
    String? question,
  }) = _FaqData;

  factory FaqData.fromJson(Map<String, dynamic> json) =>
      _$FaqDataFromJson(json);
}

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    int? total,
    int? pages,
    int? perPage,
    int? page,
    int? count,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}
