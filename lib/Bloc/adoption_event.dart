part of 'adoption_bloc.dart';

@immutable
sealed class AdoptionEvent {}

final class FetchAdoptionListEvent extends AdoptionEvent{}

final class AdoptionCardClickedEvent extends AdoptionEvent{
  final int index;

  AdoptionCardClickedEvent(this.index);
}

final class AdoptMeClickedEvent extends AdoptionEvent{
  final int index;

  AdoptMeClickedEvent(this.index);
}

