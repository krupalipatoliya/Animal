import 'dart:developer';
import 'package:fire_base_second/helpers/database/animalDatabaseHelpper.dart';
import 'package:fire_base_second/models/animal.dart';
import 'package:fire_base_second/screens/detailsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> animalName = [
    "Dog",
    "Cat",
    "Kangaroo",
    "Snake",
  ];
  List<Animal?> animal = [];

  mySetState() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFc19e82),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 0,
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage("assets/images/ra.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 25, bottom: 20),
                          child: Text(
                            "Welcome To\nAnimal World",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Positioned(
              top: 260,
              left: 0,
              right: 0,
              child: Container(
                height: 450,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0XFFc19e82),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 330,
                      width: double.infinity,
                      child: (animalList.isEmpty)
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: searchedList.length,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailsPage(
                                            animal: searchedList[i]),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 300,
                                    width: 180,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 230,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0XFF7b5638)
                                                .withOpacity(0.7),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "${searchedList[i].image}"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${searchedList[i].name}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          "${searchedList[i].DistinctiveFeature}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                searchedList = await AnimalDBHelper
                                    .animalDBHelper
                                    .searchData(val: "Elephant");
                                setState(() {});
                                //log(searchedList.toString(), name: "searched list");
                              },
                              child: Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                  color: const Color(0XFFecd1b3),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/elephant.png",
                                    height: 38,
                                    width: 38,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Elephant",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                searchedList = await AnimalDBHelper
                                    .animalDBHelper
                                    .searchData(val: "Panda");
                                setState(() {});
                              },
                              child: Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                  color: const Color(0XFFecd1b3),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/lion.png",
                                    height: 38,
                                    width: 38,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Panda",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                searchedList = await AnimalDBHelper
                                    .animalDBHelper
                                    .searchData(val: "Snake");
                                setState(() {});
                              },
                              child: Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                  color: const Color(0XFFecd1b3),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/snake.png",
                                    height: 38,
                                    width: 38,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Snake",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                searchedList = await AnimalDBHelper
                                    .animalDBHelper
                                    .searchData(val: "Dog");
                                setState(() {});
                              },
                              child: Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                  color: const Color(0XFFecd1b3),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/dog.png",
                                    height: 38,
                                    width: 38,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Dog",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 8,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    searchedList = animalList;
                  });
                  log(searchedList.toString(), name: "searchedList");
                },
                icon: const Icon(
                  Icons.repeat_rounded,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
