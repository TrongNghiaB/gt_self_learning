import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String _usersCollection = 'users';

  /// Create or update user document in Firestore
  static Future<void> createOrUpdateUser(User user) async {
    try {
      final userData = {
        'id': user.uid,
        'email': user.email,
        'username': user.displayName ?? user.email?.split('@')[0] ?? 'User',
        'imageUrl': user.photoURL,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
        'lastLoginAt': FieldValue.serverTimestamp(),
      };

      await _firestore
          .collection(_usersCollection)
          .doc(user.uid)
          .set(userData, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to create/update user: $e');
    }
  }

  /// Get user data from Firestore
  static Future<Map<String, dynamic>?> getUserData(String userId) async {
    try {
      final doc = await _firestore
          .collection(_usersCollection)
          .doc(userId)
          .get();

      if (doc.exists) {
        return doc.data();
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get user data: $e');
    }
  }

  /// Update user's last login time
  static Future<void> updateLastLogin(String userId) async {
    try {
      await _firestore.collection(_usersCollection).doc(userId).update({
        'lastLoginAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      // Don't throw exception for permission denied during sign out
      if (e.toString().contains('permission-denied')) {
        debugPrint(
          'Warning: Permission denied when updating last login (user may be signing out)',
        );
        return;
      }
      throw Exception('Failed to update last login: $e');
    }
  }

  /// Check if user exists in Firestore
  static Future<bool> userExists(String userId) async {
    try {
      final doc = await _firestore
          .collection(_usersCollection)
          .doc(userId)
          .get();
      return doc.exists;
    } catch (e) {
      return false;
    }
  }

  /// Delete user data from Firestore
  static Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection(_usersCollection).doc(userId).delete();
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }
}
