part of 'adoption_bloc.dart';

@immutable
sealed class AdoptionEvent {}

final class FetchAdoptionListEvent extends AdoptionEvent{}

final class AdoptionCardClickedEvent extends AdoptionEvent{
  final int index;

  AdoptionCardClickedEvent(this.index);
}

final class ThemeToggleEvent extends AdoptionEvent{
  final bool isDark;

  ThemeToggleEvent.toggle(this.isDark);

}

final class SearchClickedEvent extends AdoptionEvent{
  final List<PetModel> searchList;

  SearchClickedEvent(this.searchList);

}

final class OnTapZoomEvent extends AdoptionEvent{}

final class AdoptMeClickedEvent extends AdoptionEvent{
  final int index;

  AdoptMeClickedEvent(this.index);
}

