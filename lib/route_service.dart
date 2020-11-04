import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RouteService {

  static final RouteService _singleton = new RouteService._internal();

  factory RouteService() {
    return _singleton;
  }

  RouteService._internal();

  final RouteObserver<PageRoute> routeObserver = new RouteObserver<PageRoute>();
}