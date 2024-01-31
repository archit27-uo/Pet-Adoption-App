import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/Bloc/adoption_bloc.dart';
import 'package:pet_adoption_app/Presentation/screens/home_screen.dart';
import 'package:pet_adoption_app/data/data_provider/adoption_data_provider.dart';
import 'package:pet_adoption_app/data/repository/adoption_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AdoptionRepository(
        AdoptionDataProvider(),
      ),
      child: BlocProvider(
        create: (context) => AdoptionBloc(
          context.read<AdoptionRepository>(),
        ),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
