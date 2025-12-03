import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSuggestion extends StatefulWidget {
  final SpecialRecommendResult specialRecommendResult;
  const HmSuggestion({super.key, required this.specialRecommendResult});

  @override
  State<HmSuggestion> createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {

  List<GoodsItem> getDisplayItems(){
    if(widget.specialRecommendResult.subTypes.isEmpty){
      return [];
    }
    return widget.specialRecommendResult.subTypes.first.goodsItems.items.take(3).toList();
  }

Widget buildHeader(){
  return Row(
    children: [
      Text(
        "特惠推荐",
        style: TextStyle(
          color: Color.fromARGB(255, 86, 24, 20),
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(width: 10,),
      Text(
        "精选省攻略",
        style: TextStyle(
          color: Color.fromARGB(255, 86, 24, 20),
          fontSize: 12, 
        ),
      ),
    ],
  );
}


//左侧结构
Widget buildLeft(){
  return Container(
    width: 100,
    height: 140,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        image: AssetImage("lib/assets/bg2.png"),
        fit: BoxFit.cover,
      ),
    )
  );
}

List<Widget> buildRight(){
 List<GoodsItem> list = getDisplayItems();
 return List.generate(list.length, (int index){
   return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            list[index].picture,
            errorBuilder: (context, url, error) => Image.asset("lib/assets/bg2.png"),
            width: 100,
            height: 140,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 240, 96, 12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text("￥${list[index].price}",style: TextStyle(color: Colors.white)),
        )
      ],
   );
 });
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.all(12),
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage("lib/assets/bg3.png"),
            fit: BoxFit.cover,
        ),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            buildHeader(),
            SizedBox(height: 10,),
           Row(
            children: [
              buildLeft(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: buildRight(),
                )
              )
            ]
           )
            
          ],
        ),
      ),
    );
  }
}