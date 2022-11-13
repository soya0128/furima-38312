FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1,min_numeric: 1)}
    password_confirmation {password}
    last_name             {'鈴木'}
    first_name            {'太郎'}
    last_name_furigana    {'スズキ'}
    first_name_furigana   {'タロウ'}
    birthdate             {Faker::Date.birthday}
  end
end