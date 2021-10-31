import 'package:flutter/material.dart';

import '../../../constants.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List<String> categories =["Girl Bags","Shoes","Shirt","Trousers"];
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: SizedBox(
          height: 25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (ctx,index){
              return GestureDetector(
                onTap: (){
                  setState(() {
                    selectedItem = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        categories[index],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selectedItem==index ? kTextColor : kTextLightColor,
                            fontSize: 15
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 20,
                        color: selectedItem==index ? Colors.black: Colors.transparent,
                        margin: const EdgeInsets.only(top: kDefaultPadding/4),
                      )
                    ],
                  ),
                ),
              );
            },
          )
      ),
    );
  }
}