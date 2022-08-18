Customer.destroy_all

[
  {
    first_name: 'Johny',
    last_name: 'Flow'
  },
  {
    first_name: 'Raj',
    last_name: 'Jamnis'
  },
  {
    first_name: 'Andrew',
    last_name: 'Chung'
  },
  {
    first_name: 'Mike',
    last_name: 'Smith'
  }
].each do |customer_params|
  Customer.create!(customer_params)

  puts "creating customer #{customer_params[:first_name]}"
end

# successful transactions

[
  [5, Customer.first],
  [3, Customer.second],
  [1, Customer.third],
  [1, Customer.fourth]
].each do |customer_details|
  customer_details[0].times.each do
    CreditCardCharge.create!(
      paid: true,
      amount: rand(69..6969),
      currency: 'usd',
      refunded: false,
      customer: customer_details[1]
    )

    puts "creating succesful transaction for #{customer_details[1].first_name}"
  end
end

# failed transactions

[
  [3, Customer.third],
  [2, Customer.fourth]
].each do |customer_details|
  customer_details[0].times.each do
    CreditCardCharge.create!(
      paid: false,
      amount: rand(69..6969),
      currency: 'usd',
      refunded: false,
      customer: customer_details[1]
    )

    puts "creating failed transaction for #{customer_details[1].first_name}"
  end
end

# disputed transactions

[
  [3, Customer.first],
  [2, Customer.second]
].each do |customer_details|
  customer_details[0].times.each do
    CreditCardCharge.create!(
      paid: true,
      amount: rand(69..6969),
      currency: 'usd',
      refunded: true,
      customer: customer_details[1]
    )

    puts "creating disupted transaction for #{customer_details[1].first_name}"
  end
end

puts "
Seeding complete! #{Customer.count} customers created,
#{CreditCardCharge.count} credit charges created
"
