class Task < ApplicationRecord
	belongs_to :list
	# enum status: { not_done: 0, doing: 1, done: 2}
	enum status: [ :not_done, :doing, :done]

	def self.search(search)
		where("task LIKE ?", "%#{search}%")
	end
end

