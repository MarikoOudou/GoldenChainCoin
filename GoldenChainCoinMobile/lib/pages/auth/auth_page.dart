import 'package:flutter/material.dart';
import 'package:goldenchaincoin/pages/home/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPage extends StatefulWidget {
  static const String routeName = '/auth';

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(0, 0),
          child: AppBar(
            backgroundColor: Color(0xeeeeeeee),
          )),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "Golden Chain Coin".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.amber,
                          fontFamily: GoogleFonts.gabriela().fontFamily,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Slogan a ",
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      inputForm(
                          controller: username,
                          labelText: "Username",
                          hintText: "username",
                          prefixIcon: const Icon(Icons.person),
                          obscureText: false,
                          validatorMethod: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      inputForm(
                          controller: password,
                          labelText: "Password",
                          obscureText: !_passwordVisible,
                          hintText: "password",
                          prefixIcon: const Icon(
                            Icons.lock_rounded,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              )),
                          validatorMethod: (val) =>
                              val!.length < 6 ? 'Password too short.' : null),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.amber,
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Forget password ?",
                            style: TextStyle(color: Colors.black),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      buttonSubmit(
                          context: context,
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                              Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, ModalRoute.withName('/'));
                            }
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  Container buttonSubmit(
      {required BuildContext context, void Function()? onPressed}) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.amber),
            // textStyle: MaterialStateProperty.all(const TextStyle(
            //     fontSize: 20,
            //     color: Color.fromARGB(255, 0, 0, 0),
            //     fontWeight: FontWeight.bold)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: const BorderSide(color: Colors.amber)))),
        onPressed: onPressed,
        child: const Text(
          'Log in',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  TextFormField inputForm(
      {String? labelText,
      String? hintText,
      TextInputType? keyboardType,
      Widget? suffixIcon,
      Widget? prefixIcon,
      required TextEditingController controller,
      required bool obscureText,
      required String? Function(String?) validatorMethod}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,

      decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior:
              FloatingLabelBehavior.never, //Hides label on focus or if filled
          filled: true, // Needed for adding a fill color
          fillColor: Colors.white,
          isDense: true,
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.amber, width: 1)),
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // No border
            borderRadius: BorderRadius.circular(12), // Apply corner radius
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          errorStyle: const TextStyle(color: Colors.black),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
      validator: validatorMethod,
    );
  }
}
