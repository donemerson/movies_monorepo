'use strict'
const Movie = use("App/Models/Movie");
const Rating = use("App/Models/Rating");
class RatingController {
    async store({ auth, request, params }) {
        const { movie_id, value } = request.all();

        const user = await auth.getUser();

        const movie = await Movie.findByOrFail({
            id: movie_id,
        });

        const movie_rating = await Rating.findBy({ movie_id: movie.id, user_id: user.id });

        if (movie_rating) {
            if (movie_rating.value != value) {
                await movie_rating.merge({ value: value });
                await movie_rating.save();
            }
        } else {
            await Rating.create({ value: value, movie_id: movie.id, user_id: user.id });
        }

        return {
            data:{}
        };
    }
}

module.exports = RatingController
