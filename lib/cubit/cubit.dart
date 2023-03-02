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
    emit(BusinessLoadingState());
    DioHelper.getData(
      url: 'https://newsdata.io/api/1/news',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': 'pub_18153604b0173dca8904d875c9690e76e4c9e',
      },
    ).then((value){
      business=value.data['results'];
      print(business[1]['results']);
      emit(GetBusinessSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(GetBusinessFailedState());
    });
  }
}
