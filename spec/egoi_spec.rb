require 'spec_helper'
require 'fabrication'

describe Egoi do

  before (:each) do
    @client = Fabricate(:client)
  end

  it 'should create a client' do
    @client = Fabricate(:client)
    @client.api_method?(:getUserData).should be true
  end

  it "should have the method 'getUserData'" do
    @client.api_method?(:getUserData).should be true
  end

  it 'should contain sinemys details' do
    @client.getUserData["USERNNAME"].should == 'info@sinemys.pt'
  end

  it 'should contain Sinemys as user_id' do
    @client.getLists.first["user_id"].should == 'Sinemys'
  end

end

describe 'Creating a new list' do

  before (:each) do
    @client = Fabricate(:client)
  end

  it 'should create a new list' do
    params = {
      'nome' => 'Criada por API',
      'idioma_lista' => 'pt',
      'canal_email' => '1',
      'canal_sms' => '1',
      'canal_fax' => '1',
      'canal_voz' => '1',
      'canal_mms' => '0'
    }
    list_id = @client.call(:createList, params)
    @client.getLists[0]["listnum"].should == list_id["LIST_ID"]
  end
end