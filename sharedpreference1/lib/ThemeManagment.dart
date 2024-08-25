import 'package:flutter/material.dart';
import 'package:sharedpreference1/cache/cache-helper.dart';

class Theme1 extends StatefulWidget {
  const Theme1({super.key});

  @override
  State<Theme1> createState() => _Theme1State();
}

class _Theme1State extends State<Theme1> {
  var cache = Cachehelper();
  bool mode = false;
  @override
  void initState() {
    var result = cache.getData(key: 'color');
    setState(() {
      if (result != null) {
        mode = result;
      }
    });
    super.initState();
  }

  void toggleTheme() async {
    setState(() {
      mode = !mode;
    });
    await Cachehelper().setData(key: 'isDark', value: mode);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mode == true ? Colors.black : Colors.white,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Switch(
                    value: mode,
                    onChanged: (value) {
                      setState(() {
                        mode = !mode;
                        cache.setData(key: 'color', value: mode);
                      });
                    }),
                Column(
                  children: [
                    IconButton(
                      iconSize: 40,
                      icon: Icon(mode ? Icons.nights_stay : Icons.wb_sunny),
                      onPressed: toggleTheme,
                    ),
                    Center(
                        child: Text(
                      'Current Theme: ${mode ? "Dark" : "Light"}',
                      style:
                          TextStyle(color: mode ? Colors.white : Colors.black),
                    )),
                  ],
                ),
              ]),
        ));
  }
}
