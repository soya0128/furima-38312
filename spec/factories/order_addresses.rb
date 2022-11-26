FactoryBot.define do
  factory :order_address do
    post_code {'123-4567'} 
    prefecture { 2 }
    city {'豊田市'}
    address {'西町1-2-3'}
    building_name {'西町ハイツ'}
    phone_number {'09012345678'}
    token {'tok_abcdefghijk00000000000000000'}
  end
end
