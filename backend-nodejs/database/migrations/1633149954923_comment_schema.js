'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class CommentSchema extends Schema {
  up () {
    this.create('comments', (table) => {
      table.increments()
      table.integer('movie_id').unsigned().notNullable().references('id').inTable('movies')
      table.integer('user_id').unsigned().notNullable().references('id').inTable('users')
      table.text('value').notNullable()
      table.timestamps()
    })
  }

  down () {
    this.drop('comments')
  }
}

module.exports = CommentSchema
