class User < ActiveRecord::Base
	attr_accessible :email, :login, :name, :last_name, :second_last_name, :password, :password_confirmation, :role_id
	
	acts_as_authentic do |c|
		c.logged_in_timeout(30.minutes)
		c.login_field = 'login'
		c.validate_email_field = false
    end # block optional

    acts_as_authentic do |c|
		
	end

    belongs_to :role

    def full_name
	    full_names = self.name+" "+self.last_name+" "+self.second_last_name
	 end

	def role_name
		role = self.role.name
	end

	def active_name
		if self.is_active
			active = "Si"
		else 
			active = "No"
		end
	end
    
  
end
