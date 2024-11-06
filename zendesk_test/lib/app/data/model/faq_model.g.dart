// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FaqModelImpl _$$FaqModelImplFromJson(Map<String, dynamic> json) =>
    _$FaqModelImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FaqData.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FaqModelImplToJson(_$FaqModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'pagination': instance.pagination,
    };

_$FaqDataImpl _$$FaqDataImplFromJson(Map<String, dynamic> json) =>
    _$FaqDataImpl(
      answer: json['answer'] as String?,
      question: json['question'] as String?,
    );

Map<String, dynamic> _$$FaqDataImplToJson(_$FaqDataImpl instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'question': instance.question,
    };

_$PaginationImpl _$$PaginationImplFromJson(Map<String, dynamic> json) =>
    _$PaginationImpl(
      total: (json['total'] as num?)?.toInt(),
      pages: (json['pages'] as num?)?.toInt(),
      perPage: (json['perPage'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PaginationImplToJson(_$PaginationImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pages': instance.pages,
      'perPage': instance.perPage,
      'page': instance.page,
      'count': instance.count,
    };
