import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with TickerProviderStateMixin {
  late TabController controllerp;
  List name_list = ["Тендер","Персональный заказ","Выполняется","История заказов"];
  List<IconData> icon_list = [Icons.cabin,Icons.co2,Icons.co2_sharp,Icons.safety_check];
  List<VoidCallback> ontap_list = [(){print("1");}, (){print("2");},(){print("3");}, (){print("4");}];

  @override
  void initState() {
    super.initState();
    controllerp = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Мои заявки",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xffF4F4F4),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: TabBar(
              labelColor: Colors.black,
              padding: EdgeInsets.all(4),
              controller: controllerp,
              indicator: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              tabs: [
                Tab(
                  text: "Я заказчик",
                ),
                Tab(
                  text: "Я исполнитель",
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(

        controller: controllerp,
        children: [
          ListView.builder(

            padding: EdgeInsets.all(16),
            itemCount: name_list.length,
            itemBuilder: (BuildContext context , int index){
              return Column(
                children: [
                  ListTile(
                    minVerticalPadding: 30,
                   tileColor: Colors.white,
                    leading: Icon(icon_list[index]),
                    title: Text("${name_list[index]}"),
                    trailing: Icon(Icons.chevron_right),
                    onTap: ontap_list[index],
                  ),
                  Divider(height: 1,)
                ],
              ) ;
            },
            

          ),
          Center(
            child: Text("Я исполнитель"),
          ),
        ],
      ),
    );
  }
}
