
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(
  //     content: Text(text),
  //   ),
  // );
}



class Success {
  int? code;
  Object? response;

  Success({this.code, this.response});
}
class Failure {
  int? code;
  Object? errorResponse;

  Failure({this.code, this.errorResponse});
}

class UserError{
  int? code;
  Object? message;

  UserError({this.code, this.message});

}