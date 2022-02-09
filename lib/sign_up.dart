import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _numberController = TextEditingController();
  final _placeController = TextEditingController();

  int emailLength = 0;
  int numberLength = 0;
  int placeLength = 0;
  bool _buttonClicked = false;

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: Scaffold(
        body: Stack(
          fit: StackFit.loose,
          children: [
            Container(
              color: const Color(0xFFFF6F00),
              width: double.infinity,
              height: 230,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 6.0),
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(
                      'Sign Up',
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
              transform: Matrix4.translationValues(0, 150, 0),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 30.0, top: 70.0, right: 30.0),
                child: SingleChildScrollView(
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
                      TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[a-z0-9@.]')),
                        ],
                        controller: _emailController,
                        onChanged: (text) {
                          setState(() {
                            emailLength = text.length;
                          });
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          errorText: _buttonClicked
                              ? emailLength > 10
                                  ? null
                                  : 'Email should be at least 10 digits'
                              : null,
                          suffixIcon: Icon(
                            emailLength > 10 ? Icons.check : null,
                            color: Colors.green,
                          ),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 40.0),
                        child: Text(
                          'Number',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp('[0-9]'),
                          ),
                        ],
                        controller: _numberController,
                        onChanged: (text) {
                          setState(() {
                            numberLength = text.length;
                          });
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          errorText: _buttonClicked
                              ? numberLength == 10
                                  ? null
                                  : 'Number should be 10 digits'
                              : null,
                          suffixIcon: Icon(
                            numberLength == 10 ? Icons.check : null,
                            color: Colors.green,
                          ),
                          hintText: 'Enter Number',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 40.0),
                        child: Text(
                          'Number',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp('[a-zA-z]'),
                          ),
                        ],
                        controller: _placeController,
                        onChanged: (text) {
                          setState(() {
                            placeLength = text.length;
                          });
                        },
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          errorText: _buttonClicked
                              ? placeLength > 5
                                  ? null
                                  : 'Place name should be greater than 5 digits'
                              : null,
                          suffixIcon: Icon(
                            placeLength > 5 ? Icons.check : null,
                            color: Colors.green,
                          ),
                          hintText: 'Enter Number Place',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 80,
                        padding: const EdgeInsets.only(
                          top: 40,
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                            const Color(0xFFFF6F00),
                          )),
                          onPressed: () {
                            setState(() {
                              _buttonClicked = true;
                            });
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: const [
                          Expanded(
                              child: Divider(
                            color: Colors.black26,
                            height: 80.0,
                            thickness: 1.0,
                            endIndent: 10.0,
                          )),
                          Text(
                            "OR",
                            style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.black26,
                              height: 80.0,
                              thickness: 1.0,
                              indent: 10.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: IconButton(
                              onPressed: () {
                                Fluttertoast.showToast(
                                  msg: 'Instagram',
                                  backgroundColor: const Color(0xFFFF6F00),
                                  textColor: Colors.white,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              },
                              icon: const Icon(
                                MdiIcons.instagram,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: IconButton(
                              onPressed: () {
                                Fluttertoast.showToast(
                                  msg: 'Dribbble',
                                  backgroundColor: const Color(0xFFFF6F00),
                                  textColor: Colors.white,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              },
                              icon: const Icon(MdiIcons.basketball),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Fluttertoast.showToast(
                                msg: 'Behance',
                                backgroundColor: const Color(0xFFFF6F00),
                                textColor: Colors.white,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                            },
                            icon: const Icon(Icons.info),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
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
