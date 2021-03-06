class Portfolio < ApplicationRecord
  include Placeholder

  after_initialize :set_defaults

  has_many :technologies
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  validates_presence_of :title, :body, :main_image, :thumb_image

  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on rails') }

  def self.angular
    where(subtitle: 'Angular JS')
  end

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end

  def self.by_position
    order("position ASC") 
  end
end
