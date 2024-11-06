import 'package:flutter/material.dart';
import 'package:mfec_frontend/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _form = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

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
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 60, 50, 15),
                child: Image.asset("assets/icon.png"),
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
              const Padding(padding: EdgeInsets.only(bottom: 15)),
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
                          icon: Icon(Icons.email),
                          label: Text("อีเมล"),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: primaryLightColor, width: 2)),
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
                          label: const Text("รหัสผ่าน"),
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
                              borderSide: BorderSide(
                                  color: primaryLightColor, width: 2)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor, width: 2))),
                    ),
                    TextFormField(
                      controller: _confirmPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "กรุณากรอกรหัสผ่าน";
                        } else if (value.length < 8) {
                          return "รหัสผ่านต้องมีความยาวอย่างน้อย 8 ตัวอักษร";
                        } else if (value != _passwordController.text) {
                          return "รหัสผ่านต้องเหมือนกับด้านบน";
                        } else {
                          return null;
                        }
                      },
                      obscureText: !_confirmPasswordVisible,
                      decoration: InputDecoration(
                          label: const Text("ยืนยันรหัสผ่าน"),
                          icon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: (() {
                                setState(() {
                                  _confirmPasswordVisible =
                                      !_confirmPasswordVisible;
                                });
                              }),
                              icon: Icon(
                                _confirmPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              )),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: primaryLightColor, width: 2)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor, width: 2))),
                    )
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: (() {
                    _form.currentState!.validate();
                  }),
                  child: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      "ลงทะเบียน",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
