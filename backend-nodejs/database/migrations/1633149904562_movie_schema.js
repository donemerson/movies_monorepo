'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class MovieSchema extends Schema {
  up () {
    this.create('movies', (table) => {
      table.increments();
      table.integer('user_id').unsigned().notNullable().references('id').inTable('users').comment("Um filme é criado por um usuário")
      table.string('title', 256);
      table.string('year', 256);
      table.string('rated', 256);
      table.string('released', 256);
      table.string('runtime', 256);
      table.text('genre');
      table.string('director', 256);
      table.text('writer');
      table.text('actors');
      table.text('plot');
      table.string('language', 256);
      table.string('country', 256);
      table.text('awards');
      table.text('poster');
      table.string('metascore', 256);
      table.string('imdbrating', 256);
      table.string('imdbvotes', 256);
      table.string('imdbid', 256);
      table.string('type', 256);
      table.string('dvd', 256);
      table.string('boxoffice', 256);
      table.string('production', 256);
      table.text('website');
      table.boolean('is_deleted').defaultTo(false);
      table.timestamps();
    })

  }

  down () {
    this.drop('movies')
  }
}

module.exports = MovieSchema
