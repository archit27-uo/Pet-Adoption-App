part of 'adoption_bloc.dart';

@immutable
sealed class AdoptionEvent {}

final class AdoptionFetched extends AdoptionEvent{}

final class PetClicked extends AdoptionEvent{
  List petList;
  final int index;
  PetClicked(@required this.index, this.petList);
}


