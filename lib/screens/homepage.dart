import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_two/model/animals.dart';
import 'package:pets_two/screens/indiviualAnimals.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Getanimals> animalsList = List();
  dynamic res;
  String name;

  void getHttp() async {
    try {
      Response response =
          await Dio().get("https://api.npoint.io/a145beb7c3963677dd5d");
      setState(() {
        animalsList = getanimalsFromMap(jsonEncode(response.data));
        res = response;

        print(res);
      });
    } catch (e) {
      setState(() {
        print("error ---> $e");
      });
      print(e);
    }
  }

  void initState() {
    getHttp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      height: 3,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF9A9A9A),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 3,
                      width: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF9A9A9A),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 3,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF9A9A9A),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(
                          color: Color(0xffdadada),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Cameron St., Boston",
                      style: TextStyle(
                          color: Color(0xff626365),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                CircleAvatar(
                    backgroundColor: Color(0xff8ec5d9),
                    backgroundImage: AssetImage("assests/image/woman.png"))
              ],
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xfff5f5f5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: animalsList.length,
                              itemBuilder: (context, index) {
                                Getanimals todo = animalsList[index];
                                String sx = "${todo.sex}";
                                String age = "${todo.age}";
                                print(animalsList);
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 13, vertical: 13),
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Individual(
                                                        name: todo.name,
                                                        distance:
                                                            "${todo.distance}",
                                                        about: todo.description,
                                                        age: age.substring(
                                                          4,
                                                        ),
                                                        breed: todo.breed,
                                                        img: todo.image,
                                                        sex: "${sx[4].toUpperCase()}",
                                                      )));
                                        },
                                        child: Container(
                                          height: 105,
                                          width: 105,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: todo.image != null ? NetworkImage(
                                                    animalsList[index].image): Image.asset("assests\image\mars.png"),
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              todo.name,
                                              style: TextStyle(
                                                  color: Color(0xff454543),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16),
                                            ),
                                            SizedBox(height: 3,),
                                            Text(
                                                "${todo.breed}",
                                                maxLines: 1,
                                                style: TextStyle(
                                                    color: Color(0xffc0c0c0),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            SizedBox(height: 3,),
                                            Text(
                                              "${sx[4].toUpperCase()}${sx.substring(5,).toLowerCase()}, "  "${age[4].toUpperCase()}${age.substring(5,).toLowerCase()}",


                                              style: TextStyle(
                                                  color: Color(0xffd0d0d0),
                                                  fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                            ),
                                           SizedBox(height: 15,),
                                           Row(
                                             children: [
                                               Icon(Icons.location_on_rounded, color: Color(0xffec7f66),size: 22,),
                                               Text("${todo.distance} kms away" ,style: TextStyle(
                                                 color: Color(0xffd0d0d0),
                                                 fontSize: 12,
                                                 fontWeight: FontWeight.w500
                                               ),),
                                             ],
                                           )

                                          ],
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.topRight,
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  name = todo.name;
                                                });
                                              },
                                              icon: Icon(name != todo.name
                                                  ? Icons.favorite_border
                                                  : Icons.favorite , size: 26,color: name != todo.name? Color(0xffd8d8d8): Colors.red))),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 15,
                                );
                              }),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
