import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldenchaincoin/models/Historique.dart';
import 'package:goldenchaincoin/pages/buy/buy_page.dart';
import 'package:goldenchaincoin/pages/home/logic/cubit/home_cubit.dart';
import 'package:goldenchaincoin/pages/home/model/HomeModel.dart';
import 'package:money_formatter/money_formatter.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  HomePage({super.key});

  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E'];
  final List<MaterialColor> colors = <MaterialColor>[
    Colors.purple,
    Colors.amber,
    Colors.blueGrey,
    Colors.deepOrange,
    Colors.indigo
  ];

  MoneyFormatter fmf = MoneyFormatter(
      amount: 123456789,
      settings: MoneyFormatterSettings(
          symbol: 'GCC',
          thousandSeparator: '.',
          decimalSeparator: ',',
          symbolAndNumberSeparator: ' ',
          fractionDigits: 3,
          compactFormatType: CompactFormatType.short));

  List<String> historiques = <String>[
    "Achat GCC",
    "Envoyer",
    "Acaht OR",
    "Transfert",
    "Vendre OR"
  ];

  List<Icon> icons = const <Icon>[
    Icon(
      Icons.monetization_on,
      color: Colors.white,
    ),
    Icon(
      Icons.upload,
      color: Colors.white,
    ),
    Icon(
      Icons.download,
      color: Colors.white,
    ),
    Icon(
      Icons.send_to_mobile,
      color: Colors.white,
    ),
    Icon(
      Icons.upload,
      color: Colors.white,
    ),
  ];
  final List<int> colorCodes = <int>[600, 500, 400, 200, 100];

  // HomeModel _homeModel = HomeModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(0, 0),
          child: AppBar(
            backgroundColor: const Color(0xeeeeeeee),
          )),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 0, left: 6, right: 6),
          decoration: const BoxDecoration(color: Color(0xeeeeeeee)),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LoadedState) {
                HomeModel homeModel = state.homeInfo;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headerHome(context, homeModel.username),
                    myCardWallet(context, homeModel.balance),
                    const SizedBox(
                      height: 0,
                    ),
                    otherService(),
                    Container(
                        padding: const EdgeInsets.all(10),
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
                    HistoriqueTransaction(
                        entries: entries,
                        colors: colors,
                        icons: icons,
                        historiques: homeModel.historiques,
                        moneyFormatter: fmf)
                  ],
                );
              } else {
                return const Center(
                  child: Text("ERROR PAGE"),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Container otherService() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          color: Colors.white),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Autre Services",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
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
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.upload,
                        color: Colors.white,
                      )),
                  const Text(
                    "Vendre",
                    style: TextStyle(fontSize: 12, color: Colors.black),
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
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.download,
                        color: Colors.white,
                      )),
                  const Text(
                    "Achat",
                    style: TextStyle(fontSize: 12, color: Colors.black),
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
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.bar_chart,
                        color: Colors.white,
                      )),
                  const Text(
                    "Valeur Or",
                    style: TextStyle(fontSize: 12, color: Colors.black),
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
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.wallet,
                        color: Colors.white,
                      )),
                  const Text(
                    "Info Wallet",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }

  Container myCardWallet(BuildContext context, double balance) {
    return Container(
      margin: const EdgeInsets.all(12),
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
                width: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.wallet,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Your wallet balance",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      fmf
                          .copyWith(
                              amount: balance,
                              fractionDigits: 0,
                              compactFormatType: CompactFormatType.short)
                          .output
                          .symbolOnRight,
                      style: const TextStyle(
                          fontSize: 25,
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
                  size: 50,
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
              buttonActionWallet(
                  action: () {
                    Navigator.pushNamed(context, BuyPage.routeName);
                  },
                  name: "Achat GCC",
                  iconsAction: Icons.monetization_on,
                  backgroundColor: colors[0]),
              buttonActionWallet(
                  action: () {
                    // Navigator.pushNamed(context, BuyPage.routeName);
                  },
                  name: "Envoyer",
                  iconsAction: Icons.upload,
                  backgroundColor: colors[1]),
              buttonActionWallet(
                  action: () {
                    // Navigator.pushNamed(context, BuyPage.routeName);
                  },
                  name: "Transfert",
                  iconsAction: Icons.send_to_mobile,
                  backgroundColor: colors[3]),
              buttonActionWallet(
                  action: () {
                    // Navigator.pushNamed(context, BuyPage.routeName);
                  },
                  name: "Historique",
                  iconsAction: Icons.history,
                  backgroundColor: Colors.blue)
            ],
          )
        ],
      ),
    );
  }

  InkWell buttonActionWallet(
      {void Function()? action,
      required String name,
      required IconData iconsAction,
      required Color backgroundColor}) {
    return InkWell(
      onTap: action,
      splashColor: Colors.white,
      focusColor: Colors.grey,
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
                  color: backgroundColor,
                  // boxShadow: [
                  //   BoxShadow(color: backgroundColor, blurRadius: 2),
                  //   BoxShadow(color: backgroundColor, blurRadius: 2),
                  // ],
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(
                iconsAction,
                color: Colors.white,
              )),
          Text(
            name,
            style: const TextStyle(
                fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Padding headerHome(BuildContext context, String username) {
    return Padding(
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
                    borderRadius: const BorderRadius.all(Radius.circular(60)),
                    color: colors[2]),
                child: Center(
                    child: Text(
                  username.toString().substring(0, 1).toUpperCase(),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, $username',
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                  const Text(
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
    );
  }
}

class HistoriqueTransaction extends StatelessWidget {
  const HistoriqueTransaction({
    super.key,
    required this.entries,
    required this.colors,
    required this.icons,
    required this.historiques,
    required this.moneyFormatter,
  });

  final List<String> entries;
  final List<MaterialColor> colors;
  final List<Icon> icons;
  final List<Historique> historiques;
  final MoneyFormatter moneyFormatter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(6),
        itemCount: historiques.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            // color: Color.fromARGB(255, 129, 102, 20),
            child: ListTile(
                onTap: () {
                  // Navigator.push(context,MaterialPageRoute(builder: (context) => QuizPage()),);
                },
                leading: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(60)),
                      color: colors[index]),
                  child: Center(child: icons[index]),
                ),
                title: Text(historiques[index].name),
                trailing: Text(
                  moneyFormatter
                      .copyWith(
                          amount: historiques[index].price,
                          fractionDigits: 0,
                          compactFormatType: CompactFormatType.short)
                      .output
                      .symbolOnRight,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12),
                )),
          );
        },
      ),
    );
  }
}
