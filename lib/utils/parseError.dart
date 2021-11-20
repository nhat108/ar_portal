import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/services.dart';

class ParseError extends Equatable {
  final String code;
  final String message;
  const ParseError({
    required this.code,
    required this.message,
  });
  @override
  List<Object> get props => [code, message];

  static ParseError fromJson(dynamic error) {
    String code = '-1';
    String message = 'Unhandle Error';
    try {
      if (error is FirebaseAuthException) {
        return ParseError(
          code: '${error.code}',
          message: '${error.message}',
        );
      } else if (error is PlatformException) {
        message = '${error.message}';
      }
      if (error?.message != null) {
        message = error?.message!;
      }
      if (error?.code != null) {
        code = error.code!;
      }
      return ParseError(
        code: code,
        message: message,
      );
    } catch (e) {
      return ParseError(code: code, message: message);
    }
  }
}

class DataError extends Equatable {
  final String rCode;
  final String rMessage;

  const DataError({required this.rCode, required this.rMessage});

  @override
  List<Object> get props => [rCode, rMessage];

  static DataError fromJson(dynamic json) {
    String detail = '';
    if (json['detail'] != null && json['detail'] is List) {
      detail = (json['detail'] as List)
          .reduce((value, element) => value + '\n' + element);
    }
    return DataError(
      rCode: "$json['statusCode']",
      rMessage:
          (json['message'] is List ? json['message'].first : json['message']) +
              '\n$detail',
    );
  }
}
