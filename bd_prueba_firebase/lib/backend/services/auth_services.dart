import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
      try {
        return await _auth.signInWithEmailAndPassword(email: email, password: password);
      } catch (e) {
        // Manejo de excepciones
        rethrow;
      }
  }

  Future<UserCredential> signInWithPhoneAndOTP(String phoneNumber, String otp) async {
    try {
      // Crea una instancia de PhoneAuthCredential utilizando el código de verificación
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: otp,
        smsCode: otp,
      );

      // Inicia sesión con el número de teléfono y la credencial
      return await _auth.signInWithCredential(phoneAuthCredential);
    } catch (e) {
      // Manejo de excepciones
      rethrow;
    }
  }

  Future<void> linkWithEmailAndPass(String email, String password) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        AuthCredential emailAuthCredential = EmailAuthProvider.credential(
          email: email,
          password: password,
        );

        await user.linkWithCredential(emailAuthCredential);
      }
    } catch (e) {
      // Manejo de errores
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  bool isAuthenticated() {
    return _auth.currentUser != null;
  }
}