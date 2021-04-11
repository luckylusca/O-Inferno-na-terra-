import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final String senha;

  const User({
    this.id,
    @required this.name,
    @required this.email,
    @required this.avatarUrl,
    @required this.senha,
  });
}

class Test {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final String senha;

  const Test({
    this.id,
    @required this.name,
    @required this.email,
    @required this.avatarUrl,
    @required this.senha,
  });
}
