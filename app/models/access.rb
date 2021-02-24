class Access < ApplicationRecord
  belongs_to :user

  scope :search, -> (search_params) do
    join_from(search_params[:join_from])
    .join_to(search_params[:join_to])
  end

  scope :join_from, -> (from){where('? <= access_date', from) if from.present?}
  scope :join_to, -> (to){where('access_date <= ?', to) if to.present?}
end
