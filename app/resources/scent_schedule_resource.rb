class ScentScheduleResource < JSONAPI::Resource
  attributes :scent, :user_id

  filters :query

  before_save do
    @model.user_id = context[:current_user].id  if @model.new_record?
  end

  def self.apply_filter(records, filter, value, options)
    case filter
    when :query
      records.where('user_id LIKE ?', "%#{value.first}%")
    else
      super
    end
  end
end
