import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_with_getx/view/screen/Splash/Splash.dart';

class AppLifecycleScreen extends StatefulWidget {
  const AppLifecycleScreen({super.key});

  @override
  State<AppLifecycleScreen> createState() => _AppLifecycleScreenState();
}

class _AppLifecycleScreenState extends State<AppLifecycleScreen> {
  int a = 0;

  @override
  void didUpdateWidget(covariant AppLifecycleScreen oldWidget) {
    log("=========== didUpdateWidget ===============");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    log("=========== didChangeDependencies ===============");
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    log("=========== Dispose ===============");
    super.dispose();
  }

  @override
  void initState() {
    log("=========== Initstate ===============");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("=========== build ===============");
    return Scaffold(
      appBar: AppBar(
        title: Text("App Lifecycle  $a"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    log("================== Set state ==============");
                    a++;
                  });
                },
                child: Text("SetState")),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Get.to(Splash());
                  //  Get.offAll(Splash());
                },
                child: Text("Next")),
          ],
        ),
      ),
    );
  }
}
