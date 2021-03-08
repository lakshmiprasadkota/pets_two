import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_two/model/get_animals_model.dart';
import 'package:pets_two/network/base_network.dart';
import 'package:pets_two/screens/individual_animals_screen.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Getanimals> animalsList = List();
  dynamic res;
  String name;
  bool liked  = false;
  bool fetching = true;
     void getHttp() async {


    setState(() {
      fetching = true;
    });
    try {
      Response response =
      await dioClient.ref.get("/5251edda932f79c3728b",
      );
      setState(() {
        animalsList = getanimalsFromMap(jsonEncode(response.data));
        fetching = false;
        print(response);
      });
    } catch (e) {
      setState(() {
        fetching = false;
      });
      print(e);
    }
  }

  void initState() {
    getHttp();
    super.initState();
    liked =  liked;
  }


  @override
  Widget build(BuildContext context) {
    if (fetching) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (animalsList.length == 0) {
      return Center(
        child: Text("No Data"),
      );
    }
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
                    backgroundImage: AssetImage("assets/image/woman.png"))
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
                                  String dist ="${todo.distance}";
                                  print(animalsList);
                                  return  InkWell(onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Individual(
                                                  animalsRefVar: animalsList[index],
                                                )));
                                  },
                                    child: ListReturn(

                                      fetching: fetching,
                                      sex: sx,
                                      age: age,
                                      distance: dist,
                                      name: todo.name,
                                      breed: todo.breed,
                                      image: todo.image,
                                      description: todo.description,
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


class ListReturn extends StatefulWidget {
  ListReturn({ this.name, this.image, this.distance, this.age,this.fetching, this.breed, this.sex, this.description,});
  final String name;
  final String breed;
  final String sex;
  final String distance;
  final String image;
  final String age;
  final String description;
  final bool fetching;
  @override

  _ListReturnState createState() => _ListReturnState();
}

class _ListReturnState extends State<ListReturn> {
  bool liked = false;



  _pressed() {
    setState(() {
      liked = !liked;
    });
  }
  @override
  Widget build(BuildContext context) {

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
           Container(
              height: 105,
              width: 105,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: widget.image != null ?NetworkImage(widget.image) : AssetImage("assets\image\mars.png")
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(10))),
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
                  widget.name,
                  style: TextStyle(
                      color: Color(0xff454543),
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                SizedBox(height: 3,),
                Text(
                  "${widget.breed}",
                  maxLines: 1,
                  style: TextStyle(
                      color: Color(0xffc0c0c0),
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 3,),
                // Text("${widget.sex}"  "${widget.sex}"),
                Text(
                  "${widget.sex[4].toUpperCase()}${widget.sex.substring(5,).toLowerCase()}, "  "${widget.age[4].toUpperCase()}${widget.age.substring(5,).toLowerCase()}",


                  style: TextStyle(
                      color: Color(0xffd0d0d0),
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Icon(Icons.location_on_rounded, color: Color(0xffec7f66),size: 22,),
                    Text("${widget.distance} kms away" ,style: TextStyle(
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
              onPressed: () => _pressed(),
    icon: Icon(
    liked
    ? Icons.favorite
        : Icons.favorite_border,
    size: 25,
    color: liked
    ? Color(0xFFF17E69)
        : Colors.grey,
    ),)),
        ],
      ),
    );
  }
}
