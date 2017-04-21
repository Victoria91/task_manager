require 'rails_helper'

RSpec.describe ApplicationController do
  let!(:user) { create(:user, email: email, password: password) }

  describe 'POST #log_in' do
    let(:email) { 'email@test.ru' }
    let(:password) { 'secret_password' }
    let(:request) { post :log_in, params: { log_in: { email: email, password: password } } }

    context 'with valid credentials' do
      it 'sets user session id' do
        expect { request }.to change{ @request.session['user_id'] }.to(user.id)
      end

      it 'redirects to user/tasks#index' do
        request
        expect(response).to redirect_to [:user, :tasks]
      end
    end

    context 'with invalid credentials' do
      let(:request) { post :log_in, params: { log_in: { email: email, password: 'invalid password' } } }

      it 'sets user session id' do
        expect { request }.not_to change{ @request.session['user_id'] }
      end

      it 'redirects to user/tasks#index' do
        request
        expect(response).to render_template 'sign_in'
      end
    end
  end
end
