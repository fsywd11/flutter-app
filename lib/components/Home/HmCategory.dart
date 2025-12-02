import 'package:flutter/material.dart';

class HmCategory extends StatefulWidget {
  const HmCategory({super.key});

  @override
  State<HmCategory> createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
       height: 60, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: 60,
          height: 50,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text('分类 $index',style: TextStyle(fontSize: 20),),
        );
      })
    );
  }
}