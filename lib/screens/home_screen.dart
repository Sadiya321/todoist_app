import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/localization/languages/languages.dart';
import 'package:todo_app/theme/theme_const.dart';
import 'package:todo_app/widgets/app_textview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          // Top container
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Container(
              
              color: Theme.of(context).colorScheme.primary, // Set your color here
            ),
          ),
          // Bottom container with border radius
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3 -50.0, // Slightly overlap the top container
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background, // Set your color here
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60.0), // Set your border radius here
                  // topRight: Radius.circular(30.0), // Set your border radius here
                ),
              ),
            ),
          ),
          // Your main content goes here
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AppTextView(
                    text: Languages.of(context).toDo,
                    textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 14.sp,
                        color: Theme.of(context)
                            .colorScheme
                            .primaryColor
                            .withOpacity(0.6),
                        fontWeight: FontWeight.w600)),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
