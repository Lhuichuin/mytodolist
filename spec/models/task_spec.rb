require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#search' do
		before(:each) do
			list= List.new(name: 'errands', user_id: 1)
			list.save

			task= Task.new(task: 'walk the dog', status: 'not_done')
			task.list = list
			task.save

		end
		it 'gives the tasks that contains the term' do
			@result = Task.search('walk the dog')
			expect(@result[0].task).to eq 'walk the dog'
		end
  end
end
