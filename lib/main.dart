
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:client_flutter/widgets/card_label.dart';
import 'package:client_flutter/widgets/button_with_icon.dart';

void main() {
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: flutterNesTheme(),
      debugShowCheckedModeBanner: false,
      home: MainPage(title: 'Password')
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});
  final String title;
  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  
  int counter = 0;
  bool hasPassword = false;

  void hasPasswordControl() {
    setState(() {
      hasPassword = true;
    });
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 248, 206),
        automaticallyImplyLeading: false,
        title: NesRunningText(
          text: widget.title,
          textStyle: const TextStyle(
            fontFamily: 'minecraftia',
            fontWeight: FontWeight.bold,
            color: Color(0xFF000000)
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NesPulser(
              interval: const Duration(milliseconds: 1000),
              child: const Text('No passwords created')
            ),
            Image.asset(
              'assets/key.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => {print("Are you stupid? yes")},
              child: CardCustom(
                paramImage: 'assets/key.png', 
                onPressed: () => {}
              ),
            )
          ],
        ),
      ),
      floatingActionButton: MainPageElements.nesButton(incrementCounter, context),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(6.0), 
        child: NesContainer(
          height: 80.00,
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWithIcon(
                nesIconWidget:  NesIcon(iconData: NesIcons.hamburgerMenu, size: Size.fromHeight(16),),
                textWidget:  const Text('Area'),
                onPressed: () => {
                  openPage(context, _MockPage())
                },
              ),
              ButtonWithIcon(
                nesIconWidget:  NesIcon(iconData: NesIcons.threeVerticalDots, size: Size.fromHeight(16),),
                textWidget:  const Text('Over'),
                onPressed: () => {
                  openPage(context, _MockPage())
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class MainPageElements {

  static NesButton nesButton(void Function()? onPressed, context) {
    return NesButton( 
      type: NesButtonType.primary,
      onPressed: () {
        nesDialog(context);
      },
      child: NesIcon(
        iconData: NesIcons.add, 
        size: const Size.fromHeight(16)
      )
    );
  }

  static void nesDialog(context) {
    NesDialog.show<bool>(
      context: context, 
      builder: (_) => formBuilder(),
    );
  }

  static Container formBuilder() {
    return Container(
      width: 250,
      height: 130,
      child: Column(
        children: [
          const TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              border: NesInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              focusedBorder: NesInputBorder(    
                borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 4),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 15.0, // Change vertical padding here
                horizontal: 10.0, // Change horizontal padding here
              ),
              labelText: 'Insert a domain', 
              labelStyle: TextStyle(
                fontFamily: 'minecraftia',
                color: Color.fromARGB(255, 0, 0, 0)
              )
            ),
            style: TextStyle(fontFamily: 'minecraftia'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NesButton(type: NesButtonType.warning, child: Text('No'), onPressed: () {}),
              SizedBox(width: 40.0),
              NesButton(type: NesButtonType.primary, child: Text('Yes'), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

void openPage(BuildContext context, page) {
  Navigator.of(context).push(
    NesHorizontalGridTransition.route<void>(
      pageBuilder: (x, y, z) { return page; } 
    )
  );
}

class _MockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: NesIconButton(
            icon: NesIcons.leftArrowIndicator,
            onPress: () => {
              Navigator.of(context).pop()
            },
          )
        ),
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: NesIconButton(
                primaryColor: Color.fromARGB(255, 0, 114, 34),
                icon: NesIcons.edit,
                onPress: () => {},
              ),
            )
          ), 
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: NesIconButton(
                primaryColor: const Color.fromARGB(255, 130, 9, 0),
                icon: NesIcons.delete,
                onPress: () => {},
              ),
            )
          ),    
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/key.png'),
            const SizedBox(height: 8),
            NesButton(
              type: NesButtonType.normal,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
      
    );
  }
}