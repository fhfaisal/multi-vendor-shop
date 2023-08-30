import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:multivendor_store/views/buyers/auth/refactor_widgets.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser(
    String email,
    String fullName,
    String password,
    String phoneNumber,
  ) async {
    try {
      if (email.isNotEmpty &&
          fullName.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          password.isNotEmpty) {
        // Create the user using Firebase Auth
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // Update user display name
        // User? user = userCredential.user;
        // if (user != null) {
        //   await user.updateDisplayName(fullName);
        // }
        await _firestore.collection('buyers').doc(userCredential.user!.uid).set(
            {'email': email, 'fullName': fullName, 'phoneNumber': phoneNumber});
        return 'User registration successful';
      } else {
        return 'Please fill in all the required fields';
      }
    } catch (e) {
      // Handle error cases
      String errorMessage = 'An error occurred';
      if (e is FirebaseAuthException) {
        errorMessage = e.message ?? errorMessage;
      }
      return errorMessage;
    }
  }

  Future<String> _loginUser(
      String email,
      String password,
      ) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        // Sign in the user using Firebase Auth
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        // Return success message or other relevant information
        return successFlutterToast('User logged in successfully');
      } else {
        return errorFlutterToast('Please provide valid email and password');
      }
    } catch (e) {
      // Handle error cases
      String errorMessage = 'An error occurred';
      if (e is FirebaseAuthException) {
        errorMessage = e.message ?? errorMessage;
      }
      return errorFlutterToast(errorMessage);
    }
  }
}
