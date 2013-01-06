require 'spec_helper'

describe SimpleKM::Client do
  describe "#initialize" do
    context "when the API key is nil" do
      it "should raise an ArgumentError" do
        expect { SimpleKM::Client.new(user_identifier: "foo") }.to raise_error(ArgumentError)
      end
    end

    context "when the user identifier is nil" do
      it "should raise an ArgumentError" do
        expect { SimpleKM::Client.new(api_key: "foo") }.to raise_error(ArgumentError)
      end
    end

    context "when both the API key and the user identifier are specified" do
      it "should not raise an error" do
        expect { SimpleKM::Client.new(api_key: "foo", user_identifier: "bar") }.not_to raise_error
      end
    end
  end

  describe "#record" do
    let(:api_key) { "somekey" }
    let(:user_identifier) { "foo@bar.com" }
    let(:action) { "some action" }
    let(:client) { SimpleKM::Client.new(api_key: api_key, user_identifier: user_identifier) }

    context "when data is not nil" do
      context "when the data is a hash" do
        let(:data) { { some: "data" } }

        it "should set a get request to the correctly formatted url" do
          HTTParty.should_receive(:get).with("https://trk.kissmetrics.com/e?_k=somekey&_n=some%20action&_p=foo%40bar.com&some=data")

          client.record(action, data)
        end
      end

      context "when the data is not a hash" do
        let(:data) { "foo" }

        it "should raise an ArgumentError" do
          expect{ client.record(action, data) }.to raise_error(ArgumentError)
        end
      end
    end

    context "when data is nil" do
      let(:data) { nil }

      it "should set a get request to the correctly formatted url" do
        HTTParty.should_receive(:get).with("https://trk.kissmetrics.com/e?_k=somekey&_n=some%20action&_p=foo%40bar.com")

        client.record(action, data)
      end
    end
  end
end
