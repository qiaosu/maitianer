Factory.define :user do |user|
  user.email                 "zhangchao51@163.com"
  user.password              "zc19860721"
  user.password_confirmation "zc19860721"
  user.confirmed_at          Date.today
end

Factory.define :baby do |baby|
  baby.name "Maitianer"
  baby.nick_name "XiaoNiZi"
  baby.birthday Date.today - 30.days
  baby.sex 1
  baby.association :user
end