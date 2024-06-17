import 'dart:convert';

import 'package:client_flutter/screens/tab2/tab2.edit.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:client_flutter/screens/login/login.page.dart';
import 'package:client_flutter/shared/models/user.dart';
import 'package:client_flutter/shared/service/animate_service.dart';
import 'package:client_flutter/shared/service/auth_service.dart';
import 'package:client_flutter/shared/widgets/my_button_text.dart';
import 'package:client_flutter/shared/widgets/my_dialog.dart';

class Tab2Page extends StatefulWidget {
  Tab2Page({Key? key}) : super(key: key);

  @override
  Tab2PageState createState() => Tab2PageState();
}

class Tab2PageState extends State<Tab2Page> {
  bool isSelected = false;
  bool enableBiometrics = false;
  bool enableRecognition = false;

  User? user;
  bool _loading = true;

  NesHourglassLoadingIndicator loader = NesHourglassLoadingIndicator();

  Future<void> _profile() async {

    await Future.delayed(const Duration(seconds: 4));
    final userStored = await AuthService().getData('user');
    Map<String, dynamic> attr = jsonDecode(userStored);
    user = User.fromJson(attr);
    setState(() {
      _loading = false; // Set loading to false once user profile is fetched
    });
  }

  @override
  void initState() {
    super.initState();
    _profile();
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
      body: _loading ? Center(child: loader): _loadProfile(), // Show profile content once loaded

      bottomSheet: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(12),
        child: NesButton(
          type: NesButtonType.error,
          child: const Text('Log out'),
          onPressed: () {
            MyDialog(
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButtonText(
                      text: 'Confirm',
                      type: NesButtonType.success,
                      toggleWidget: () {
                        AuthService().cleanAllStorage();
                        AnimationService.push(context, LoginPage());
                      }),
                  const SizedBox(width: 20,),
                  MyButtonText(
                      text: 'Cancel',
                      type: NesButtonType.error,
                      toggleWidget: () => Navigator.of(context).pop(true)),
                ],
              ),
            ).show(context);
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
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        user!.firstName ?? '',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'minecraftia',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '2024/12/12',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'minecraftia',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      NesButton(
                        type: NesButtonType.success,
                        child: const Text(
                          'EDIT PROFILE',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'minecraftia',
                          ),
                        ),
                        onPressed: () =>
                            AnimationService.push(context, Tab2Edit()),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              SizedBox(
                height: 30,
              ),
              Text('Settings',
                  style: TextStyle(
                    fontFamily: 'minecraftia',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Divider(
                  thickness: 3,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          NesContainer(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            width: 400,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/touch_id.png',
                  height: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Enable face id",
                  style: TextStyle(
                    fontFamily: 'minecraftia',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                NesButton(
                  onPressed: () =>
                      setState(() => enableBiometrics = !enableBiometrics),
                  type: enableBiometrics
                      ? NesButtonType.error
                      : NesButtonType.success,
                  child: NesIcon(
                      iconData: enableBiometrics
                          ? NesIcons.remove
                          : NesIcons.check,
                      size: const Size.fromHeight(16)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          NesContainer(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            width: 400,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/face_id.png',
                  height: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Enable face id",
                  style: TextStyle(
                    fontFamily: 'minecraftia',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Container(
                  child: NesButton(
                    onPressed: () =>
                        setState(() => enableRecognition = !enableRecognition),
                    type: enableRecognition
                        ? NesButtonType.error
                        : NesButtonType.success,
                    child: NesIcon(
                        iconData: enableRecognition
                            ? NesIcons.remove
                            : NesIcons.check,
                        size: const Size.fromHeight(16)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
