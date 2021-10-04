'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Comment extends Model {

  static get table () {
    return 'comments'
  }
  
  static get hidden() {
    return ['id','created_at','updated_at'];
  }

  movie () {
    return this.belongsTo('App/Models/Movie')
  }
  
  user () {
    return this.belongsTo('App/Models/User')
  }
}

module.exports = Comment
