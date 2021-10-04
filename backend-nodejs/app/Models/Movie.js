'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Movie extends Model {

  static get table () {
    return 'movies';
  }
  
  comment () {
    return this.hasMany('App/Models/Comment');
  }
  
  rating () {
    return this.hasMany('App/Models/Rating');
  }

  user () {
    return this.belongsTo('App/Models/User');
  }
}

module.exports = Movie
