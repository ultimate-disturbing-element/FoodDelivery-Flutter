import 'package:flutter/material.dart';
import 'package:food_delivery/const/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  @override
  Widget build(BuildContext context) {
    return Container(
      height:320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context,position){
        return _buildPageItem(position);
      }),
    );
  }
  Widget _buildPageItem(int index){
    return  Stack(
      children:[
       Container(
        height: 220,
        margin:EdgeInsets.only(left:10,right:10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: index.isEven?Color(0xFF69c5df) : Color(0xFF9294cc),
          image: DecorationImage(
            //image: AssetImage("assets/images/food_${index+1}.jpg"),
            image: NetworkImage("https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
            fit: BoxFit.cover,
          ),
          )
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
        height: 120,
        margin:EdgeInsets.only(left:30,right:30,bottom: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white
          ),
          child:Container(
            padding:EdgeInsets.only(left:15,right:15,top:15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: "Chinese Side",),
                SizedBox(height: 10,),
                Row(children: [
                  Wrap(
                    children:List.generate(5, (index) => Icon(Icons.star,color: AppColors.mainColor,size: 15,)),
                  ),
                  SizedBox(width: 10,),
                  SmallText(text: "4.5",),
                  SizedBox(width: 10,),
                  SmallText(text: "1287"),
                  SizedBox(width: 10,),
                  SmallText(text: "Comments")
                ],),
                SizedBox(height: 20,),
                
              ],
            ),
          )
      ),
      )
      ],
    );
  }
}