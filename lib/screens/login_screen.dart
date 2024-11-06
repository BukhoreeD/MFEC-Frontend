import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mfec_frontend/constants.dart';
import 'package:mfec_frontend/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: MediaQuery.of(context).padding.bottom,
            left: defaultPadding,
            right: defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Image.asset("assets/icon.png"),
              margin: const EdgeInsets.fromLTRB(50, 30, 50, 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "งอม",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Text(
                  "go",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Form(
              key: _form,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกอีเมล';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return "กรุณากรอกอีเมลให้ถูกต้อง";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: "อีเมล",
                        // hintText: "อีเมล",
                        icon: Icon(Icons.email),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryLightColor, width: 2)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor, width: 2))),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "กรุณากรอกรหัสผ่าน";
                      } else if (value.length < 8) {
                        return "รหัสผ่านต้องมีความยาวอย่างน้อย 8 ตัวอักษร";
                      } else {
                        return null;
                      }
                    },
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                        labelText: "รหัสผ่าน",
                        // hintText: "รหัสผ่าน",
                        icon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: (() {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            }),
                            icon: Icon(_passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryLightColor, width: 2)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor, width: 2))),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: primaryLightColor,
                        blurRadius: 20,
                        offset: Offset(0, 5))
                  ]),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: (() {
                      _form.currentState!.validate();
                    }),
                    child: const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        "เข้าสู่ระบบ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: OutlinedButton(
                    onPressed: (() {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => const RegisterScreen()));
                    }),
                    child: const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text("ลงทะเบียน"),
                    ),
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 2, color: primaryColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                TextButton(
                    onPressed: (() {}), child: const Text("ลืมรหัสผ่าน")),
                Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: primaryLightColor,
                          blurRadius: 20,
                          offset: Offset(0, 5))
                    ]),
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton.icon(
                      onPressed: (() {}),
                      icon: SizedBox(
                        child: Image.asset("assets/google_icon.png"),
                        width: 40,
                      ),
                      label: const Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text("เข้าสู่ระบบด้วย Google"),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
