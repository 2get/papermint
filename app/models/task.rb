class Task < ActiveRecord::Base
  attr_accessible :content, :limit_date, :priority, :user_id
end
