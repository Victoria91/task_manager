require 'rails_helper'

RSpec.describe Admin::TasksController do
  describe 'GET #index' do
    let(:tasks) { FactoryGirl.create_list(:task, 5) }
    before { get :index }
    it 'load all tasks' do
      expect(assigns(:tasks)).to eq(tasks)
    end

    it 'renders index template' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    before { get :new }
    it 'instantiates new task' do
      expect(assigns(:task)).to be_a_new(Task)
    end

    it 'renders index template' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    let(:task) { FactoryGirl.create(:task) }
    before { get :edit, id: task.id } 

    it 'loads require task' do
      expect(assigns(:task)).to eq(task)
    end
  end

  describe 'POST #create' do

    it 'creates a task' do
      expect{ post :create, task: FactoryGirl.attributes_for(:task) }.to change(Task, :count).by(1)
    end
  end

  describe 'DELETE #destroy' do
    let!(:task) { FactoryGirl.create(:task) }

    it 'destroys a task' do
      expect { delete :destroy, id: task.id }.to change(Task, :count).by(-1)
    end
  end
end