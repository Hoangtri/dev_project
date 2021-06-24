class ShareVideo < ApplicationRecord
  include ApplicationHelper

  validates :url, presence: true
  validate :validate_for_youtube_url

  belongs_to :user

  scope :recent, -> {order(created_at: :desc)}

  def youtube_id
    get_youtube_id(url)
  end

  def validate_for_youtube_url
    return if url.blank?

    regexp = /^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})?$/
    return if url =~ regexp
    message = 'is invalid'
    errors.add(:url, message)
  end
end
