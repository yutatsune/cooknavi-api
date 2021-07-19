module Api
  module V1
    module Auth
      class SessionsController < ::DeviseTokenAuth::SessionsController
        # Prevent session parameter from being passed
        # Unpermitted parameter: session
        wrap_parameters format: []
      end
    end
  end
end