import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class UserPage extends StatefulWidget {
  
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

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
        padding: const EdgeInsets.all(24),
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

                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Text('John Doe', style: TextStyle(fontSize: 16, fontFamily: 'minecraftia'),),
                            ],
                          ),

                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Text('2024/12/12', style: TextStyle(fontSize: 12, fontFamily: 'minecraftia'),),  SizedBox(height: 20,),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              NesButton(type: NesButtonType.success, child: Text('Edit profile', style: TextStyle(fontSize: 12, fontFamily: 'minecraftia'),), onPressed: () {},)
                            ],
                          ),

                        ],
                      ),
                     
                    ],
                  ),
                  
                ),

              ],
            ),

            // Settings 

            SizedBox(height: 20,),

            const Row(
              children: [
                SizedBox(height: 30,),
                Text('Settings', style: TextStyle(fontSize: 12, fontFamily: 'minecraftia'),),
                SizedBox(width: 10,),
                Expanded(
                  child: Divider(
                    thickness: .5,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10,),

            Column(
              children: [
                
                SizedBox(height: 10,),
            
                Row(
                  children: [
                    NesContainer(
                      width: 360,
                      backgroundColor: Color.fromARGB(255, 219, 219, 219),
                    ),
                  ],
                ),
                
                SizedBox(height: 10,),

                Row(
                  children: [
                    NesContainer(
                      width: 360,
                      backgroundColor: Color.fromARGB(255, 219, 219, 219),
                    ),
                  ],
                ),

                SizedBox(height: 10,),

                Row(
                  children: [
                    NesContainer(
                      width: 360,
                      backgroundColor: Color.fromARGB(255, 219, 219, 219),
                    ),
                  ],
                ),

                SizedBox(height: 10,),

                Row(
                  children: [
                    Container(
                      width: 360,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 4,
                        ),
                      ),
                      child: Switch(
                        onChanged: (value) => { isSelected = !isSelected }, 
                        value: isSelected, 
                        activeTrackColor: const Color.fromARGB(255, 32, 32, 32),
                        activeColor: Color.fromARGB(255, 162, 209, 53),
                      ),
                    ),
                  ],
                ),
              ]
            ),

          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.all(12),
        child: NesButton(type: NesButtonType.error, child: Text('Log out'), onPressed: () {  },),
      ),
    );
  }

}
