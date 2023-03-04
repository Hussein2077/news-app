import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

import '../widgets/build_artical.dart';
import '../widgets/devider.dart';

class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
        builder: (context,state){
          List list =NewsCubit.get(context).business;

          return  ConditionalBuilder(
        condition:list.isNotEmpty,
        builder: (context)=>ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return  BuildArticals(artical: list[index],);
          },
          separatorBuilder: (BuildContext context, int index) {
            return myDivider();
          },
          itemCount: list.length,

        ),
        fallback: (context) => const Center(child: CircularProgressIndicator()),
      );
    }, listener: (context,state){});
  }
}
