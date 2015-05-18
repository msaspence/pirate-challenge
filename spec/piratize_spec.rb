require 'spec_helper'

describe Piratize do


  describe '#piratize' do

    subject { Piratize.piratize value }

    context "when the value is a string" do

      let(:value) { "this is a string"}

      it "should translate it to pirish" do
        expect(TalkLikeAPirate).to receive(:translate).with(value).and_call_original
        subject
      end

    end

  end

end