import 'package:flutter/material.dart';
import 'package:login/login/conpoment/button.dart';
import 'package:login/login/conpoment/text.dart';
import 'package:login/login/conpoment/textfield.dart';
import 'package:login/login/screen_sign.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: AppText(
                text: 'TA',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: AppText(
                text: 'HiTA TeamModel ID',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const AppTextField(
              textHint: 'Enter your username',
              labelTitle: 'Username',
              errorString: '',
              obscuetext: false,
            ),
            const SizedBox(
              height: 5,
            ),
            const AppTextField(
              textHint: 'Enter your password',
              obscureText: true,
              obscuetext: true,
              errorString: '',
            ),
            AppButton(title: 'Login', onPress: () {}),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const RadioGroup();
                      }));
                    },
                    child: const Text('Register'),
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Forget password'),
                  ),
                ),
              ],
            ),
            const Center(
              child: AppText(
                text: 'More Options',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    title: 'f',
                    onPress: () {},
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
                Expanded(
                  child: AppButton(
                    title: 'G',
                    onPress: () {},
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    title: 'Apple',
                    onPress: () {},
                  ),
                ),
                const Divider(
                  color: Colors.yellow,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
                Expanded(
                  child: AppButton(
                    title: 'Chat',
                    onPress: () {},
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
