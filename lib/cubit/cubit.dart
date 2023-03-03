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
    if (currentIndex==1){
      getSports();
    }
    if(currentIndex==2)
      {
        getScience();
      }
    emit(ChangeBottomNavBarState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(BusinessLoadingState());
    DioHelper.getData(
      url: '/api/1/news',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': 'pub_18153604b0173dca8904d875c9690e76e4c9e',
      },
    ).then((value){
      business=value.data['results'];
      print(business[1]['results']);
      emit(BusinessSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(BusinessFailedState(e));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(SportsLoadingState());
    DioHelper.getData(
      url: '/api/1/news',
      query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': 'pub_18153604b0173dca8904d875c9690e76e4c9e',
      },
    ).then((value){
      sports=value.data['results'];
      print(sports[1]['results']);
      emit(SportsSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(SportsFailedState(e));
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(ScienceLoadingState());
    DioHelper.getData(
      url: '/api/1/news',
      query: {
        'country': 'us',
        'category': 'science',
        'apiKey': 'pub_18153604b0173dca8904d875c9690e76e4c9e',
      },
    ).then((value){
      science=value.data['results'];
      print(science[1]['results']);
      emit(ScienceSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(ScienceFailedState(e));
    });
  }
}
