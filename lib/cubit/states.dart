abstract class NewsState {}

class NewsIntialState extends NewsState {}

class ChangeBottomNavBarState extends NewsState {}

class BusinessLoadingState extends NewsState {}

class BusinessSuccessState extends NewsState {}

class BusinessFailedState extends NewsState {
  final String e;

  BusinessFailedState(this.e);
}

class SportsLoadingState extends NewsState {}

class SportsSuccessState extends NewsState {}

class SportsFailedState extends NewsState {
  final String e;

  SportsFailedState(this.e);
}

class ScienceLoadingState extends NewsState {}

class ScienceSuccessState extends NewsState {}

class ScienceFailedState extends NewsState {
  final String e;

  ScienceFailedState(this.e);
}
