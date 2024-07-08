import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E'];
  final List<MaterialColor> colors = <MaterialColor>[
    Colors.purple,
    Colors.amber,
    Colors.blueGrey,
    Colors.deepOrange,
    Colors.indigo
  ];

 List<String> textHist = <String>[
    "Achat GCC","Envoyer","Acaht OR","Transfert","Vendre OR"
  ];


  List<Icon> icons = const <Icon>[
    Icon(Icons.monetization_on, color: Colors.white,),
    Icon(Icons.upload, color: Colors.white,),
    Icon(Icons.download, color: Colors.white,),
        Icon(Icons.send_to_mobile, color: Colors.white,),
    Icon(Icons.upload, color: Colors.white,),
  ];
  final List<int> colorCodes = <int>[600, 500, 400, 200, 100];
  // int _selectedIndex = 0;
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    const String solde = "20.00000";

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(0, 0),
          child: AppBar(
            title: const Text('Home'),
            backgroundColor: Colors.white,
          )),
      // drawerScrimColor: Colors.white,

      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 0, left: 6, right: 6),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(60)),
                              color: colors[2]),
                          child: Center(
                              child: Text(
                            'M',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello, Mariko Oudou!",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            Text(
                              "Welcome back",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                    InkWell(
                      child: const Icon(
                        Icons.notifications,
                        size: 36,
                      ),
                      onTap: () {},
                    )
                  ],
                ),
              ),
              SizedBox(
                child: Container(
                  // height: 100,
                  margin: const EdgeInsets.all(6),
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                     gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xff1f005c),
              Color(0xff5b0060),
              Color(0xff870160),
              Color(0xffac255e),
              Color(0xffca485c),
              Color(0xffe16b5c),
              Color(0xfff39060),
              Color(0xffffb56b),
            ], // Gradient from https://learnui.design/tools/gradient-generator.html
            tileMode: TileMode.mirror,
          ),
                    // color: const Color.fromARGB(255, 147, 116, 232),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(184, 183, 180, 1),
                        blurRadius: 8,
                        offset: Offset(2, 6), // Shadow position
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(0),
                            width: 180,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.wallet, color: Colors.white,),
                                    SizedBox(width: 5,),
                                    Text("Your wallet balance", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                 Text(
                                  "$solde GCC",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(0),
                            child: const Icon(
                              Icons.qr_code_scanner,
                              color: Colors.white,
                              size: 40,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: 60,
                                    height: 60,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(bottom: 6),
                                    decoration: BoxDecoration(
                                        color: colors[0],
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Icon(Icons.monetization_on, color: Colors.white,)),
                                const Text(
                                  "Achat GCC",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: 60,
                                    height: 60,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(bottom: 6),
                                    decoration: BoxDecoration(
                                        color: colors[1],
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Icon(Icons.upload, color: Colors.white,)),
                                const Text(
                                  "Envoyer",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: 60,
                                    height: 60,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(bottom: 6),
                                    decoration: BoxDecoration(
                                        color: colors[3],
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Icon(Icons.send_to_mobile, color: Colors.white,)),
                                const Text(
                                  "Transfert",
                                  style: TextStyle(

                                      fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: 60,
                                    height: 60,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(bottom: 6),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Icon(Icons.history, color: Colors.white,)),
                                const Text(
                                  "Historique",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    borderRadius:  BorderRadius.all(Radius.circular(14)),
                    color: Colors.white),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Autre Services",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [

                          InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: 60,
                                    height: 60,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(bottom: 6),
                                    decoration: BoxDecoration(
                                        color: colors[1],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(Icons.upload, color: Colors.white,)),
                                const Text(
                                  "Vendre",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                )
                              ],
                            ),
                          ),

                           InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: 60,
                                    height: 60,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(bottom: 6),
                                    decoration: BoxDecoration(
                                        color: colors[2],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(Icons.download, color: Colors.white,)),
                                const Text(
                                  "Achat",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                )
                              ],
                            ),
                          ),

                           InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: 60,
                                    height: 60,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(bottom: 6),
                                    decoration: BoxDecoration(
                                        color: colors[3],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(Icons.bar_chart, color: Colors.white,)),
                                const Text(
                                  "Valeur Or",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                )
                              ],
                            ),
                          ),

                           InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: 60,
                                    height: 60,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(bottom: 6),
                                    decoration: BoxDecoration(
                                        color: colors[4],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(Icons.wallet, color: Colors.white,)),
                                const Text(
                                  "Info Wallet",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                )
                              ],
                            ),
                          ),

                        ],
                      )


                    ]),
              ),
              Container(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 0, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Historique",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "voir tout",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      // color: Color.fromARGB(255, 129, 102, 20),
                      child: ListTile(
                          onTap: () {
                            //                 Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => QuizPage()),
                            // );
                          },
                          leading: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(60)),
                                color: colors[index]),
                            child: Center(
                                child: icons[index]),
                          ),
                          title:  Text(textHist[index]),
                          // subtitle: LinearProgressIndicator(
                          //   backgroundColor: Colors.white,
                          //   valueColor:
                          //       AlwaysStoppedAnimation<Color>(colors[index]),
                          //   value: 0.6,
                          //   semanticsLabel: 'Linear progress indicator',
                          // ),
                          trailing: const Text(
                            "10.000 GCC",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          )),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
