class DueNotifier < ActionMailer::Base
  default from: "from@example.com"

  def notify
    @task = Task.new

    mail to: "to@example.org"
  end
end
