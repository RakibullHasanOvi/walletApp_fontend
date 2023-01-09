import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallet_ui/Pages/components/login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
// bool _isLoding = false;

//Creater controller,
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //for add
  final _uri = Uri.parse('https://wa.me/16468209892');
  //
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    // double width = MediaQuery.of(context).size.width;

    return SafeArea(
      top: false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFD6001B),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Container(
                  child: SvgPicture.asset(
                    'assets/wallet_logo_w.svg',
                    height: height / 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 40,
                            left: 25,
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(0xFFD6001B),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 28,
                          ),
                          child: const Text(
                            'Lets get started',
                            style: TextStyle(
                              color: Color(0xFF999999),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            right: 28,
                            left: 28,
                          ),
                          child: Form(
                            child: TextFormField(
//Using the _nameController
                              controller: _numberController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(12),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Color.fromARGB(238, 230, 241, 244),
                                hintText: 'Mobile number',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            right: 28,
                            left: 28,
                          ),
                          child: Form(
                            child: TextFormField(
// Using the _password controller.
                              controller: _passwordController,
                              obscureText: _obscureText,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(12),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(238, 230, 241, 244),
                                hintText: 'Password',
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 28),

                              //I am using AlertDialouge box.....

                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                          'Contact With Our Agent',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        content: Container(
                                          // color: Colors.green,
                                          child: GestureDetector(
                                            onTap: () {
                                              launchUrl(
                                                _uri,
                                                mode: LaunchMode
                                                    .externalApplication,
                                              );
                                              print('Ok');
                                            },
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  onPressed: (() {}),
                                                  icon: Image.asset(
                                                    'assets/whatsapp.png',
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const InkWell(
                                                  child: Text(
                                                    '+16468209892',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Text('Forgot password ?'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 25,
                            right: 25,
                          ),
                          child: LoginButton(
                            password: _passwordController.text.toString(),
                            phoneNumber: _numberController.text.toString(),
                          ),
                          //
                          //
                          //
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
