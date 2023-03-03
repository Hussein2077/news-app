import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../widgets/buildArtical.dart';
import '../widgets/devider.dart';
class Sports extends StatelessWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
        builder: (context,state){
          List list =NewsCubit.get(context).sports;

          return  ConditionalBuilder(
            condition:list.length>0,
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
