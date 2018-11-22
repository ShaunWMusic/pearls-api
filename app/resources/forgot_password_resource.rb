require 'jwt'
class ForgotPasswordResource < JSONAPI::Resource
    attributes :email, :password, :password_confirmation, :user_id, :token
    filters :token
    # this feature hides certain attributes from json api
    def fetchable_fields
        super - [:password, :password_confirmation]
    end

    before_save do
        email = @model.email
        # raise "If you haven’t logged in before, please create an account here:" if !user
        user = User.find_by!(email: email)
        @model.user_id = user.id if @model.new_record?
        data = {id: user.id, email: user.email}
        # this token is set expire in 1 hour
        payload = {data: data, sub: user.id, exp: Time.now.to_i * 3600}
        token = JWT.encode payload, JWT_SECRET, "HS512"
        @model.token = token if @model.new_record?   
        reset_password = @model 
        mail = ForgotPasswordMailer.Forgot_password(reset_password)
        mail.deliver_now 
        token    
    end

    def self.apply_filter(records, filter, value, options)
        case filter
        when :token
        user_id = records.where('token = ?', value).pluck(:user_id, :password_digest)
        id = user_id[0].first
        password = user_id[0].second
        User.where('id = ?', id).update(password_digest: password)
        records.where('token = ?', value)
        else
            super
        end
    end

end
