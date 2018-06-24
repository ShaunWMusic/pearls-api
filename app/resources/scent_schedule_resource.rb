class ScentScheduleResource < JSONAPI::Resource
  attributes :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sept, :oct, :nov, :dec, :userid

  filters :query

  before_save do
    @model.user_id = context[:current_user].id  if @model.new_record?
  end

  def self.apply_filter(records, filter, value, options)
    case filter
    when :query
      records.where('userid LIKE ?', "%#{value.first}%")
    else
      super
    end
  end
end
