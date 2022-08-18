class CreateCreditCardCharges < ActiveRecord::Migration[7.0]
  def change
    create_table :credit_card_charges do |t|
      t.boolean :paid
      t.decimal :amount, precision: 10, scale: 2
      t.string :currency
      t.boolean :refunded
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
