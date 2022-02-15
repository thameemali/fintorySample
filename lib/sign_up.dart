import 'dart:io';

import 'package:fintory_sample/custom_dropdown.dart';
import 'package:fintory_sample/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
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
  final List<String> countryList = [
    'India',
    'Sri Lanka',
    'Nepal',
    'Bhutan',
    'Pakistan',
    'Myanmar',
    'China',
    'Singapore',
    'Malaysia',
    'South Corea',
  ];
  final List<String> stateList = [
    'Kerala',
    'Karnataka',
    'Tamil Nadu',
    'Goa',
    'Telengana',
    'Seemandhra',
    'Maharashtra',
    'Assam',
    'Bihar',
    'West Bengal',
  ];
  final List<String> cityList = [
    'Cochi',
    'Bengaluru',
    'Chennai',
    'Panaji',
    'Hyderabad',
    'Mangalagiri',
    'Mumbai',
    'Dispur',
    'Patna',
    'Kolkata',
  ];

  int emailLength = 0;
  int numberLength = 0;
  int placeLength = 0;
  bool _buttonClicked = false;
  bool _signinClicked = false;
  String _selectedGender = 'male';

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

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
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: 200.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Stack(
                                  fit: StackFit.loose,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: image != null
                                          ? Image.file(
                                              image!,
                                              width: 120,
                                              height: 120,
                                              fit: BoxFit.cover,
                                            )
                                          : const Image(
                                              image: AssetImage(
                                                  'assets/image/chris.jpg'),
                                              width: 120,
                                              height: 120,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white60,
                                      ),
                                      margin: const EdgeInsets.only(
                                        left: 40.0,
                                        top: 75.0,
                                      ),
                                      child: IconButton(
                                        onPressed: () => pickImage(),
                                        icon: const Icon(
                                          Icons.camera_alt,
                                          color: Color(0xFFFF6F00),
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                              FilteringTextInputFormatter.allow(
                                  RegExp('[a-z0-9@.]')),
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
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              errorText: _buttonClicked
                                  ? isEmail(_emailController.text)
                                      ? null
                                      : 'Email should be of the form \'anna@gmail.com\''
                                  : null,
                              suffixIcon: Icon(
                                isEmail(_emailController.text)
                                    ? Icons.check
                                    : null,
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
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              color: Colors.black54,
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
                            padding: EdgeInsets.only(
                              top: 40.0,
                              bottom: 20.0,
                            ),
                            child: Text(
                              'Gender',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: Radio<String>(
                                    activeColor: const Color(0xFFFF6F00),
                                    value: 'male',
                                    groupValue: _selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value!;
                                      });
                                    },
                                  ),
                                  title: const Text(
                                    'Male',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: Radio<String>(
                                    activeColor: Color(0xFFFF6F00),
                                    value: 'female',
                                    groupValue: _selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value!;
                                      });
                                    },
                                  ),
                                  title: const Text(
                                    'Female',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: Radio<String>(
                                    activeColor: Color(0xFFFF6F00),
                                    value: 'other',
                                    groupValue: _selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value!;
                                      });
                                    },
                                  ),
                                  title: const Text(
                                    'Other',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 20.0,
                              bottom: 20.0,
                            ),
                            child: Text(
                              'Country',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          CustomDropDown(
                            passKey: 1,
                            list: countryList,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 40.0,
                              bottom: 20.0,
                            ),
                            child: Text(
                              'State',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: CustomDropDown(
                              passKey: 2,
                              list: stateList,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 40.0,
                              bottom: 20.0,
                            ),
                            child: Text(
                              'City',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: CustomDropDown(
                              passKey: 3,
                              list: cityList,
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
                                  Fluttertoast.showToast(
                                    msg: 'Signing up...',
                                    backgroundColor: const Color(0xFFFF6F00),
                                    textColor: Colors.white,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                  );
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
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
                ),
              ),
            ),
            Center(
              child: _buttonClicked
                  ? const CircularProgressIndicator(
                      color: Color(0xFFFF6F00),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  File? image;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemp = File(image.path);
    setState(() {
      this.image = imageTemp;
    });
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
