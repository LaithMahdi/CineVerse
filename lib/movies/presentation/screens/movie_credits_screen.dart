import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineverse/core/services/services_locator.dart';
import 'package:cineverse/core/utils/app_constance.dart';
import 'package:cineverse/core/utils/enums.dart';
import 'package:cineverse/movies/presentation/controller/movie_credit_person_bloc.dart';
import 'package:cineverse/movies/presentation/controller/movie_credit_person_event.dart';
import 'package:cineverse/movies/presentation/controller/movie_credit_person_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieCreditsScreen extends StatelessWidget {
  // final MovieCreditsModel credit;
  final int id;
  const MovieCreditsScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MovieCreditPersonBloc>()..add(GetMovieCreditPersonEvent(id)),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _personPicture(context),
              // Text(
              //   credit.name,
              //   style: GoogleFonts.poppins(
              //     fontSize: 23,
              //     fontWeight: FontWeight.w700,
              //     letterSpacing: 1.2,
              //   ),
              // ),
              showPersonCredits()
            ],
          ),
        ),
      ),
    );
  }
}

BlocBuilder<MovieCreditPersonBloc, MovieCreditPersonState> showPersonCredits() {
  return BlocBuilder<MovieCreditPersonBloc, MovieCreditPersonState>(
      buildWhen: (previous, current) =>
          previous.movieCreditPerson != current.movieCreditPerson,
      builder: (context, state) {
        print(state);
        switch (state.movieCreditPersonState) {
          case RequestState.loading:
            return CircularProgressIndicator();
          case RequestState.loaded:
            return Container(
              // height: MediaQuery.of(context).size.height * 0.5,
              // width: MediaQuery.of(context).size.width * 0.7,
              child: ListView.builder(
                  itemCount: state.movieCreditPerson.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = state.movieCreditPerson[index];
                    return Column(
                      children: [
                        Container(
                          child: FadeIn(
                            duration: const Duration(milliseconds: 500),
                            child: ShaderMask(
                              shaderCallback: (rect) {
                                return const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black,
                                    Colors.black,
                                    Colors.transparent,
                                  ],
                                  stops: [0.0, 0.5, 1.0, 1.0],
                                ).createShader(
                                  Rect.fromLTRB(
                                      0.0, 0.0, rect.width, rect.height),
                                );
                              },
                              blendMode: BlendMode.dstIn,
                              child: CachedNetworkImage(
                                width: MediaQuery.of(context).size.width * 0.5,
                                imageUrl: item.backdropPath != null
                                    ? AppConstance.imageUrl(item.backdropPath!)
                                    : "https://e7.pngegg.com/pngimages/829/733/png-clipart-logo-brand-product-trademark-font-not-found-logo-brand.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            );
          case RequestState.error:
            return Text("error");
        }
      });
}

//   FadeIn _personPicture(BuildContext context) {
//     return FadeIn(
//       duration: const Duration(milliseconds: 500),
//       child: ShaderMask(
//         shaderCallback: (rect) {
//           return const LinearGradient(
//             begin: Alignment.bottomCenter,
//             end: Alignment.topCenter,
//             colors: [
//               Colors.transparent,
//               Colors.black,
//               Colors.black,
//               Colors.transparent,
//             ],
//             stops: [0, 0.3, 1.0, 0],
//           ).createShader(
//             Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
//           );
//         },
//         blendMode: BlendMode.dstIn,
//         child: CachedNetworkImage(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height * 0.5,
//           imageUrl: AppConstance.imageUrl(credit.profilePath!),
//           fit: BoxFit.fill,
//         ),
//       ),
//     );
//   }
// }