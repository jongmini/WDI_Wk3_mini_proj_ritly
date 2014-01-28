# == Schema Information
#
# Table name: urls
#
#  id         :integer          not null, primary key
#  og_url     :string(255)
#  new_url    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_count :integer
#

class Url < ActiveRecord::Base
end
