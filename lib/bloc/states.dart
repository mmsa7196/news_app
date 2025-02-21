abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class GetSourcesLoadingState extends HomeStates {}

class GetSourcesSuccessState extends HomeStates {}

class GetSourcesErrorState extends HomeStates {
  String error;

  GetSourcesErrorState({required this.error});
}

class GetNewsDataLoadingState extends HomeStates {}

class GetNewsDataSuccessState extends HomeStates {}

class GetNewsDataErrorState extends HomeStates {
  String error;

  GetNewsDataErrorState({required this.error});
}

class ChangeSelectedSourceState extends HomeStates {}
