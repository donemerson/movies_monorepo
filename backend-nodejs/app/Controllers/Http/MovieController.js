'use strict'

const Database = use("Database");
const Movie = use("App/Models/Movie");
const CustomException = use("App/Exceptions/CustomException");

class MovieController {

  async index({ params }) {

    const page = params.page || 1;
    const limit = params.limit || 10;

    const query = Movie.query()
      .orderBy("created_at", "desc")
      .where("is_deleted", false)
      .with("user", (builder) => builder.select())
      .with("rating", (builder) => builder.select().orderBy("created_at", "desc").with("user", (builder) => builder.select(['username', 'id'])))
      .with("comment", (builder) => builder.select().orderBy("created_at", "desc").with("user", (builder) => builder.select(['username', 'id'])))

  

    const data = await query.paginate(page, limit);

    return data;


  }


  async show({ params }) {
    const query = Movie.query();
    query
      .orderBy("created_at", "desc")
      .where("is_deleted", false)
      .where("id", params.id)
      .with("comment", (builder) => {
        builder.select()
          .orderBy("created_at", "desc")
          .with("user", (builder) => builder.select(['username', 'id']));
      })
      .with("rating", (builder) => {
        builder.select()
          .orderBy("created_at", "desc")
          .with("user", (builder) => builder.select(['username', 'id']));
      });

    const data = await query.first();

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
    return {
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
  }



}

module.exports = MovieController
