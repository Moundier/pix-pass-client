import 'package:client_flutter/pages/page_login.dart';
import 'package:client_flutter/shared/events/event_transition.dart';
import 'package:client_flutter/shared/widgets/my_button_text.dart';
import 'package:client_flutter/shared/widgets/my_dialog.dart';
import 'package:client_flutter/shared/widgets/my_text_field.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
// import 'package:mini_sprite/mini_sprite.dart';

class UserPage extends StatefulWidget {
  
  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage> {

  bool isSelected = false;

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
          )
        ),
      ),
      body: Container(
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
                    borderRadius: BorderRadius.circular(10.0), // Set border radius here
                  ),
                  // child: Image.asset('', width: 80, height: 80, ),
                ),

                const SizedBox(width: 10,),

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text('John Doe', style: TextStyle(fontSize: 16, fontFamily: 'minecraftia', fontWeight: FontWeight.bold),),
                          ],
                        ),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text('2024/12/12', style: TextStyle(fontSize: 12, fontFamily: 'minecraftia', fontWeight: FontWeight.bold),),  SizedBox(height: 20,),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10,),
                            NesButton(
                              type: NesButtonType.success, 
                              child: const Text('EDIT PROFILE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'minecraftia'),), 
                              onPressed: () {
                                // Navigation
                                CustomTransition.push(context, Update());
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                   
                  ],
                ),

              ],
            ),

            // Settings 

            const SizedBox(height: 20,),

            const Row(
              children: [
                SizedBox(height: 30,),
                Text('Settings', 
                  style: TextStyle(
                    fontFamily: 'minecraftia', 
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10,),

            NesContainer(
              padding: EdgeInsets.all(12),
              width: 400,
              child: Row(
                children: [
                  Image.asset('assets/images/touch_id.png', height: 40,), 
                  const SizedBox(width: 10,),
                  const Text(
                    "Enable face id", style: TextStyle(
                      fontFamily: 'minecraftia', 
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  SizedBox(width: 40,),

                  NesButton(
                    type: NesButtonType.success, 
                    child: Text("Enabled"),
                    onPressed: () { 
                      print("Enable");
                    },
                  )
                ],
              ),
            ),

            const SizedBox(height: 10,),

            NesContainer(
              padding: EdgeInsets.all(12),
              width: 400,
              child: Row(
                children: [
                  Image.asset('assets/images/face_id.png', height: 40,), 
                  const SizedBox(width: 10,),
                  const Text(
                    "Enable face id", style: TextStyle(
                      fontFamily: 'minecraftia', 
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  SizedBox(width: 40,),

                  NesButton(
                    type: NesButtonType.error, 
                    child: Text("Disabled"),
                    onPressed: () { 
                      print("Enable");
                    },
                  )
                ],
              ),
            )

          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.all(12),
        child: NesButton(
          type: NesButtonType.error, 
          child: Text('Log out'), 
          onPressed: () { 
            MyDialog(
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButtonText('Confirm', NesButtonType.success, () { 
                    CustomTransition.push(context, LoginPage());
                  }),
                  const SizedBox(width: 20,),
                  MyButtonText('Cancel', NesButtonType.error, () { 
                    Navigator.of(context).pop(true); 
                  }),
                ],
              ),
            ).show(context);
          },
        ),
      ),
    );
  }

}

class Update extends StatelessWidget {

  const Update({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: NesIconButton(
            icon: NesIcons16.leftArrowIndicator,
            onPress: () => Navigator.of(context).pop(),
          )
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10, ),
          const MyTextField(labelText: 'Username', padding: 16,),
          const SizedBox(height: 10),
          const MyTextField(labelText: 'Email', padding: 16),
          const SizedBox(height: 10),
          const MyTextField(labelText: 'Password', padding: 16),
          const SizedBox(height: 10),
          const MyTextField(labelText: 'Confirm Password', padding: 16),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButtonText('Confirm', NesButtonType.success, () { }),
              const SizedBox(width: 20,),
              MyButtonText('Cancel', NesButtonType.error, () {  }),
            ],
          ),
        ],
      )
    ); 
    
  }
}