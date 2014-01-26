# coding: utf-8

FactoryGirl.define do
  factory :task do
    title 'メールを送る'
    description '議事録の内容を添付する'
    due_date DateTime.new(2014, 2, 1)
  end
end
