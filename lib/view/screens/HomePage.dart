import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>NewsCubit()..getBusiness()..getSports()..getScience(),
      child: BlocConsumer<NewsCubit,NewsState>(
        listener: (context,state){
        },
        builder: (context,state){
          NewsCubit cubit=NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('News App'),
              actions:  [
                Row(
                  children:  [
                    const Icon(Icons.search_sharp,size: 30,),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: IconButton(onPressed: (){
                        // NewsCubit.get(context).changeAppMode();
                        }                    , icon: const Icon(Icons.brightness_4_outlined)),
                    )
                  ],
                ),
              ],
            ),
            bottomNavigationBar:BottomNavigationBar(items: cubit.bottomItems,

             currentIndex: cubit.currentIndex,
              onTap: (index){
              cubit.changeBottomNav(index);
              },

            ),
            body:cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
