
import 'package:fintory_sample/home_page.dart';
import 'package:fintory_sample/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  DateTime currentBackPressTime = DateTime.now();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final String _email = "aaa@bbb.com";
  final String _password = "123456";

  String _userEmail = "";
  String _userPass = "";

  bool _obscureText = true;
  bool _buttonClick = false;
  bool _loginSuccess=false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: Scaffold(
        body: WillPopScope(onWillPop: onWillPop,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                color: const Color(0xFFFF6F00),
                width: double.infinity,
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                          image: AssetImage('assets/image/chris.jpg'),
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15.0, bottom: 6.0),
                        child: Text(
                          'Welcome',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
                transform: Matrix4.translationValues(0, 180, 0),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 30.0, top: 100.0, right: 30.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          controller: _emailController,
                          onChanged: (text) {
                            setState(() {
                              _userEmail = text.toString();
                            });
                          },
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-z0-9@.]')),
                          ],
                          autofocus: true,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            errorText: _buttonClick
                                ? _userEmail == _email
                                    ? null
                                    : 'Wrong email !!!'
                                : null,
                            suffixIcon: Icon(
                                _userEmail == _email ? Icons.check : null,
                                color: Colors.green),
                            hintText: 'Enter Email',
                            hintStyle: const TextStyle(
                              color: Colors.black26,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 50.0),
                          child: Text(
                            'Password',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextFormField(
                          onChanged: (text) {
                            setState(() {
                              _userPass = text.toString();
                            });
                          },
                          obscureText: _obscureText,
                          controller: _passwordController,
                          textInputAction: TextInputAction.done,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp('[0-9]'),
                            ),
                          ],
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            errorText: _buttonClick
                                ? _userPass == _password
                                    ? null
                                    : 'Incorrect Password !!!'
                                : null,
                            suffixIcon: IconButton(
                              onPressed: _toggle,
                              icon: Icon(
                                _obscureText
                                    ? MdiIcons.eyeOutline
                                    : MdiIcons.eyeOffOutline,
                                color: Colors.black38,
                              ),
                            ),
                            hintText: 'Enter Password',
                            hintStyle: const TextStyle(
                              color: Colors.black26,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: TextButton(
                            onPressed: () {
                              Fluttertoast.showToast(
                                msg: 'Reset your Password',
                                backgroundColor: const Color(0xFFFF6F00),
                                textColor: Colors.white,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                            },
                            child: const Text(
                              'Forget Password?',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 100,
                          padding: const EdgeInsets.only(
                            top: 50,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                              primary: const Color(0xFFFF6F00),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            onPressed: () async {
                              setState(()  {
                                _buttonClick = true;
                                _userEmail = _emailController.text;
                                _userPass = _passwordController.text;
                              });
                              if (_userEmail == _email &&
                                  _userPass == _password) {
                                _loginSuccess=true;
                                final sharedPreference =
                                await SharedPreferences.getInstance();
                                sharedPreference.setString(
                                    'useremail', _userEmail);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                                Fluttertoast.showToast(
                                  msg: 'Signing In...',
                                  backgroundColor: const Color(0xFFFF6F00),
                                  textColor: Colors.white,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              } else {
                                Fluttertoast.showToast(
                                  msg:
                                  'Please check the details you have entered',
                                  backgroundColor: const Color(0xFFFF6F00),
                                  textColor: Colors.white,
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              }
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t have an account? ',
                                style: TextStyle(
                                  color: Colors.black26,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignUp(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFFFF6F00)),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: _loginSuccess
                    ? const CircularProgressIndicator(
                  color: Color(0xFFFF6F00),
                )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<bool> onWillPop() async {
    DateTime now = DateTime.now();
    bool backbutton = currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2);
    if (backbutton) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press again to exit',
        backgroundColor: Colors.white,
        textColor: Colors.deepOrange,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );

      return false;
    } else {
      SystemNavigator.pop();
      return true;
    }
  }
}

class DismissKeyboard extends StatelessWidget {
  final Widget child;

  const DismissKeyboard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
