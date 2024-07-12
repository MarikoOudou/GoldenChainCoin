import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldenchaincoin/pages/home/home_page.dart';

class BuyPage extends StatefulWidget {
  static const String routeName = '/buy';

  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController amount_GCC = TextEditingController(text: "000.000.0");
  TextEditingController amount_CFA = TextEditingController(text: "123456789");
  List<dynamic> list = <dynamic>[
    {"title": "VISA", "icon": "assets/icons/visa.png", "id": "visa"},
    {"title": "MTN", "icon": "assets/icons/mtn.png", "id": "mtn"},
    {"title": "BITCOIN", "icon": "assets/icons/bitcoin.jpg", "id": "bitcoin"},
    ];
  dynamic dropdownValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownValue = list.first;
  }

  @override
  Widget build(BuildContext context) {
    // dropdownValue = list.first;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(0, 0),
          child: AppBar(
            backgroundColor: const Color(0xeeeeeeee),
          )),
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: const BoxDecoration(color: Color(0xeeeeeeee)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headPageBuy(context),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(237, 245, 241, 241),
                                ),
                                child: const ListTile(
                                  title: Text(
                                    "Golden Chain Coin",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Text(
                                        "46.273 CFA => ",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        "1 GCC",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  trailing: Icon(
                                    Icons.currency_exchange_rounded,
                                    size: 40,
                                    color: Color.fromARGB(255, 237, 160, 7),
                                  ),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      inputForm(
                                          controller: amount_GCC,
                                          obscureText: false,
                                          prefixText: "GCC ",
                                          keyboardType:
                                              TextInputType.numberWithOptions(
                                                  decimal: true),
                                          style: const TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold),
                                          prefixStyle: const TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold),
                                          // prefixIcon: const Text("CFA", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                          validatorMethod: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter some text';
                                            }
                                            return null;
                                          }),
                                      // inputForm(
                                      //     controller: amount_CFA,
                                      //     suffixText: "CFA",
                                      //     readOnly: true,
                                      //     textDirection: TextDirection.rtl,
                                      //     suffixStyle: const TextStyle(
                                      //       fontSize: 18,
                                      //       fontWeight: FontWeight.bold),
                                      //     obscureText: false,
                                      //     validatorMethod: (value) {
                                      //       if (value == null ||
                                      //           value.isEmpty) {
                                      //         return 'Please enter some text';
                                      //       }
                                      //       return null;
                                      //     }),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                          padding: const EdgeInsets.all(10),
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(6),
                                alignment: Alignment.topLeft,
                                child: Text("Choisissez le moyen de paiement"),
                              ),
                              const SizedBox(height: 10,),
                              Container(
                                  padding: EdgeInsets.all(0),
                                  width: double.infinity,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<dynamic>(
                                      value: dropdownValue,
                                      icon: const Icon(Icons.check),
                                      elevation: 16,
                                      style: const TextStyle(color: Colors.black),
                                      // underline: Container(
                                      //   height: 2,
                                      //   color: Colors.deepPurpleAccent,
                                      // ),
                                      onChanged: (dynamic? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          dropdownValue = value!;
                                        });
                                      },
                                      items: list.map<DropdownMenuItem<dynamic>>((dynamic value) {
                                        return DropdownMenuItem<dynamic>(
                                          value: value,
                                          child:  Row(
                                            children: [
                                              Image.asset(value["icon"], width: 80,),
                                              SizedBox(width: 10,),
                                              Text(value["title"]),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              
                            ],
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      buttonSubmit(
                          context: context,
                          onPressed: () => showModal(context: context))
                    ],
                  ),
                ],
              ))),
    );
  }

  Row headPageBuy(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
            style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(20, 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadowColor: Colors.black,
                side: const BorderSide(color: Colors.transparent, width: 0)),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            )),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              "Buy GCC",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        )
      ],
    );
  }

  TextFormField inputForm(
      {String? labelText,
      String? hintText,
      TextInputType? keyboardType,
      Widget? suffixIcon,
      Widget? prefixIcon,
      String? prefixText,
      String? suffixText,
      TextStyle? prefixStyle,
      TextStyle? suffixStyle,
      TextStyle? style,
      bool readOnly = false,
      TextDirection? textDirection,
      required TextEditingController controller,
      required bool obscureText,
      required String? Function(String?) validatorMethod}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      readOnly: readOnly,
      style: style,
      autofocus: true,
      maxLength: 9,
      enableSuggestions: false,
      maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
      showCursor: true,
      mouseCursor: MouseCursor.uncontrolled,
      cursorColor: Colors.amber,

      // maxLines: 0,
      textDirection: textDirection,
      // onChanged: null,
      decoration: InputDecoration(
          labelText: labelText,
          prefixText: prefixText,
          suffixText: suffixText,
          suffixStyle: suffixStyle,
          prefixStyle: prefixStyle,
          counterText: '',
          counterStyle: TextStyle(fontSize: 0),
          // hintStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          // labelStyle: const TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
          floatingLabelBehavior:
              FloatingLabelBehavior.never, //Hides label on focus or if filled
          filled: true, // Needed for adding a fill color
          fillColor: Colors.white,
          isDense: true,
          enabledBorder:
              const UnderlineInputBorder(borderSide: BorderSide.none),
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // No border
            borderRadius: BorderRadius.circular(12), // Apply corner radius
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          errorStyle: const TextStyle(color: Colors.black),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
      validator: validatorMethod,
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
            backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 237, 160, 7),),
            // textStyle: MaterialStateProperty.all(const TextStyle(
            //     fontSize: 20,
            //     color: Color.fromARGB(255, 0, 0, 0),
            //     fontWeight: FontWeight.bold)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: const BorderSide(color: Colors.amber)))),
        onPressed: onPressed,
        child: const Text(
          'Acheter GCC',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  showModal({required BuildContext context}) {
    return showModalBottomSheet<void>(
      context: context,
      isDismissible: true,
      builder: (BuildContext context) {
        return Container(
          height: 380,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 237, 160, 7),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context, HomePage.routeName, ModalRoute.withName('/')),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
