import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../data/repository/adoption_repository.dart';
import '../models/pet_model.dart';

part 'adoption_event.dart';
part 'adoption_state.dart';

class AdoptionBloc extends Bloc<AdoptionEvent, AdoptionState> {
  final AdoptionRepository adoptionRepository;

  AdoptionBloc(this.adoptionRepository)
      : super(const AdoptionInitial(store: AdoptionStateStore())) {
    on<FetchAdoptionListEvent>(_onFetchAdoptionListEvent);
    on<AdoptionCardClickedEvent>(_onAdoptionCardClickedEvent);
    on<AdoptMeClickedEvent>(_onAdoptMeClickedEvent);
    on<SearchClickedEvent>(_onSearchClickedEvent);
    on<OnTapZoomEvent>(_onOnTapZoomEvent);
    on<ThemeToggleEvent>(_onThemeToggleEvent);
  }
  void _onThemeToggleEvent(
      ThemeToggleEvent event, Emitter<AdoptionState> emit) {
    emit(
      ThemeToggleState(
        store: state.store.copyWith(
            themeData: event.isDark
                ? ThemeData.dark().copyWith()
                : ThemeData.light().copyWith()),
      ),
    );
  }

  void _onOnTapZoomEvent(OnTapZoomEvent event, Emitter<AdoptionState> emit) {
    emit(OnTapZoomState(store: state.store));
  }

  void _onSearchClickedEvent(
    SearchClickedEvent event,
    Emitter<AdoptionState> emit,
  ) {
    final pet = event.searchList;


    emit(SearchedClickedState(
        store: state.store.copyWith(adoptSearchedList: pet)));
  }

  void _onAdoptMeClickedEvent(
    AdoptMeClickedEvent event,
    Emitter<AdoptionState> emit,
  ) {
    final pet = state.store.adoptList?[event.index];
    if (pet == null) {
      return;
    }

    emit(
      AdoptMeClickedState(
        store: state.store.copyWith(
          adoptHistoryList: state.store.adoptHistoryList == null
              ? [state.store.adoptList![event.index]]
              : [
                  ...?state.store.adoptHistoryList,
                  state.store.adoptList![event.index]
                ],
        ),
      ),
    );
  }

  void _onAdoptionCardClickedEvent(
    AdoptionCardClickedEvent event,
    Emitter<AdoptionState> emit,
  ) {
    emit(
      AdoptionCardClickedState(
        store: state.store.copyWith(
          index: event.index,
        ),
      ),
    );
  }

  void _onFetchAdoptionListEvent(
    FetchAdoptionListEvent event,
    Emitter<AdoptionState> emit,
  ) async {
    emit(AdoptionLoading(store: state.store));
    try {
      final adoption = await adoptionRepository.getAdoptionList();

      emit(
        AdoptionFetched(
          store: state.store.copyWith(
            adoptList: adoption,
          ),
        ),
      );
    } catch (e) {
      emit(
        AdoptionError(
          error: e.toString(),
          store: state.store,
        ),
      );
    }
  }
}
