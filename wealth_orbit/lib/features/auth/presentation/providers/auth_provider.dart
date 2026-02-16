import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';

final firebaseInitializedProvider = StateProvider<bool>((ref) => false);

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  final initialized = ref.watch(firebaseInitializedProvider);
  if (!initialized) throw Exception("Firebase not initialized");
  return FirebaseAuth.instance;
});

final googleSignInProvider = Provider<GoogleSignIn>((ref) {
  return GoogleSignIn();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    ref.read(firebaseAuthProvider),
    ref.read(googleSignInProvider),
  );
});

final authStateChangesProvider = StreamProvider<User?>((ref) {
  final initialized = ref.watch(firebaseInitializedProvider);
  if (!initialized) return Stream.value(null);
  return ref.watch(authRepositoryProvider).authStateChanges;
});
