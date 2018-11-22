class NewAccountResource < JSONAPI::Resource
    attributes :email, :password, :password_confirmation, :user_id, :token
    filters :token
    # this feature hides certain attributes from json api
    # def fetchable_fields
    #     super - [:password, :password_confirmation]
    # end

    before_save do
        email = @model.email
        # raise "If you haven’t logged in before, please create an account here:" if !user
        password = @model.password_digest
        # binding.pry
        User.where('id = ?', user_id).update(password_digest: password)
        # mail = ForgotPasswordMailer.Forgot_password(reset_password)
        # mail.deliver_now 
        token    
    end

    def self.apply_filter(records, filter, value, options)
        case filter
        when :token
        user_id = records.where('token = ?', value).pluck(:user_id, :password_digest)
        id = user_id[0].first
        records.where('token = ?', value)
        else
            super
        end
    end
end
