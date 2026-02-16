import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/auth/presentation/providers/auth_provider.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool firebaseSuccess = false;
  try {
    await Firebase.initializeApp();
    firebaseSuccess = true;
  } catch (e) {
    print("Firebase init failed: $e");
  }

  runApp(ProviderScope(
    overrides: [
      firebaseInitializedProvider.overrideWith((ref) => firebaseSuccess),
    ],
    child: const App(),
  ));
}
