class UserSession <  Authlogic::Session::Base
  #attr_accessible :data, :session_id
   self.logout_on_timeout = true

	def to_key
	  new_record? ? nil : [ self.send(self.class.primary_key) ]
	end
end

