import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:news_app/category_model/model_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<String> images = [
    'https://media.istockphoto.com/photos/young-woman-snorkeling-with-coral-reef-fishes-picture-id939931682?s=612x612',
    'https://media.istockphoto.com/photos/woman-relaxing-in-sleeping-bag-on-red-mat-camping-travel-vacations-in-picture-id1210134412?s=612x612',
    'https://media.istockphoto.com/photos/green-leaf-with-dew-on-dark-nature-background-picture-id1050634172?s=612x612',
    'https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?s=612x612',
    // 'https://www.istockphoto.com/en/photo/woman-standing-and-looking-at-lago-di-carezza-in-dolomites-gm1038870630-278083784',
    'https://media.istockphoto.com/photos/picturesque-morning-in-plitvice-national-park-colorful-spring-scene-picture-id1093110112?s=612x612',
    'https://media.istockphoto.com/photos/connection-with-nature-picture-id1174472274?s=612x612',
    'https://media.istockphoto.com/photos/in-the-hands-of-trees-growing-seedlings-bokeh-green-background-female-picture-id1181366400',
    'https://media.istockphoto.com/photos/winding-road-picture-id1173544006?s=612x612'

  ];



  final categoryItem = Categories.category_list;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 6,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        Text("Search"),
                      ],
                    ),
                  ),
                  height: 40,
                  width: double.infinity,
                ),
              ),



              SizedBox(height: 5,),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey,
                ),
              ),


              //create carousel slider
              SizedBox(height: 10,),
              SizedBox(
                height: 150.0,
                width: double.infinity,
                child: Carousel(
                  dotSpacing: 15.0,
                  dotSize: 6.0,
                  dotIncreasedColor: Colors.black,
                  dotBgColor: Colors.transparent,
                  indicatorBgPadding: 10.0,
                  dotPosition: DotPosition.bottomCenter,
                  images: images
                      .map((item) => Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ))
                      .toList(),
                ),
              ),
              //create carousel slider




              SizedBox(height: 10,),
              Text("Categories",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),



              SizedBox(height: 10,),
              Container(
                height: 120,
                //width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryItem.length,
                    itemBuilder: (context,index){
                      var category = categoryItem[index];
                      return InkWell(
                        /*onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PreventionPage(
                            preventionsDetails: prevention,
                          )));
                        },*/
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue[100],
                                ),


                                child: Image.asset(category.categoryImg,height: 70,width: 70,fit: BoxFit.cover,),
                              ),
                            ),


                            Text(category.categoryName,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w600),),
                          ],
                        ),
                      );
                    }),
              ),



              SizedBox(height: 5,),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey,
                ),
              ),



              SizedBox(height: 10,),
              Text("All News",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),



              SizedBox(height: 10,),
              Container(
                height: 180,
                //width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                  //physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true, // This is important ⬇️
                    itemCount: categoryItem.length,
                    itemBuilder: (context,index){
                      var category = categoryItem[index];
                      return InkWell(
                        /*onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PreventionPage(
                            preventionsDetails: prevention,
                          )));
                        },*/
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue[100],
                              ),


                              child: Image.asset(category.categoryImg,height: 70,width: 70,fit: BoxFit.cover,),
                            ),


                            Text(category.categoryName,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w600),),
                            Text(category.categoryName,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w600),),
                          ],
                        ),
                      );
                    }),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
