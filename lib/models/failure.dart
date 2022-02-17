import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Failure extends Equatable {
  final String code;
  final String message;
  const Failure({required this.code, required this.message});
  factory Failure.none() => Failure(code: '', message: '');

  @override
  List<Object?> get props => [code, message];

  @override
  String toString() => 'Failure(code:$code,message:$message)';
}
