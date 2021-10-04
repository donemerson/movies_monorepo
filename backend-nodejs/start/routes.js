'use strict'

/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| Http routes are entry points to your web application. You can create
| routes for different URLs and bind Controller actions to them.
|
| A complete guide on routing is available here.
| http://adonisjs.com/docs/4.1/routing
|
*/

/** @type {typeof import('@adonisjs/framework/src/Route/Manager')} */

const Route = use('Route')
const Event = use('Event')

Route.post("user", "UserController.store");
Route.post("auth", "UserController.login");

Route.post("rating", "RatingController.store").middleware('auth');
Route.post("comment", "CommentController.store").middleware('auth');

Route.get("movie", "MovieController.index");
Route.get("movie/:id", "MovieController.show");
Route.post("movie", "MovieController.store").middleware('auth');
Route.patch("movie/:id", "MovieController.update").middleware('auth');
Route.delete("movie/:id", "MovieController.destroy").middleware('auth');


