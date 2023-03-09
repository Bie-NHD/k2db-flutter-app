import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/dimension.dart';
class CardItemStore extends StatelessWidget {
  final Function()? onTap;
  final String imageStore;
  final String nameStore;
  final String addressStore;
  final double distanceStore;
  const CardItemStore({
    Key? key,
    required this.onTap,
    required this.imageStore,
    required this.nameStore,
    required this.addressStore,
    required this.distanceStore,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(
            k8Padding),
        margin: const EdgeInsets.only(
            bottom: k12Padding),
        decoration: BoxDecoration(
          color: ColorsApp.backgroundLight,
          borderRadius: BorderRadius.circular(kBorderRadiusMin),
          border: Border.all(color: ColorsApp.hintTextColor, width: 0.2),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadiusMin),
              child: Image.asset(
                imageStore,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                errorBuilder: (c,o,s){
                  return const Text("error");
                },
              ),
            ),
            const SizedBox(width: k8Padding,),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              Text(nameStore,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: k14Padding),),
              const SizedBox(height: k8Padding/2,),
              Text(addressStore,style: const TextStyle(fontSize: k12Padding,fontWeight: FontWeight.w600)),
              const SizedBox(height: k8Padding/2,),
              Text("Distance: $distanceStore km"),
            ],),),
          ],
        ),
      ),
    );
  }
}