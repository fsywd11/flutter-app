import 'package:flutter/material.dart';
import 'package:hm_shop/constants/index.dart';

class HmCategory extends StatefulWidget {

  final List<CategoryItem> categoryList;
  const HmCategory({super.key, required this.categoryList});

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
        itemCount: widget.categoryList.length,
        itemBuilder: (BuildContext context, int index){
          final category = widget.categoryList[index];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: 60,
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 231, 232, 234),
            borderRadius: BorderRadius.circular(40),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(category.picture,width: 30,height: 30,),
              Text(category.name,style: TextStyle(fontSize: 12,color: Colors.black),),
            ],
          ),
        );
      })
    );
  }
}