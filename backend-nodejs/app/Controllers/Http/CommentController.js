'use strict'
const Movie = use("App/Models/Movie");
const Comment = use("App/Models/Comment");

class CommentController {
    async store({ auth, request }) {
        const {movie_id, value } = request.all();
                const user = await auth.getUser();

        const movie = await Movie.findByOrFail({
            id: movie_id,
        });

        await Comment.create({ value: value, movie_id: movie.id, user_id: user.id });


        return {
            data:{}
        };
    }
}

module.exports = CommentController
