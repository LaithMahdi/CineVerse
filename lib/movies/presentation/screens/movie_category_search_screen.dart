import 'package:cineverse/core/services/services_locator.dart';
import 'package:cineverse/core/utils/enums.dart';
import 'package:cineverse/movies/presentation/controller/movie_genre_category_bloc.dart';
import 'package:cineverse/movies/presentation/controller/movie_genre_category_event.dart';
import 'package:cineverse/movies/presentation/controller/movie_genre_category_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieCategorySearchScreen extends StatelessWidget {
  const MovieCategorySearchScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MovieGenreCategoryBloc>()..add(GetMovieGenreCategoryEvent()),
      lazy: false,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Search movie by genre",
                style: TextStyle(fontSize: 21, color: Colors.white),
              ),
              const MovieGenreCategoryComponent(),
              const SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieGenreCategoryComponent extends StatelessWidget {
  const MovieGenreCategoryComponent({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieGenreCategoryBloc, MovieGenreCategoryState>(
      builder: (context, state) {
        switch (state.moviGenressState) {
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
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.movieGenres.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  final category = state.movieGenres[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      border: Border.all(
                        color: Colors.white,
                        width: 0.2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        category.name,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          case RequestState.error:
            return const Text("error");
        }
        // Default return statement
      },
    );
  }
}
