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
  TextEditingController amount_GCC = TextEditingController(text: "00");
  TextEditingController amount_CFA = TextEditingController(text: "00");
  List<dynamic> list = <dynamic>[
    {"title": "VISA", "icon": "assets/icons/visa.png", "id": "visa"},
    {"title": "MTN", "icon": "assets/icons/mtn.png", "id": "mtn"},
    {"title": "BITCOIN", "icon": "assets/icons/bitcoin.jpg", "id": "bitcoin"},
  ];
  dynamic dropdownValue;

  List<TextEditingController> visaTextField = List.generate(4, (i) => TextEditingController());
  List<TextEditingController> mtnTextField = List.generate(2, (i) => TextEditingController());
  List<TextEditingController> bitcoinTextField = List.generate(2, (i) => TextEditingController());
  final double prixMarcher = 46273;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownValue = list.first;
  }

  @override
  Widget build(BuildContext context) {
    // dropdownValue = list.first;
    double heigth = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.zero,
          child: AppBar(
            backgroundColor: const Color(0xeeeeeeee),
          )),
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              // height: heigth,
              decoration: const BoxDecoration(color: Color(0xeeeeeeee)),
              child: Column(
                children: [
                  headPageBuy(context),
                  const SizedBox(
                    height: 18,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: heigth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color.fromARGB(
                                              237, 245, 241, 241),
                                        ),
                                        child: ListTile(
                                          title: const Text(
                                            "Golden Chain Coin",
                                            style:  TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          subtitle: Row(
                                            children: [
                                              Text(
                                                "$prixMarcher => ",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              const Text(
                                                "1 GCC",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.green,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          trailing: const Icon(
                                            Icons.currency_exchange_rounded,
                                            size: 40,
                                            color: Color.fromARGB(
                                                255, 237, 160, 7),
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
                                                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                  style: const TextStyle(
                                                      fontSize: 32,
                                                      fontWeight: FontWeight.bold),
                                                  prefixStyle: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                                                  // prefixIcon: const Text("CFA", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                                  validatorMethod: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please enter some text';
                                                    }
                                                    return null;
                                                  },

                                                  onChanged:(p0) {
                                                    setState(() {
                                                    amount_CFA.text = (double.parse(p0.isEmpty?"0":p0)* prixMarcher).toString();
                                                    });
                                                  },
                                                  
                                                  ),
                                              inputForm(
                                                  controller: amount_CFA,
                                                  suffixText: "CFA",
                                                  readOnly: true,
                                                  enable: false,
                                                  textDirection: TextDirection.rtl,
                                                  suffixStyle: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold),
                                                  obscureText: false,
                                                  
                                                  validatorMethod: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please enter some text';
                                                    }
                                                    return null;
                                                  }),
                                            ],
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 18,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(6),
                                        alignment: Alignment.topLeft,
                                        child: const Text("Choisissez le moyen de paiement"),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(0),
                                        width: double.infinity,
                                        alignment: Alignment.topLeft,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            DropdownButtonHideUnderline(
                                              child: DropdownButton<dynamic>(
                                                value: dropdownValue,
                                                icon: const Icon(Icons.check),
                                                elevation: 16,
                                                isExpanded: true,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                                onChanged: (dynamic? value) {
                                                  // This is called when the user selects an item.
                                                  setState(() {
                                                    dropdownValue = value!;
                                                  });
                                                },
                                                items: list.map<DropdownMenuItem<dynamic>>((dynamic value) {
                                                  return DropdownMenuItem<
                                                      dynamic>(
                                                    value: value,
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          value["icon"],
                                                          width: 80,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(value["title"]),
                                                      ],
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            dropdownValue["id"] == "visa" ? visaTextFieldForm(width):
                                            dropdownValue["id"] == "mtn" ? mtnTextFieldForm():
                                            dropdownValue["id"] == "bitcoin" ? bitcoinTextFieldForm() : Container()
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          buttonSubmit(
                              context: context,
                              onPressed: () => showModal(context: context))
                        ],
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }

  Container bitcoinTextFieldForm() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          inputForm(
            labelText: "Adresse Bitcoin",
             prefixIcon: const Icon(Icons.wallet),
            controller: bitcoinTextField[0], obscureText: false, validatorMethod: (value){})
        ],
      )
      
    );
  }

  Container mtnTextFieldForm() {
    return Container(padding: const EdgeInsets.all(10),
    child: inputForm(
            labelText: "Numéro de téléphone",
             prefixIcon: const Icon(Icons.phone),
            controller: bitcoinTextField[0], obscureText: false, validatorMethod: (value){}),);
  }

  Container visaTextFieldForm(double width) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        children: [
          inputForm(
            labelText: "Numéro de carte",
            prefixIcon: const Icon(Icons.numbers_outlined),
            controller: visaTextField[0], obscureText: false, validatorMethod: (value){}),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                  width: width * 0.45, 
                  child:  inputForm(
                  maxLength: 30,
                  labelText: "Validité",
                  prefixIcon: const Icon(Icons.numbers_outlined),
                  controller: visaTextField[1], obscureText: false, validatorMethod: (value){}),),

                  SizedBox(width: width * 0.35,
                  child:  inputForm(
                  labelText: "CVV",
                  prefixIcon: const Icon(Icons.numbers_outlined),
                  controller: visaTextField[2], obscureText: false, validatorMethod: (value){}),),
                ],
              ),
            inputForm(
            labelText: "Titulaire de la carte",
            maxLength: 16,
            prefixIcon: const Icon(Icons.numbers_outlined),
            controller: visaTextField[3], obscureText: false, validatorMethod: (value){}),
          
        ],
      ),
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
      int? maxLength = 9,
      bool readOnly = false,
      TextDirection? textDirection,
      required TextEditingController controller,
      required bool obscureText,
      bool? enable,
      required String? Function(String?) validatorMethod,
      void Function(String)? onChanged
      }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      readOnly: readOnly,
      style: style,
      autofocus: true,
      enabled: enable,
      maxLength: maxLength,
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
      onChanged: onChanged,
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
            backgroundColor: MaterialStateProperty.all(
              Color.fromARGB(255, 237, 160, 7),
            ),
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
