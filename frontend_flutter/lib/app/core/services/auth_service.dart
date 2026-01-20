import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend_flutter/app/data/models/user_model.dart' as models;
import 'dart:convert';

/// Authentication Service
/// Handles all authentication operations with Firebase
class AuthService {
  static AuthService? _instance;
  static AuthService getInstance() {
    _instance ??= AuthService._();
    return _instance!;
  }

  AuthService._();

  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Google Sign In instance
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Secure storage for tokens
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Storage keys
  static const String _keyUser = 'user_data';
  static const String _keyToken = 'auth_token';

  // ══════════════════════════════════════════════════════════════════════════
  // AUTHENTICATION STATE
  // ══════════════════════════════════════════════════════════════════════════

  /// Get current Firebase user
  User? get currentFirebaseUser => _auth.currentUser;

  /// Check if user is authenticated
  bool get isAuthenticated => _auth.currentUser != null;

  /// Stream of authentication state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // ══════════════════════════════════════════════════════════════════════════
  // GOOGLE SIGN IN
  // ══════════════════════════════════════════════════════════════════════════

  /// Sign in with Google
  Future<models.UserModel?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User cancelled the sign-in
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      // Create UserModel from Firebase user
      final user = _createUserModelFromFirebase(
        userCredential.user!,
        models.AuthProvider.google,
      );

      // Save user data
      await _saveUserData(user);

      // Save auth token
      final token = await userCredential.user!.getIdToken();
      if (token != null) {
        await _saveAuthToken(token);
      }

      return user;
    } catch (e) {
      print('Error signing in with Google: $e');
      rethrow;
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // SIGN OUT
  // ══════════════════════════════════════════════════════════════════════════

  /// Sign out from all providers
  Future<void> signOut() async {
    try {
      // Sign out from Google
      await _googleSignIn.signOut();

      // Sign out from Firebase
      await _auth.signOut();

      // Clear stored data
      await _clearUserData();
      await _clearAuthToken();
    } catch (e) {
      print('Error signing out: $e');
      rethrow;
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // USER DATA MANAGEMENT
  // ══════════════════════════════════════════════════════════════════════════

  /// Get stored user data
  Future<models.UserModel?> getStoredUser() async {
    try {
      final userJson = await _secureStorage.read(key: _keyUser);
      if (userJson != null) {
        return models.UserModel.fromJson(json.decode(userJson));
      }
      return null;
    } catch (e) {
      print('Error getting stored user: $e');
      return null;
    }
  }

  /// Save user data to secure storage
  Future<void> _saveUserData(models.UserModel user) async {
    try {
      final userJson = json.encode(user.toJson());
      await _secureStorage.write(key: _keyUser, value: userJson);
    } catch (e) {
      print('Error saving user data: $e');
    }
  }

  /// Clear user data from secure storage
  Future<void> _clearUserData() async {
    try {
      await _secureStorage.delete(key: _keyUser);
    } catch (e) {
      print('Error clearing user data: $e');
    }
  }

  /// Update user location (city and country)
  Future<void> updateUserLocation(String city, String country) async {
    try {
      final user = await getStoredUser();
      if (user != null) {
        final updatedUser = user.copyWith(city: city, country: country);
        await _saveUserData(updatedUser);
      }
    } catch (e) {
      print('Error updating user location: $e');
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // TOKEN MANAGEMENT
  // ══════════════════════════════════════════════════════════════════════════

  /// Get stored auth token
  Future<String?> getAuthToken() async {
    try {
      return await _secureStorage.read(key: _keyToken);
    } catch (e) {
      print('Error getting auth token: $e');
      return null;
    }
  }

  /// Save auth token to secure storage
  Future<void> _saveAuthToken(String token) async {
    try {
      await _secureStorage.write(key: _keyToken, value: token);
    } catch (e) {
      print('Error saving auth token: $e');
    }
  }

  /// Clear auth token from secure storage
  Future<void> _clearAuthToken() async {
    try {
      await _secureStorage.delete(key: _keyToken);
    } catch (e) {
      print('Error clearing auth token: $e');
    }
  }

  /// Refresh auth token
  Future<String?> refreshToken() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final token = await user.getIdToken(true);
        if (token != null) {
          await _saveAuthToken(token);
        }
        return token;
      }
      return null;
    } catch (e) {
      print('Error refreshing token: $e');
      return null;
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // HELPER METHODS
  // ══════════════════════════════════════════════════════════════════════════

  /// Create UserModel from Firebase User
  models.UserModel _createUserModelFromFirebase(
    User firebaseUser,
    models.AuthProvider provider,
  ) {
    return models.UserModel(
      uid: firebaseUser.uid,
      email: firebaseUser.email,
      displayName: firebaseUser.displayName,
      photoURL: firebaseUser.photoURL,
      phoneNumber: firebaseUser.phoneNumber,
      provider: provider,
      createdAt: firebaseUser.metadata.creationTime,
      lastLoginAt: DateTime.now(),
    );
  }
}
