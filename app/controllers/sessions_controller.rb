class SessionsController < ApplicationController
  def create
     auth_hash = request.env['omniauth.auth']
<<<<<<< HEAD
     redirect_to root_path
=======
     
     raise
>>>>>>> d3a1ea05c592a3db339d5e5107e51d6c65fbe744
   end
end
