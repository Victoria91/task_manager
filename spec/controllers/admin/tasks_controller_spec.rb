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
end