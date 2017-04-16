require 'rails_helper'

RSpec.describe Admin::TasksController do
  describe 'GET #index' do
    context 'authenticated' do
      let(:tasks) { create_list(:task, 5) }
      before { @request.session['user_id'] = create(:admin).id }
      before { get :index }

      it 'load all tasks' do
        expect(assigns(:tasks)).to eq(tasks)
      end

      it 'renders index template' do
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #new' do
    context 'authenticated' do
      before { @request.session['user_id'] = create(:admin).id }
      before { get :new }
      
      it 'instantiates new task' do
        expect(assigns(:task)).to be_a_new(Task)
      end

      it 'renders index template' do
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    context 'authenticated' do
      let(:task) { create(:task) }
      before { @request.session['user_id'] = create(:admin).id }
      before { get :edit, params: { id: task.id } }

      it 'loads require task' do
        expect(assigns(:task)).to eq(task)
      end
    end
  end

  describe 'POST #create' do
    context 'authenticated' do
      before { @request.session['user_id'] = create(:admin).id }
      it 'creates a task' do
        expect{ post :create, params: { task: attributes_for(:task) } }.to change(Task, :count).by(1)
      end 
    end
  end

  describe 'DELETE #destroy' do
    context 'authenticated' do
      before { @request.session['user_id'] = create(:admin).id }
      let!(:task) { create(:task) }

      it 'destroys a task' do
        expect { delete :destroy, params: { id: task.id } }.to change(Task, :count).by(-1)
      end
    end
  end
end
