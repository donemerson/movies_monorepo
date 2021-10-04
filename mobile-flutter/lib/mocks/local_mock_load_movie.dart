import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/testing.dart';

class LocalMockLoadMovie {
  static final Client httpClient = MockClient((request) async {
    await Future.delayed(Duration(milliseconds: 1000));
    late final Response response;
    switch (request.method) {
      case 'delete':
        response = Response(
          '{}',
          200,
          request: request,
        );
        break;

      case 'patch':
        response = Response(
          jsonEncode(showResponse),
          200,
          request: request,
        );
        break;

      case 'post':
        response = Response(
          jsonEncode(showResponse),
          200,
          request: request,
        );
        break;

      case 'get':
        // show ex: /movie/:id
        if (request.url.path.matchAsPrefix('/movie/') != null) {
          response = Response(
            jsonEncode(showResponse),
            200,
            request: request,
          );
        } else {
          response = Response(
            jsonEncode(indexResponse),
            200,
            request: request,
          );
        }
        break;
      default:
    }
    return response;
  });

  static const showResponse = <String, dynamic>{
    "data": {
      "id": 2,
      "user_id": 1,
      "title": "Captain Marvel",
      "year": "2019",
      "rated": "PG-13",
      "released": "08 Mar 2019",
      "runtime": "123 min",
      "genre": "Action, Adventure, Sci-Fi",
      "director": "Anna Boden, Ryan Fleck",
      "writer": "Anna Boden, Ryan Fleck, Geneva Robertson-Dworet",
      "actors": "Brie Larson, Samuel L. Jackson, Ben Mendelsohn",
      "plot":
          "Carol Danvers becomes one of the universe's most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.",
      "language": "English",
      "country": "United States, Australia",
      "awards": "9 wins & 52 nominations",
      "poster":
          "https://m.media-amazon.com/images/M/MV5BMTE0YWFmOTMtYTU2ZS00ZTIxLWE3OTEtYTNiYzBkZjViZThiXkEyXkFqcGdeQXVyODMzMzQ4OTI@._V1_SX300.jpg",
      "metascore": "64",
      "imdbrating": "6.8",
      "imdbvotes": "491,174",
      "imdbid": "tt4154664",
      "type": "movie",
      "dvd": "28 May 2019",
      "boxoffice": "\$426,829,839",
      "production": "Marvel Studios",
      "website": "N/A",
      "is_deleted": 0,
      "created_at": "2021-10-02 06:32:26",
      "updated_at": "2021-10-02 06:32:26",
      "user": {
        "id": 1,
        "username": "emerson",
        "created_at": "2021-10-02 06:31:47",
        "updated_at": "2021-10-02 06:31:47"
      },
      "rating": [
        {
          "movie_id": 2,
          "user_id": 1,
          "value": 1,
          "user": {"username": "emerson", "id": 1}
        }
      ],
      "comment": [
        {
          "movie_id": 2,
          "user_id": 1,
          "value": "blablabla2",
          "user": {"username": "emerson", "id": 1}
        },
        {
          "movie_id": 2,
          "user_id": 1,
          "value": "blablabla2",
          "user": {"username": "emerson", "id": 1}
        }
      ]
    }
  };

