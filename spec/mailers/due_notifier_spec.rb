require "spec_helper"

describe DueNotifier do
  describe "#notify" do
    let(:mail) { DueNotifier.notify }

    before do
      create(:task, due_date: due_date)
      Timecop.freeze(DateTime.new(2014, 2, 1))
    end

    after do
      Timecop.return
    end

    context '通知対象のタスクがあるとき' do
      let(:due_date) { DateTime.new(2014, 1, 31) }

      it "renders the headers" do
        mail.subject.should eq("Notify")
        mail.to.should eq(["to@example.org"])
        mail.from.should eq(["from@example.com"])
      end

      it "assigns @task" do
        mail.body.encoded.should match("メールを送る")
        mail.body.encoded.should match("2014/01/31")
      end
    end
  end
end
