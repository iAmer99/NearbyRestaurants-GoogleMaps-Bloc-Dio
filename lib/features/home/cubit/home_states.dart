abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {}

class HomeErrorState extends HomeStates {
  final String errorMsg;

  HomeErrorState(this.errorMsg);
}

class HomeRestaurantTapedState extends HomeStates {}

class HomeCardHiddenState extends HomeStates {}