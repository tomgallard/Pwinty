require "spec_helper"

describe Pwinty::Client do
  describe "#get_orders" do
    let(:client) { Pwinty::Client.new('12345','6789') }
    context "when successful" do
      it "should not error" do
        stub_get_orders
        expect{client.get_orders}.to_not raise_error
      end
      it "should set auth headers" do
        stub_get_orders_headers
        expect{client.get_orders}.to_not raise_error
      end
    end
    context "when not authorized" do
      it "should raise" do
        stub_get_orders_fail 
        expect{ client.get_orders}.to raise_error(Pwinty::NotAuthorized)
      end
    end
  end
  describe "get_order" do
    subject {client}
    let(:client) { Pwinty::Client.new('12345','6789')}
    context "when not found" do
      it "should raise not found error" do
        stub_get_order_not_found
        expect { client.get_order(1)}.to raise_error(Pwinty::NotFound)
      end
    end
  end
end
