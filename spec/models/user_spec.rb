require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'validations' do
		it {is_expected.to validate_presence_of(:email)}
		describe 'uniqueness' do
			subject { User.create(first_name: 'jack', last_name: 'jack', email: 'jack@jack.com')}
			it {is_expected.to validate_uniqueness_of(:email)}
		end
	end
	describe 'associations' do
		it {is_expected.to have_many(:lists) }
	end
end
