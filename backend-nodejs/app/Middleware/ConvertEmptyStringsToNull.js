'use strict'

class ConvertEmptyStringsToNull {
  async handle ({ request }, next) {
    console.log("request.body");
    
    if (Object.keys(request.body).length) {
      request.body = Object.assign(
        ...Object.keys(request.body).map(key => ({
          [key]: request.body[key] !== '' ? request.body[key] : null
        }))
      )
    }
    console.log("request.body");
    await next()
  }
}

module.exports = ConvertEmptyStringsToNull
