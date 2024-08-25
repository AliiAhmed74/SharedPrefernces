import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sharedpreference1/cache/cache-helper.dart';
import 'package:sharedpreference1/onboardingscreen.dart';

class ProfileData extends StatefulWidget {
  const ProfileData({super.key});

  @override
  State<ProfileData> createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {
  var cache = Cachehelper();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  var result1;
  var result2;
  var result3;
  var result4;
  @override
  void initState() {
    cache.getData(key: 'lastPage');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
        AppBar(
        title: Text('Profile Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
             Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => OnboardingScreen()),); // Go back to the previous screen
          },
        ),
      ),
        body: Padding(
      padding: const EdgeInsets.only(
        top: 50,
      ),
      child: ListView(
        children: [
          Column(children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(
                      'assets/1000_F_339459697_XAFacNQmwnvJRqe1Fe9VOptPWMUxlZP8.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller1,
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller2,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(2),
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  labelText: 'Enter your age (only 2 digits)',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller3,
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller4,
                decoration: InputDecoration(
                  labelText: 'Enter your Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        cache.setData(key: 'first', value: controller1.text);
                        cache.setData(key: 'second', value: controller2.text);
                        cache.setData(key: 'third', value: controller3.text);
                        cache.setData(key: 'fourth', value: controller4.text);
                      });
                      print("Data Saved===================>>");

                      // Action for Button 1
                    },
                    child: Text("SaveData"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        var res1 = cache.getData(key: 'first');
                        result1 = res1;
                        var res2 = cache.getData(key: 'second');
                        result2 = res2;
                        var res3 = cache.getData(key: 'third');
                        result3 = res3;
                        var res4 = cache.getData(key: 'fourth');
                        result4 = res4;
                        print(result1);
                        print(result2);
                        print(result3);
                        print(result4);
                      });
                      // Action for Button 2
                    },
                    child: Text("ReadData"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                          cache.setData(key: 'first', value: controller1.text);
                          cache.setData(key: 'second', value: controller2.text);
                          cache.setData(key: 'third', value: controller3.text);
                          cache.setData(key: 'fourth', value: controller4.text);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Data Updated'),
                          ));
                          print("Data Updated==================>>");
                      });
                      // Action for Button 3
                    },
                    child: Text("UpdateData"),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                result1 != null ? Text("name:$result1") : SizedBox(),
                result2 != null ? Text("age:$result2") : SizedBox(),
                result3 != null ? Text("email:$result3") : SizedBox(),
                result4 != null ? Text("pass:$result4") : SizedBox(),
              ],
            ),
          ]),
        ],
      ),
    ));
  }
}
