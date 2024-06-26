import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometryService extends ChangeNotifier {

  final LocalAuthentication auth;

  BiometryService({required this.auth});

  Future<bool> isBiometricAvailable() async {
    final bool isBiometricCapable  = await auth.canCheckBiometrics;
    return isBiometricCapable || await auth.isDeviceSupported();
  }

  Future<bool> authenticate() async {
    return await auth.authenticate(
      localizedReason: 'Please authenticate for access'
    );
  }

}