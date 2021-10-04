'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class RatingSchema extends Schema {
  up () {
    this.create('ratings', (table) => {
      table.increments()
      table.integer('movie_id').unsigned().notNullable().references('id').inTable('movies')
      table.integer('user_id').unsigned().unique().notNullable().references('id').inTable('users')
      table.integer('value').unsigned().notNullable()
      table.timestamps()
    })
  }

  down () {
    this.drop('ratings')
  }
}

module.exports = RatingSchema
