require "spec_helper"

describe DueNotifier do
  describe "notify" do
    let(:mail) { DueNotifier.notify }

    it "renders the headers" do
      mail.subject.should eq("Notify")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("こんにちは")
    end
  end

end
