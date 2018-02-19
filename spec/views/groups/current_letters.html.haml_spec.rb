require 'rails_helper'

RSpec.describe 'groups/current_letters', vcr: true do
  before do
    assign(:groups, [double(:group, name: 'GroupName', graph_id: 'ziLwaBLc')])
    assign(:letters, 'C')
    controller.params = { letter: 'c' }
    render
  end

  context 'header' do
    it 'will render the correct header' do
      expect(rendered).to match(/Current groups/)
    end

    it 'will render the correct sub-header' do
      expect(rendered).to match(/A to Z - showing results for C/)
    end
  end

  context 'partials' do
    it 'will render _group_list' do
      expect(response).to render_template(partial: '_group_list')
    end
  end
end
