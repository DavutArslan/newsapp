import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';

enum KullaniciDurumu { OturumAcilmis, OturumAcilmamis, OturumAciliyor }

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static KullaniciDurumu durum = KullaniciDurumu.OturumAcilmamis;

  AuthServices() {
    auth.authStateChanges().listen(_authStateChanged);
  }
  void _authStateChanged(User user) {
    if (user = null) {
      durum = KullaniciDurumu.OturumAcilmamis;
    } else {
      durum = KullaniciDurumu.OturumAcilmis;
    }
  }

  static Future<User> createUserWithEmailAndPassword(
      String email, String sifre) async {
    try {
      durum = KullaniciDurumu.OturumAciliyor;
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: sifre);
      User _yeniKullanici = credential.user;
      return _yeniKullanici;
    } catch (e) {
      durum = KullaniciDurumu.OturumAcilmamis;
      debugPrint("hata $e");
      return null;
    }
  }

  Future<User> signInUserWithEmailAndPassword(
      String email, String sifre) async {
    try {
      durum = KullaniciDurumu.OturumAciliyor;
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: sifre);
      User _kullanici = credential.user;
      return _kullanici;
    } catch (e) {
      durum = KullaniciDurumu.OturumAcilmamis;
      debugPrint("sigin hatası $e");
      return null;
    }
  }

  Future<bool> signOut() async {
    try {
      await auth.signOut();
      return true;
    } catch (e) {
      debugPrint("sigout hatası $e");
      return false;
    }
  }
}
