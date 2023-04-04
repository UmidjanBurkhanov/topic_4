import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List name_list = [
    "Личные данные",
    "Мои результаты",
    "Рецепт",
    "Кошелёк",
    "Настройки"
  ];
  List<IconData> icon_list = [
    Icons.add,
    Icons.abc,
    Icons.access_alarm_outlined,
    Icons.abc_rounded,
    Icons.abc_sharp
  ];
  int curentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 17,
                    ),
                    child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      height: 130,
                      child: Image(
                          image: AssetImage('assets/img.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  CircleAvatar(

                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.edit_outlined,
                      color: Colors.white,
                    ),
                    radius: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Зокиров Камолиддин"),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              itemCount: name_list.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      minVerticalPadding: 10,
                      tileColor: Colors.white,
                      leading: Icon(icon_list[index]),
                      title: Text("${name_list[index]}"),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    Divider(
                      height: 1,
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            curentindex = index;
          });
        },
        currentIndex: curentindex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
              color: Colors.black,
            ),
            label: 'Записаться',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Colors.black,
            ),
            label: 'Посещения',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
