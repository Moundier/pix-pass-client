import 'package:client_flutter/screens/login/login.service.dart';
import 'package:client_flutter/screens/register/register.page.dart';
import 'package:client_flutter/screens/storage/storage.page.dart';
import 'package:client_flutter/shared/service/alert_service.dart';
import 'package:client_flutter/shared/service/auth_service.dart';
import 'package:client_flutter/shared/service/biometry_service.dart';
import 'package:client_flutter/shared/styles/my_text_field_style.dart';
import 'package:client_flutter/shared/widgets/my_divider_middle.dart';
import 'package:client_flutter/shared/widgets/my_hyperlink_text.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:local_auth/local_auth.dart';
import 'package:logger/logger.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:client_flutter/shared/service/animate_service.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter(),
);

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _authService = SecureStorage();
  final _loginService = LoginService();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final FocusNode _passwordFocus = FocusNode();

  bool localAuthFailed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void biometricAuthentication() async {

    bool hasBiometric = await _authService.exists('touch_id');
    bool biometricEnabled = await _authService.isEnabled('touch_id');

    if (!hasBiometric) {
      _error('Please login!');
      return;
    }

    if (!biometricEnabled) {
      _error('Must enable as config.');
      return;
    }

    final auth = BiometryService(auth: LocalAuthentication());
    final isSupported = await auth.biometrySupported();

    if (!isSupported) {
      _error('Biometric authentication is not available on this device.');
    }

    final authenticated = await auth.authenticate();

    if (!mounted) return;

    if (authenticated) {
      AnimationService.push(context, const StoragePage());
      return;
    }

    _error('Biometric authentication canceled.');
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    Response response = await _loginService.login(
      _emailController.text,
      _passwordController.text,
    );

    await _responseHandler(response);
  }

  Future<void> _responseHandler(Response response) async {

    if (response.statusCode != 200) {
      await _error("Error: ${response.statusCode} ${response.data}");
    }

    Map token = response.data;

    Map? decodedToken = JwtDecoder.decode(token['accessToken']);

    int? id = int.parse(decodedToken['sub']);
    String see = await _authService.read('biometric_enabled');
    logger.f('Lets see: $see');

    await _authService.write('user_id', id.toString());
    await _authService.write('access_token', token['accessToken']);
    await _authService.write('refresh_token', token['refreshToken']);

    if (mounted) {
      AnimationService.push(context, const StoragePage());
    }
  }

  Future<void> _error(String message) async {
    await AlertService.show(
      context,
      text: message,
      type: AlertType.error,
    );

    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/safe.gif',
                  height: 150,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: MyTextFieldStyle.build("Email"),
                  style: const TextStyle(fontFamily: 'minecraftia', fontSize: 14),
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'Please enter your email';
                    return null;
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(_passwordFocus);
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  focusNode: _passwordFocus,
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: MyTextFieldStyle.build("Password"),
                  style: const TextStyle(fontFamily: 'minecraftia', fontSize: 14),
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'Please enter your password';
                    return null;
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyHyperlinkText(text: 'Forgot Password?'),
                  ],
                ),
                const SizedBox(height: 20),
                NesButton(
                  type: NesButtonType.primary,
                  child: const Text('Sign In'),
                  onPressed: () => _login(),
                ),
                const SizedBox(height: 20),
                const MyDividerMiddle("Or continue with"),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NesButton(
                      type: NesButtonType.primary,
                      child: Image.asset('assets/images/face_id.png', width: 50),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 25),
                    NesButton(
                      type: NesButtonType.primary,
                      onPressed: biometricAuthentication,
                      child: Image.asset('assets/images/touch_id.png', width: 50),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member?', style: TextStyle(color: Colors.black, fontSize: 10)),
                    const SizedBox(width: 10),
                    MyHyperlinkText(
                      text: 'Register Now',
                      onTap: () => AnimationService.push(context, const RegisterPage()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
