# == Schema Information
#
# Table name: devices
#
#  id            :integer          not null, primary key
#  name          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  status_id     :integer
#  reference_url :text
#

class Device < ActiveRecord::Base
  attr_accessible :name, :tag, :status_id, :reference_url
  
  validates :name, presence: true

  has_many :asset_tags
  has_many :owners

  belongs_to :status

  has_and_belongs_to_many :maintainers, :class_name => User, :join_table => :devices_maintainers

  after_save :deliver_status_change_email

  def deliver_status_change_email
    if status_id_changed?
      maintainers.each do |maintainer|
        MaintenanceAlertMailer.status_change(maintainer, self).deliver
      end
    end
  end
end
