require 'rails_helper'

RSpec.describe "Credit Card Index", type: :feature do
   before do
    create_list(:credit_card_charge, 10, :successful)
    create_list(:credit_card_charge, 5, :failed)
    create_list(:credit_card_charge, 5, :disputed)
  end

  scenario 'There are 20 transactions' do
    visit '/credit_card_charges'

    expect(page).to have_content 'Failed Charges'
    expect(page).to have_content 'Disputed Charges'
    expect(page).to have_content 'Successful Charges'

    within('#successful-transactions') do
      expect(all('div').count).to eq(10)
    end

    within('#disputed-transactions') do
      expect(all('div').count).to eq(5)
    end

    within('#failed-transactions') do
      expect(all('div').count).to eq(5)
    end
  end
end
