import 'dart:convert';

import 'package:pet_adoption_app/data/data_provider/adoption_data_provider.dart';

import '../../models/pet_model.dart';

import 'package:pet_adoption_app/data/data_provider/adoption_data_provider.dart';
class AdoptionRepository{
  late final AdoptionDataProvider adoptionDataProvider;
  AdoptionRepository(this.adoptionDataProvider);
  Future<List<PetModel>> getAdoptionList() async{

    try{
      final adoptionMap = await adoptionDataProvider.getAdoptionJson();
      if(adoptionMap==null){
        return [];
      }

      final adoptionMapList = adoptionMap['animals'] as List;
      List<PetModel> finalPetList = [];

      for(final adoptionMapItem in adoptionMapList){
       finalPetList.add(PetModel.fromJson(adoptionMapItem));

      }
      return finalPetList;
    }catch (e){
       throw(e.toString());
    }
  }
}