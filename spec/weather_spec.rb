require 'rails_helper'

describe "get weather route to Aracaju", :type => :request do
  
before {get '/api/v1/weather/Aracaju'}

it 'returns weather' do
    expect(JSON.parse(response.body)['name']).to eq('Aracaju')
  end
it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end



