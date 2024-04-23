// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';

import 'package:hotel_pra_hoje/src/core/infrastructure/datasources/i_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatasource implements ILocalDatasource {
  @override
  Future<T> readString<T>(String key) async {
    final prefs = await _getInstance();
    final jsonString = prefs.getString(key);
    if (jsonString == null || jsonString == []) return null as T;

    return json.decode(jsonString);
  }

  @override
  Future<bool> clearAll() async {
    final prefs = await _getInstance();
    return await prefs.clear();
  }

  @override
  Future<List<Map<String, dynamic>>> readList(String key) async {
    final prefs = await _getInstance();
    final jsonString = prefs.getString(key);
    if (jsonString == null) return [];
    final listMap = json.decode(jsonString);
    return (listMap as List).map((e) => Map<String, dynamic>.from(e)).toList();
  }

  @override
  Future<bool> removeKey(String key) async {
    final prefs = await _getInstance();
    return prefs.remove(key);
  }

  @override
  Future<bool> save<T>(String key, T value) async {
    final prefs = await _getInstance();
    return prefs.setString(key, json.encode(value));
  }

  @override
  Future<bool> saveBool(String key, bool value) async {
    final prefs = await _getInstance();
    return prefs.setBool(key, value);
  }

  Future<SharedPreferences> _getInstance() async {
    return await SharedPreferences.getInstance();
  }
}
