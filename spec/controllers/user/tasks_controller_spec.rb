require 'rails_helper'

RSpec.describe User::TasksController do
  let(:current_user) { create(:user) }
  let(:request) { get :index }

  describe 'GET #index' do
    context 'authenticated' do
      let(:tasks) { create_list(:task, 5) }
      let(:user_tasks) { create_list(:task, 3, user: current_user)}
      before { @request.session['user_id'] = current_user.id }
      before { request }

      it 'loads all user tasks' do
        expect(assigns(:tasks)).to eq(user_tasks)
      end

      it 'renders index template' do
        expect(response).to render_template :index
      end
    end

    context 'authenticated' do
      it_behaves_like 'Authentication-requireable'
    end
  end

  describe 'POST #create' do
    context 'authenticated' do
      let(:request) { post :create, params: { task: attributes_for(:task) } }

      before { @request.session['user_id'] = current_user.id }

      it 'creates user task' do
        expect{ request }.to change(Task.where(user_id: current_user.id), :count).by(1)
      end
    end
  end

  describe 'PUT #update' do
    context 'authenticated' do
      let(:request) { post :create, params: { task: attributes_for(:task) } }

      before { @request.session['user_id'] = current_user.id }

      it 'creates user task' do
        expect{ request }.to change(Task.where(user_id: current_user.id), :count).by(1)
      end
    end
  end
end
