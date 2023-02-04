class Flat < ApplicationRecord
  before_save :set_default_image

  def set_default_image
    self.image = 'unsplash-banner.avif' unless image
  end
end
