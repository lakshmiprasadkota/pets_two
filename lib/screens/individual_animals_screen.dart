import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_two/model/animals_model.dart';

class Individual extends StatefulWidget {
  Individual({ this.animalsRefVar});

 final Getanimals animalsRefVar ;
  @override
  _IndividualState createState() => _IndividualState();
}

class _IndividualState extends State<Individual> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back_ios, color: Color(0xff808080),)),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xfffbece9),

                            ),
                            child: Icon(Icons.favorite,color: Color(0xfff17e69),),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [

                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                              child: Column(

                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          widget.animalsRefVar.name,
                                          style: TextStyle(
                                              color: Color(0xff3d3c3a),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25),
                                        ),
                                      ),

                                      widget.animalsRefVar.sex.toString().substring(4).toUpperCase() == "MALE" ?  Image.asset("assets/image/mars.png" , color:Color(0xffd5d5d5) ,height: 25, width: 25,) :
                                      Image.asset("assets/image/venus.png" , color:Color(0xffd5d5d5) ,height: 30, width: 30,),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          widget.animalsRefVar.breed,
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: Color(0xff6b6b6b),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),

                                      Text("${widget.animalsRefVar.age.toString().substring(4,5).toUpperCase()}"
                                          "${widget.animalsRefVar.age.toString().substring(5).toLowerCase()}" ,style: TextStyle(
                                          color: Color(0xff6b6b6b),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(children: [
                                    Icon(Icons.location_on_rounded, color: Color(0xffec7f66),size: 22,),
                                    Text("${widget.animalsRefVar.distance} kms away" ,style: TextStyle(
                                        color: Color(0xffd1d1d1),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500
                                    ),),
                                  ],)
                                ],
                              ),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              height: 400,

                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        widget.animalsRefVar.image),
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10))),
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                alignment: Alignment.topLeft,
                                child: Text("About",style: TextStyle(color: Color(0xff393937),fontSize: 18,fontWeight: FontWeight.w700),)),
                            Container(
                              padding: EdgeInsets.only(bottom: 70),
                              margin: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(widget.animalsRefVar.description , style: TextStyle(
                                  color: Color(0xff727272),
                                  fontWeight:FontWeight.w400
                              ),
                                textAlign: TextAlign.justify,),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
                      color: Color(0xFFF17E69),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.pets,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "ADOPT",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )

               
              
              ],
            ),
      ),


    );
  }
}
