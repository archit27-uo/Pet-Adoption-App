
part of 'adoption_bloc.dart';

@immutable
sealed class AdoptionState {}

final class AdoptionInitial extends AdoptionState {}


final class AdoptionSuccess extends AdoptionState{
  final List<PetModel> petList;

  AdoptionSuccess(this.petList);

}

final class AdoptoionFailure extends AdoptionState{
  final String error;

  AdoptoionFailure(this.error);

}

final class PetSelected extends AdoptionState{
  final int index;
  List petList;
  PetSelected(this.index, this.petList);
}
final class AdoptionLoading extends AdoptionState{}


