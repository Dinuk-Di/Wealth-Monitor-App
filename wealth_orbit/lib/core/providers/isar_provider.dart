
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../data/isar_service.dart';

final isarServiceProvider = Provider<IsarService>((ref) {
  return IsarService();
});

final isarProvider = FutureProvider<Isar>((ref) async {
  final isarService = ref.watch(isarServiceProvider);
  return isarService.db;
});
