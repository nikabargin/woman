class Product < ApplicationRecord
	has_one_attached :cover
	has_many_attached :images
	has_many_attached :photos

	validates :name, presence: true
	validates :brief, presence: true
	validates :description, presence: true
	validates :kit, presence: true

	validate :cover_type
	validate :image_type
	validate :photo_type

	def card
		return self.cover.variant(combine_options: {resize: "900", quality: "80"}).processed
	end

	def thumb input
		return input.variant(combine_options: {resize: "400", gravity: "Center", crop: "4:5" }).processed
	end

	def slide input
		return input.variant(combine_options: {resize: "800", gravity: "Center", crop: "4:5" }).processed
	end

	def square input
		return input.variant(combine_options: {resize: "750", gravity: "Center", crop: "1:1" }).processed
	end

	def full input
		return input.variant(resize: "1500").processed
	end

	private

	def cover_type
		if cover.attached? && !cover.content_type.in?(%('image/jpeg image/png'))
			errors.add(:cover, 'Изображения должны быть формата JPEG или PNG')
		end
	end

	def image_type
		images.each do |image|
			if !image.content_type.in?(%('image/jpeg image/png'))
				errors.add(:images, 'Изображения должны быть формата JPEG или PNG')
			end
		end
	end

	def photo_type
		photos.each do |photo|
			if !photo.content_type.in?(%('image/jpeg image/png'))
				errors.add(:photos, 'Изображения должны быть формата JPEG или PNG')
			end
		end
	end
end
