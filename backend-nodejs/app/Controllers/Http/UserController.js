'use strict'
const User = use("App/Models/User");
const CustomException = use("App/Exceptions/CustomException");

class UserController {
  async login({ auth, request }) {
    const { username, password } = request.all()
    const login = await auth.attempt(username, password)
    const user =await User.findBy('username',username);

    return {
      data: {
        username:user.username,
        id:user.id,
        token: login.token,
        refreshToken: login.refreshToken,
      },
    };
  }

  async store({ auth, request }) {
    const { username, password } = request.all()
    
    const user = await User.findBy({username: username});
    const alreadyCreated = user != null;

    if(alreadyCreated){
      throw new CustomException('Username em uso');
    }

    await User.create({username, password});
    
    return await this.login({request, auth});
  }




}

module.exports = UserController
