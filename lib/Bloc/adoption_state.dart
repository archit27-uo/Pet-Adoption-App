part of 'adoption_bloc.dart';

@immutable
sealed class AdoptionState {
  final AdoptionStateStore store;
  const AdoptionState({
    required this.store,
  });
}

final class AdoptionInitial extends AdoptionState {
  const AdoptionInitial({
    required AdoptionStateStore store,
  }) : super(store: store);
}

final class AdoptionLoading extends AdoptionState {
  const AdoptionLoading({
    required AdoptionStateStore store,
  }) : super(store: store);
}

final class AdoptionFetched extends AdoptionState {
  const AdoptionFetched({
    required AdoptionStateStore store,
  }) : super(store: store);
}

final class AdoptionError extends AdoptionState {
  final String error;

  const AdoptionError({
    required this.error,
    required AdoptionStateStore store,
  }) : super(store: store);
}

final class AdoptionCardClickedState extends AdoptionState {
  const AdoptionCardClickedState({
    required AdoptionStateStore store,
  }) : super(store: store);
}

final class AdoptMeClickedState extends AdoptionState {
  const AdoptMeClickedState({
    required AdoptionStateStore store,
  }) : super(store: store);
}

final class AdoptionStateStore {
  final int? index;
  final List<PetModel>? adoptList;
  final List<PetModel>? adoptHistoryList;

  const AdoptionStateStore({
    this.index,
    this.adoptList,
    this.adoptHistoryList,
  });
  AdoptionStateStore copyWith({
    int? index,
    List<PetModel>? adoptList,
    List<PetModel>? adoptHistoryList,
  }) {
    return AdoptionStateStore(
      index: index ?? this.index,
      adoptList: adoptList ?? this.adoptList,
      adoptHistoryList: adoptHistoryList ?? this.adoptHistoryList,
    );
  }
}
