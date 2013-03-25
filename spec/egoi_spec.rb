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
    @client.call(:getUserData)["USERNNAME"].should == 'info@sinemys.pt'
  end

  it 'should contain Sinemys as user_id' do
    @client.call(:getLists).first["user_id"].should == 'Sinemys'
  end

end

describe 'Creating a new list' do

  before (:each) do
    @client = Fabricate(:client)
  end

  it 'should create a new list' do
    params = {
      'apikey' => 'f2fd1b545eff88104e49a12aedcf5edd2c0ed537',
      'nome' => 'Criada por API 3',
      'idioma_lista' => 'pt',
      'canal_email' => '1',
      'canal_sms' => '1',
      'canal_fax' => '1',
      'canal_voz' => '1',
      'canal_mms' => '0'
    }
    list_id = @client.call(:createList, params)
    @client.call(:getLists)[0]["listnum"].should == list_id["LIST_ID"]
  end
end