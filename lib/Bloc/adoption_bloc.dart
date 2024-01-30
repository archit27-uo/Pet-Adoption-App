import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

import '../data/repository/adoption_repository.dart';
import '../models/pet_model.dart';


part 'adoption_event.dart';
part 'adoption_state.dart';

class AdoptionBloc extends Bloc<AdoptionEvent, AdoptionState> {
  final AdoptionRepository adoptionRepository;

  AdoptionBloc(this.adoptionRepository) : super(AdoptionInitial()) {
    on<AdoptionFetched>((_getAdoptionData));
    on<PetClicked>((_showPetDetail));
  }
  void _showPetDetail(PetClicked event, Emitter<AdoptionState> emit) {
      emit(PetSelected(event.index, event.petList));
  }
  void _getAdoptionData(AdoptionFetched event, Emitter<AdoptionState> emit) async{
    emit(AdoptionLoading());
    try{
      final adoption = await adoptionRepository.getAdoptionList();
      emit(AdoptionSuccess(adoption));
    }catch(e){
      emit(AdoptoionFailure(e.toString()));
    }

  }
}