  static const indexResponse = <String, dynamic>{
    "total": 1,
    "perPage": 10,
    "page": 1,
    "lastPage": 1,
    "data": [
      {
        "id": 2,
        "user_id": 1,
        "title": "Captain Marvel",
        "year": "2019",
        "rated": "PG-13",
        "released": "08 Mar 2019",
        "runtime": "123 min",
        "genre": "Action, Adventure, Sci-Fi",
        "director": "Anna Boden, Ryan Fleck",
        "writer": "Anna Boden, Ryan Fleck, Geneva Robertson-Dworet",
        "actors": "Brie Larson, Samuel L. Jackson, Ben Mendelsohn",
        "plot":
            "Carol Danvers becomes one of the universe's most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.",
        "language": "English",
        "country": "United States, Australia",
        "awards": "9 wins & 52 nominations",
        "poster":
            "https://m.media-amazon.com/images/M/MV5BMTE0YWFmOTMtYTU2ZS00ZTIxLWE3OTEtYTNiYzBkZjViZThiXkEyXkFqcGdeQXVyODMzMzQ4OTI@._V1_SX300.jpg",
        "metascore": "64",
        "imdbrating": "6.8",
        "imdbvotes": "491,174",
        "imdbid": "tt4154664",
        "type": "movie",
        "dvd": "28 May 2019",
        "boxoffice": "\$426,829,839",
        "production": "Marvel Studios",
        "website": "N/A",
        "is_deleted": 0,
        "created_at": "2021-10-02 06:32:26",
        "updated_at": "2021-10-02 06:32:26",
        "user": {
          "id": 1,
          "username": "emerson",
          "created_at": "2021-10-02 06:31:47",
          "updated_at": "2021-10-02 06:31:47"
        },
        "rating": [
          {
            "movie_id": 2,
            "user_id": 1,
            "value": 1,
            "user": {"username": "emerson", "id": 1}
          }
        ],
        "comment": [
          {
            "movie_id": 2,
            "user_id": 1,
            "value": "blablabla2",
            "user": {"username": "emerson", "id": 1}
          },
          {
            "movie_id": 2,
            "user_id": 1,
            "value": "blablabla2",
            "user": {"username": "emerson", "id": 1}
          }
        ]
      }
    ]
  };

  static const storeUpdateResponse = <String, dynamic>{
    "data": {
      "title": "Captain Marvel 2",
      "year": "2019",
      "rated": "PG-13",
      "released": "08 Mar 2019",
      "runtime": "123 min",
      "genre": "Action, Adventure, Sci-Fi",
      "director": "Anna Boden, Ryan Fleck",
      "writer": "Anna Boden, Ryan Fleck, Geneva Robertson-Dworet",
      "actors": "Brie Larson, Samuel L. Jackson, Ben Mendelsohn",
      "plot":
          "Carol Danvers becomes one of the universe's most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.",
      "language": "English",
      "country": "United States, Australia",
      "awards": "9 wins & 52 nominations",
      "poster":
          "https://m.media-amazon.com/images/M/MV5BMTE0YWFmOTMtYTU2ZS00ZTIxLWE3OTEtYTNiYzBkZjViZThiXkEyXkFqcGdeQXVyODMzMzQ4OTI@._V1_SX300.jpg",
      "metascore": "64",
      "imdbrating": "6.8",
      "imdbvotes": "491,174",
      "imdbid": "tt4154664",
      "type": "movie",
      "dvd": "28 May 2019",
      "boxoffice": "\$426,829,839",
      "production": "Marvel Studios",
      "website": "N/A",
      "user_id": 1,
      "created_at": "2021-10-03 17:28:12",
      "updated_at": "2021-10-03 17:28:12",
      "id": 3
    }
  };
  static const storeUpdatePayload = <String, dynamic>{
    "title": "Captain Marvel 2",
    "year": "2019",
    "rated": "PG-13",
    "released": "08 Mar 2019",
    "runtime": "123 min",
    "genre": "Action, Adventure, Sci-Fi",
    "director": "Anna Boden, Ryan Fleck",
    "writer": "Anna Boden, Ryan Fleck, Geneva Robertson-Dworet",
    "actors": "Brie Larson, Samuel L. Jackson, Ben Mendelsohn",
    "plot":
        "Carol Danvers becomes one of the universe's most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.",
    "language": "English",
    "country": "United States, Australia",
    "awards": "9 wins & 52 nominations",
    "poster":
        "https://m.media-amazon.com/images/M/MV5BMTE0YWFmOTMtYTU2ZS00ZTIxLWE3OTEtYTNiYzBkZjViZThiXkEyXkFqcGdeQXVyODMzMzQ4OTI@._V1_SX300.jpg",
    "metascore": "64",
    "imdbrating": "6.8",
    "imdbvotes": "491,174",
    "imdbid": "tt4154664",
    "type": "movie",
    "dvd": "28 May 2019",
    "boxoffice": "\$426,829,839",
    "production": "Marvel Studios",
    "website": "N/A"
  };
}
