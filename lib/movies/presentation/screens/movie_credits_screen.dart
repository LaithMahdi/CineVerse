import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineverse/core/services/services_locator.dart';
import 'package:cineverse/core/utils/app_constance.dart';
import 'package:cineverse/core/utils/enums.dart';
import 'package:cineverse/movies/data/models/movie_credits_model.dart';
import 'package:cineverse/movies/presentation/components/custom_movie_component.dart';
import 'package:cineverse/movies/presentation/controller/movie_credit_person_bloc.dart';
import 'package:cineverse/movies/presentation/controller/movie_credit_person_event.dart';
import 'package:cineverse/movies/presentation/controller/movie_credit_person_state.dart';
import 'package:cineverse/movies/presentation/screens/movie_details_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class MovieCreditsScreen extends StatelessWidget {
  final MovieCreditsModel credit;
  const MovieCreditsScreen({
    super.key,
    required this.credit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieCreditPersonBloc>()
        ..add(GetMovieCreditPersonEvent(credit.id)),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              FadeIn(
                duration: const Duration(milliseconds: 500),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(500)),
                  child: CachedNetworkImage(
                    imageUrl: AppConstance.imageUrl(credit.profilePath!),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[800]!,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.height * 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //
              Text(credit.name,
                  style: GoogleFonts.poppins(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  )),
              const SizedBox(height: 8.0),
              _showPersonCredits(),
            ]),
          ),
        ),
      ),
    );
  }
}

Widget _showPersonCredits() {
  return BlocBuilder<MovieCreditPersonBloc, MovieCreditPersonState>(
      buildWhen: (previous, current) =>
          previous.movieCreditPerson != current.movieCreditPerson,
      builder: (context, state) {
        switch (state.movieCreditPersonState) {
          case RequestState.loading:
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ],
              ),
            );
          case RequestState.loaded:
            return ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                physics: const NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                shrinkWrap: true,
                itemCount: state.movieCreditPerson.length,
                itemBuilder: (context, index) {
                  final movie = state.movieCreditPerson[index];
                  return CustomMovieComponent(
                    title: movie.title,
                    imageUrl: movie.backdropPath == null
                        ? AppConstance.imageNotFound
                        : AppConstance.imageUrl(movie.backdropPath!),
                    releaseDate: movie.releaseDate!,
                    overview: movie.overview,
                    voteAverage: movie.voteAverage,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MovieDetailsScreen(id: movie.id),
                        )),
                  );
                });
          case RequestState.error:
            return Text("error");
        }
      });
}
