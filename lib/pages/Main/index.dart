import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

int currentIndex=0;

  //定义数据，根据数据进行渲染4个导航
  //一般应用程序的导航是固定的
  final List<Map<String,String>> _tablist=[
    {'title':'首页','icon':'lib/assets/白猫.png','activeIcon':'lib/assets/黑猫.png'},
    {'title':'分类','icon':'lib/assets/白猫.png','activeIcon':'lib/assets/黑猫.png'},
    {'title':'购物车','icon':'lib/assets/白猫.png','activeIcon':'lib/assets/黑猫.png'},
    {'title':'我的','icon':'lib/assets/白猫.png','activeIcon':'lib/assets/黑猫.png'},
  ];

  List<BottomNavigationBarItem> getTableBarWidget(){
    return List.generate(_tablist.length, (index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tablist[index]['icon']!,width: 24,height: 24,),
        label: _tablist[index]['title'],
        activeIcon: Image.asset(_tablist[index]['activeIcon']!,width: 24,height: 24,),
      );
    });
  }


  List<Widget> getchildren(){
    return [
       HomeView(),
       CategoryView(),
       CartView(),
       MineView(),
    ];
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: getchildren(),
        ) 
        ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
        currentIndex: currentIndex,
        items: getTableBarWidget(),
      ),
    );
  }

}

  
