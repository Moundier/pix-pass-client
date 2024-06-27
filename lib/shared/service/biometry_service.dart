import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometryService extends ChangeNotifier {

  final LocalAuthentication auth;

  BiometryService({required this.auth});

  Future<bool> biometrySupported() async {
    final bool available  = await auth.canCheckBiometrics;
    return available || await auth.isDeviceSupported();
  }

  Future<bool> authenticate() async {
    return await auth.authenticate(
      localizedReason: 'Please authenticate for access',
      options: const AuthenticationOptions(
        biometricOnly: true,
      ),
    );
  }

}