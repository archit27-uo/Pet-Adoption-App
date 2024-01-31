import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Bloc/adoption_bloc.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            'Adopted',
            style: GoogleFonts.aboreto(
              fontSize: 50,
              fontWeight: FontWeight.w600,
              color: Colors.brown
            ),
          ),
          BlocBuilder<AdoptionBloc, AdoptionState>(builder: (context, state) {
            final petList = state.store.adoptHistoryList;
            if (petList == null) {
              return const SizedBox();
            }
            return Expanded(
              child: ListView.builder(
                  itemCount: petList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Card(
                        color: Colors.black,
                        elevation: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(


                              child: Hero(
                                tag: petList[index].name.toString(),
                                child: petList[index].image == null
                                    ? Image.network(
                                        'https://img.freepik.com/free-vector/cute-dog-cartoon-character_1308-146186.jpg?w=740&t=st=1706732862~exp=1706733462~hmac=13f0729ebf8ffcd179cc7346ee040df520e186d98b55fb1e96e3e93159eb9431')
                                    : Image.network(
                                        '${petList[index].image}',

                                        fit: BoxFit.contain,
                                        errorBuilder: (context, _, __) {
                                          return const SizedBox();
                                        },
                                      ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 30),
                                ),
                                Text(
                                  '#${index+1}',
                                  style: GoogleFonts.pacifico(
                                      fontSize: 35, color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${petList[index].name}',
                                  style: GoogleFonts.pacifico(
                                      fontSize: 35, color: Colors.white),
                                ),


                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }),
        ],
      ),
    );
  }
}
