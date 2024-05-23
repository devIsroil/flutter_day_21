import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day_21/homework/Task1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'homework/Task2.dart';
import 'homework/Task3.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: PageView(
            children: [ Task1Screen(), Task2Screen(), Task3Screen()],
          ),
        );
      },
    );
  }
}
