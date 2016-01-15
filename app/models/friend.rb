class Friend < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  before_save :create_rel_desc

  private
  def create_rel_desc
    case self.relationship_code
    when 0
      self.relationship_description = "Acquaintance"
    when 1
      self.relationship_description = "Friend"
    when 2
      self.relationship_description = "Partner"
    end
  end
end
