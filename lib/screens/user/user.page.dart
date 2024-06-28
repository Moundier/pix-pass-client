import 'package:client_flutter/screens/user/user.service.dart';
import 'package:client_flutter/screens/user/user.widget.dart';
import 'package:client_flutter/shared/widgets/my_dialog_confirm.dart';
import 'package:client_flutter/shared/widgets/my_divider.dart';
import 'package:client_flutter/shared/widgets/my_toggle_row.dart';
import 'package:dio/dio.dart';
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

  final _userService = UserService();
  final _secureStorage = SecureStorage();

  late User _user;
  late String? _termsAcecepted;
  bool _loading = true;

  NesHourglassLoadingIndicator loadingIndicator = const NesHourglassLoadingIndicator();


  bool isSelected = false;
  bool biometryEnabled = false;
  bool recognitionEnabled = false;

  Future<void> _getUser() async {
    _user = User(id: int.parse(await _secureStorage.read('user_id')));
  }

  @override
  void initState() {
    super.initState();

    _getUser();

    _profile();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _profile() async {

    await Future.delayed(const Duration(seconds: 3));

    Response response = await _userService.getUserById(_user);    
    
    final json = response.data;
    _user = User.fromJson(json);
    _termsAcecepted = _user.termsAcceptedDate.toString();

    if (!mounted) return;

    setState(() {
      _loading = false; 
    });
  }

  Future<void> _updateUserProfile() async {

    final updatedUser = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Tab2Edit()),
    );

    if (updatedUser == null) return;

    setState(() {
      _user = updatedUser;
    });
  }
  
  Future<void> _switchBiometry() async {
    logger.i('_switchBiometry');

    final id = _user.id.toString();
    final key = 'biometric_enabled_$id';
    final currentState = await _secureStorage.read(key);

    // Initialize with 'false' if no state is found
    final state = currentState;

    String enabled = state;

    // Toggle the boolean value
    final value = enabled != 'true';
    final toggleBool = value ? 'true' : 'false';

    logger.f('New biometric state for user $id: $toggleBool');

    await _secureStorage.write(key, toggleBool);
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
                    _user.firstName ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'minecraftia',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _termsAcecepted ?? '', // Date time
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
            onPressed: _switchBiometry,
          ),

          const SizedBox(height: 10,),

          MyToggleRow(
            width: 400, 
            imageAssetPath: 'assets/images/face_id.png', 
            label: "Enable face id", 
            currentValue: false,
            onPressed: () {
              
            },
          ),

          const SizedBox(height: 20,),

          const MyDivider("Security"),
          
        ],
      ),
    );
  }
}
