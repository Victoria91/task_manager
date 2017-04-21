shared_examples_for 'Authentication-requireable' do
  it 'redirects unauthorized' do
    request
    expect(response).to redirect_to :sign_in
  end
end
