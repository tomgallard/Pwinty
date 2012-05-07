require 'pwinty'
require 'rspec'
require 'webmock/rspec'

def initialize
  @baseUrl = "https://sandbox.pwinty.com"
end
def fixture_path
  File.expand_path("../fixtures",__FILE__)
end

def fixture(file)
  File.new(fixture_path +'/' +file)
end
def fullUrl(relativePath)
  URI.join(@baseUrl,relativePath).to_s
end
include WebMock::API
def stub_get_orders
  fixture_file = 'users_success.txt'
  stub_request(:get,fullUrl("Orders")).
    to_return(File.new('./spec/fixtures/users_success.txt'))
end
def stub_get_orders_headers
  stub_request(:get,fullUrl("Orders")).with(:body => '',
    :headers => { 'X-Pwinty-MerchantId' => '12345',
                   'X-Pwinty-REST-API-Key' => '6789'})
    .to_return(File.new('./spec/fixtures/users_success.txt'))
end
def stub_get_orders_fail
  stub_request(:get,"https://sandbox.pwinty.com/Orders").
    to_return(File.new('./spec/fixtures/users_fail.txt'))
end
def stub_get_order_not_found
  stub_request(:get,"https://sandbox.pwinty.com/Orders").
    to_return(File.new('./spec/fixtures/not_found.txt'))
end
