// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'buildArtical.dart';
// import 'devider.dart';
// class ConditionalBuild extends StatelessWidget {
//   const ConditionalBuild({Key? key, required this.list}) : super(key: key);
// final List list ;
//   @override
//   Widget build(BuildContext context) {
//     return ConditionalBuilder(
//       condition:list.isNotEmpty,
//       builder: (context)=>ListView.separated(
//         physics: const BouncingScrollPhysics(),
//         itemBuilder: (BuildContext context, int index) {
//           return const BuildArticals();
//         },
//         separatorBuilder: (BuildContext context, int index) {
//           return myDivider();
//         },
//         itemCount: list.length,
//
//       ),
//       fallback: (context) => const Center(child: CircularProgressIndicator()),
//     );
//   }
// }
