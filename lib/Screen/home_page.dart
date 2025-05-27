import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/Model/model.dart';
import 'package:myapp/Screen/category_selection.dart';
import 'package:myapp/Utils/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.network(
                "https://raw.githubusercontent.com/Paola-ramirez128/UIII_Act2_Fluuter1284/refs/heads/main/canastas2.jpg",
                height: size.height * 0.21,
                width: size.width,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: size.height * 0.10,
                left: 40,
                right: 40,
                child: Row(
                  children: [
                    iconContainer(Icons.add),
                    Spacer(),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://raw.githubusercontent.com/Paola-ramirez128/UIII_Act2_Fluuter1284/refs/heads/main/perfil.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 6),
                      ),
                    ),
                    Spacer(),
                    iconContainer(Icons.call),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.09),
          Column(
            children: [
              Text("Artesanias Mexa", style: TextStyle(fontSize: 20)),
              Text(
                "Vendedor de artesanias",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black26,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      child: Icon(
                        Icons.star,
                        color: i < 4 ? Colors.amber : Colors.black38,
                      ),
                    ),
                ],
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    designerSkill("jarrones"),
                    designerSkill("canastas"),
                    designerSkill("alebrijes"),
                    designerSkill("decoracion"),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  designerSkill("hogar"),
                  designerSkill("figuras"),
                  designerSkill("mas"),
                ],
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 75,
                    child: Container(
                      height: 1,
                      width: size.width,
                      color: Colors.black12,
                    ),
                  ),
                  Divider(color: Colors.black12, height: 50),
                  Positioned(top: 35, child: CategorySelection()),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.64,
                  crossAxisSpacing: 15,
                ),
                itemCount: userInfo.length,
                itemBuilder: (context, index) {
                  final product = userInfo[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        product.image,
                        height: 190,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 2),
                      Text("Venta"),
                      Row(
                        children: [
                          Image.network(
                            "https://raw.githubusercontent.com/Paola-ramirez128/UIII_Act2_Fluuter1284/refs/heads/main/chat.png",
                            height: 3,
                            color: Colors.black54,
                          ),
                          SizedBox(height: 2),
                          Text(
                            product.chat,
                            style: TextStyle(color: Colors.black45),
                          ),
                          SizedBox(height: 2),
                          Icon(Icons.favorite_border, color: Colors.black26),
                          SizedBox(height: 2),
                          Text(
                            product.love,
                            style: TextStyle(color: Colors.black45),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding designerSkill(text) {
    return Padding(
      padding: EdgeInsets.only(top: 15, right: 5, left: 5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Container iconContainer(icon) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [primaryColor, secondaryColor]),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Icon(icon, color: Colors.white, size: 30),
    );
  }
}
