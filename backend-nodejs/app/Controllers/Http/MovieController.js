'use strict'

const Database = use("Database");
const Movie = use("App/Models/Movie");
const CustomException = use("App/Exceptions/CustomException");

class MovieController {

  async index({ params, auth }) {
    const user = await auth.getUser();
    const page = params.page || 1;
    const limit = params.limit || 10;

    const query = Movie.query()
      .orderBy("created_at", "desc")
      .where("is_deleted", false)
      .with("user", (builder) => builder.select())
      .with("rating", (builder) => builder.select().orderBy("created_at", "desc").with("user", (builder) => builder.select(['username', 'id'])))
      .with("comment", (builder) => builder.select().orderBy("created_at", "desc").with("user", (builder) => builder.select(['username', 'id'])))

    let data = await query.paginate(page, limit);
    data = data.toJSON();

    data['data'].forEach((e, _, __) => {
      e['owner'] = false;
      if (e.user_id == user.id) {
        e['owner'] = true;
      }
      e.rating.forEach((e2, _, __) => {
        if (e2.user.id == user.id) {
          e['userRating'] = e2.value;
        }
      });

    })


    return data;


  }


  async show({ params, auth }) {
    const query = Movie.query();
    const user = await auth.getUser();
    query
      .orderBy("created_at", "desc")
      .where("is_deleted", false)
      .where("id", params.id)
      .with("user", (builder) => builder.select())
      .with("rating", (builder) => builder.select().orderBy("created_at", "desc").with("user", (builder) => builder.select(['username', 'id'])))
      .with("comment", (builder) => builder.select().orderBy("created_at", "desc").with("user", (builder) => builder.select(['username', 'id'])))

    let data = await query.first();
    data = data.toJSON();

    data['owner'] = false;

    if (data.user_id == user.id) {
      data['owner'] = true;
    }
    data.rating.forEach((e, _, __) => {
      if (e.user.id == user.id) {
        data['userRating'] = e.value;
      }
    });

    return {
      data: data
    };
  }


  async store({ auth, request }) {
    const data = request.all();
    console.log(data.title);

    await this.alreadyExists(data);


    const user = await auth.getUser();
    const data_movie = this.getData(data);
    const movie = await Movie.create({
      ...data_movie,
      user_id: user.id
    });

    return {
      data: movie
    };



  }


  async update({ auth, request, params }) {
    const data = request.all()

    const user = await auth.getUser();
    const movie = await Movie.findByOrFail({
      id: params.id,
      user_id: user.id,
      is_deleted: false
    });

    await this.alreadyExists(data, movie.id);

    const data_movie = this.getData(data);

    await movie.merge(data_movie);
    await movie.save();
    return { data: movie };
  }


  async destroy({ params }) {

    const movie = await Movie.findByOrFail({ id: params.id, is_deleted: false });

    await movie.merge({ is_deleted: true });
    await movie.save();

    return {};
  }

  async alreadyExists(data, id = -1) {

    const movieExistsSql = `select 1
    from movies m
    where m.title = ? and m.imdbid = ? and m.year = ? and m.id != ? and m.is_deleted = false limit 1`;

    let result = await Database.raw(movieExistsSql, [data.title, data.imdbid, data.year, id]);
    result = result[0];

    if (result.length > 0) {
      let message = 'Já exste um filme com esse título, ano e imdb';
      throw new CustomException(message);
    }
  }

  getData(data) {
    data = {
      title: data.title,
      year: data.year,
      rated: data.rated,
      released: data.released,
      runtime: data.runtime,
      genre: data.genre,
      director: data.director,
      writer: data.writer,
      actors: data.actors,
      plot: data.plot,
      language: data.language,
      country: data.country,
      awards: data.awards,
      poster: data.poster,
      metascore: data.metascore,
      imdbrating: data.imdbrating,
      imdbvotes: data.imdbvotes,
      imdbid: data.imdbid,
      type: data.type,
      dvd: data.dvd,
      boxoffice: data.boxoffice,
      production: data.production,
      website: data.website
    };

    // Removendo atributos nulos
    const keys = Object.keys(data);
    for (const kIndex in keys) {
      const key = keys[kIndex];
      if (data[key] === null) delete data[key];
    }
    return data;

  }




}

module.exports = MovieController
