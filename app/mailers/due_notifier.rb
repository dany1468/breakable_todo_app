class DueNotifier < ActionMailer::Base
  default from: "from@example.com"

  def notify
    # TODO 通知対象のタスクの有りなしは呼び出し側で行う、ひとまずテストを通すための仮実装
    @task = Task.approaching_deadline.first

    mail to: "to@example.org"
  end
end
