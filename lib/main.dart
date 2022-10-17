import 'dart:math';

import 'package:fire_base_second/helpers/database/animalDatabaseHelpper.dart';
import 'package:fire_base_second/helpers/database/database.dart';
import 'package:fire_base_second/screens/choose_plan_screen.dart';
import 'package:fire_base_second/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'dart:developer' as log_print;

import 'models/animal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash_screen',
      routes: {
        '/': (context) => HomePage(),
        'splash_screen': (context) => SplashScreen(),
      },
    );
  }
}

List<String> animalPic = [
  "assets/images/1.jpg",
  "assets/images/2.jpg",
  "assets/images/kangaroo.jpg",
  "assets/images/snake.png",
];

List<Animal> animalList = [];
List<Animal> searchedList = [];
bool connection = true;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Animal?> animal = [];
  Random random = Random();

  initAllThings() async {
    connection = await InternetConnectionChecker().hasConnection;
    log_print.log(connection.toString(), name: "Connection");

    if (connection == true) {
      await AnimalDBHelper.animalDBHelper.deleteAllData();
      int val = await AnimalDBHelper.animalDBHelper
          .insertData(animal: animal, image: animalPic);

      log_print.log(val.toString(), name: "Insert Success");
    }

    animalList = await AnimalDBHelper.animalDBHelper.fetchAllData();
    searchedList = animalList;

    await SubscriptionDBHelper.subscriptionDBHelper.deleteAllData1();
    await SubscriptionDBHelper.subscriptionDBHelper.deleteAllData2();
    await SubscriptionDBHelper.subscriptionDBHelper.deleteAllData3();
    await SubscriptionDBHelper.subscriptionDBHelper.deleteAllData4();

    await SubscriptionDBHelper.subscriptionDBHelper.insertData1();
    await SubscriptionDBHelper.subscriptionDBHelper.insertData2();
    await SubscriptionDBHelper.subscriptionDBHelper.insertData3();
    await SubscriptionDBHelper.subscriptionDBHelper.insertData4();

    List modal1 =
        await SubscriptionDBHelper.subscriptionDBHelper.fetchAllData1();
    log_print.log(modal1.toString(), name: "Modal1");
    List modal2 =
        await SubscriptionDBHelper.subscriptionDBHelper.fetchAllData2();
    List modal3 =
        await SubscriptionDBHelper.subscriptionDBHelper.fetchAllData3();
    List modal4 =
        await SubscriptionDBHelper.subscriptionDBHelper.fetchAllData4();

    names.add(modal1[0]["name"]);
    names.add(modal2[0]["name"]);
    names.add(modal3[0]["name"]);
    names.add(modal4[0]["name"]);

    local4Images.add(modal1[0]["image"]);
    local4Images.add(modal2[0]["image"]);
    local4Images.add(modal3[0]["image"]);
    local4Images.add(modal4[0]["image"]);

    price.add(modal1[0]["price"]);
    price.add(modal2[0]["price"]);
    price.add(modal3[0]["price"]);
    price.add(modal4[0]["price"]);

    log_print.log(animalList.toString(), name: "Animal List from Database");
    log_print.log("${animalList[0].image}", name: "image First");
    log_print.log("${animalList[1].image}", name: "image First");
    log_print.log("${animalList[3].image}", name: "image First");
  }

  mySetState() async {
    await Future.delayed(const Duration(seconds: 2), () {
      if (animalList.isEmpty || price.isEmpty) {
        mySetState();
      } else {
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAllThings();
    mySetState();
  }

  @override
  Widget build(BuildContext context) {
    int res = random.nextInt(3);

    return Scaffold(
      body: (animalList.isEmpty)
          ? Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: const Center(
                child: CircularProgressIndicator(color: Color(0XFFc19e82)),
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("${animalList[res].image}"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 430,
                          ),
                          Text(
                            "${animalList[res].name}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 35,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 100,
                            width: 250,
                            child: Text(
                              "${animalList[res].name} is ${animalList[res].DistinctiveFeature} the printing and typesetting industry. ${animalList[res].name} has been the industry's standard dummy text ever since the 1500s.",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 16,
                    child: Text(
                      "Last step to enjoy",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -30,
                    right: -30,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChoosePlanScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFDAD4CC).withOpacity(0.4),
                        ),
                        child: Align(
                          alignment: Alignment(-0.3, -0.3),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 35,
                          ),
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
