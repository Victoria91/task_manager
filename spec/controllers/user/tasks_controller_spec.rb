require 'rails_helper'

RSpec.describe User::TasksController do
  describe 'GET #index' do
    context 'autorized' do
      let(:current_user) { FactoryGirl.create(:user) }
      let(:tasks) { FactoryGirl.create_list(:task, 5) }
      let(:user_tasks) { FactoryGirl.create_list(:task, 3, user: current_user)}
      before { @request.session['user_id'] = current_user.id }
      before { get :index }

      it 'load all user tasks' do
        expect(assigns(:tasks)).to eq(user_tasks)
      end

      it 'renders index template' do
        expect(response).to render_template :index
      end
    end
  end
end