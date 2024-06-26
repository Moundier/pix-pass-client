import 'dart:convert';

import 'package:client_flutter/screens/user/user_update.page.dart';
import 'package:client_flutter/shared/widgets/my_dialog_confirm.dart';
import 'package:client_flutter/shared/widgets/my_divider.dart';
import 'package:client_flutter/shared/widgets/my_toggle_row.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:client_flutter/shared/models/user.dart';
import 'package:client_flutter/shared/service/auth_service.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class Tab2Page extends StatefulWidget {
  
  const Tab2Page({super.key});

  @override
  Tab2PageState createState() => Tab2PageState();
}

class Tab2PageState extends State<Tab2Page> {

  final _authService = SecureStorage();

  bool isSelected = false;
  bool biometryEnabled = false;
  bool recognitionEnabled = false;

  User? user;
  String? termsAcecepted;
  bool _loading = true;

  NesHourglassLoadingIndicator loadingIndicator = const NesHourglassLoadingIndicator();

  Future<void> _profile() async {

    await Future.delayed(const Duration(seconds: 3));
    final user = await _authService.getData('user');
    final attr = jsonDecode(user);
    this.user = User.fromJson(attr);

    if (!mounted) return;

    termsAcecepted = this.user?.termsAcceptedDate.toString();
    
    setState(() {
      _loading = false; // Set loading to false once user profile is fetched
    });
  }

  Future<void> _updateUserProfile() async {

    final updatedUser = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Tab2Edit()),
    );

    if (updatedUser == null) {
      return;
    }

    setState(() {
      user = updatedUser;
    });

    await _authService.setData('user', jsonEncode(updatedUser.toJson()));
  }
  
  Future<void> _biometryEnabled() async {
    biometryEnabled = await _authService.isEnabled('touch_id');
  }

  @override
  void initState() {
    super.initState();

    _profile();
    _biometryEnabled();

    logger.i('biometry value:');
    logger.i(biometryEnabled);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: NesIconButton(
            icon: NesIcons16.leftArrowIndicator,
            onPress: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: _loading ? Center(child: loadingIndicator) : _loadProfile(), // Show profile content once loaded

      bottomSheet: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(12),
        child: NesButton(
          type: NesButtonType.error,
          child: const Text('Log out'),
          onPressed: () {
            MyDialogConfirm.logout(context);
          },
        ),
      ),
    );
  }

  Widget _loadProfile() {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Text(
                    user!.firstName ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'minecraftia',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    termsAcecepted ?? '', // Date time
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'minecraftia',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  NesButton(
                    type: NesButtonType.success,
                    onPressed: _updateUserProfile,
                    child: const Text(
                      'EDIT PROFILE',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'minecraftia',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          const MyDivider("Config"),

          const SizedBox(height: 10),
 
          MyToggleRow(
            width: 400, 
            imageAssetPath: 'assets/images/touch_id.png', 
            label: "Enable touch id", 
            currentValue: biometryEnabled,
            onPressed: () {
              _authService.toggleOption('touch_id');
            },
          ),

          const SizedBox(height: 10,),

          // MyToggleRow(
          //   width: 400, 
          //   imageAssetPath: 'assets/images/face_id.png', 
          //   label: "Enable face id", 
          //   currentValue: false,
          //   onPressed: () {
              
          //   },
          // ),

          const SizedBox(height: 20,),

          const MyDivider("Security"),
          
        ],
      ),
    );
  }
}
