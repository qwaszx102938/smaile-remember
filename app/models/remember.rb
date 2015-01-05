class Remember < ActiveRecord::Base
  def to_translation
    Translation.new self.remember_reference
  end
end
