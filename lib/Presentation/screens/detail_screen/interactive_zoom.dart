import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';

import '../../../Bloc/adoption_bloc.dart';

class InteractiveZoom extends StatefulWidget {
  const InteractiveZoom({Key? key}) : super(key: key);

  @override
  State<InteractiveZoom> createState() => _InteractiveZoomState();
}

class _InteractiveZoomState extends State<InteractiveZoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocBuilder<AdoptionBloc, AdoptionState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: PhotoView(

                 imageProvider: state.store.adoptList![state.store.index!].image == null
                     ? const NetworkImage(
                     'https://img.freepik.com/free-vector/cute-dog-cartoon-character_1308-146186.jpg?w=740&t=st=1706732862~exp=1706733462~hmac=13f0729ebf8ffcd179cc7346ee040df520e186d98b55fb1e96e3e93159eb9431')
                     : NetworkImage(state.store.adoptList![state.store.index!].image.toString()),
                // Path to your pet image
                minScale: PhotoViewComputedScale.contained * 0.8,
                maxScale: PhotoViewComputedScale.covered * 2.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
