import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper.dart';
import 'package:news_app/view/screens/business.dart';
import 'package:news_app/view/screens/science.dart';
import 'package:news_app/view/screens/sports.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsIntialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports_soccer),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science_rounded),
      label: 'Science',
    ),
  ];
  List screens = const [
    Business(),
    Sports(),
    Science(),
  ];

  void changeBottomNav(int i) {
    currentIndex = i;
    emit(ChangeBottomNavBarState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(LoadingState());
    DioHelper.getData(
      url: '/v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '95b779f2a8014ca19f744e868885223d',
      },
    ).then((value){
      business=value.data['articles'];
      print(business[1]['title']);
      emit(GetBusinessSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(GetBusinessFailedState());
    });
  }
}
