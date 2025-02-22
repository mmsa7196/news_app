import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c13/bloc/states.dart';
import 'package:http/http.dart' as http;
import 'package:news_c13/models/news_data_response.dart';
import 'package:news_c13/models/source_response.dart';
import 'package:news_c13/repository/home_repo.dart';

class HomeCubit extends Cubit<HomeStates> {
  SourceResponse? sourceResponse;
  NewsDataResponse? newsDataResponse;
  int selectedIndex = 0;
  HomeRepo homeRepo;

  HomeCubit({required this.homeRepo}) : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);

  changeSelectedSource(int index) {
    selectedIndex = index;
    getNewsData();
    emit(ChangeSelectedSourceState());
  }

  void getSources(String catID) async {
    try {
      emit(GetSourcesLoadingState());

      sourceResponse = await homeRepo.getSources(catID);
      if (sourceResponse!.status == "ok".tr()) {
        await getNewsData();
        emit(GetSourcesSuccessState());
      } else {
        emit(GetSourcesErrorState(error: sourceResponse?.message ?? ""));
      }
    } catch (e) {
      print(e);
      emit(GetSourcesErrorState(error: "$e"));
    }
  }

  Future<void> getNewsData() async {
    try {
      emit(GetNewsDataLoadingState());

      newsDataResponse = await homeRepo
          .getNewsData(sourceResponse?.sources?[selectedIndex].id ?? "");
      if (newsDataResponse!.status == "ok".tr()) {
        emit(GetNewsDataSuccessState());
      } else {
        emit(GetNewsDataErrorState(error: newsDataResponse?.message ?? ""));
      }
    } catch (e) {
      emit(GetNewsDataErrorState(error: "Something went wrong".tr()));
    }
  }
}
