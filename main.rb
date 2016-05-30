require 'sinatra'
require 'json'
require './domain.rb'
require './gmail.rb'


post '/register' do
	json_payload = JSON.parse(params['data'])
	account = parse_account_from_json(json_payload)
	account.save()
	send_confirmation_email()
end

def parse_account_from_json(json_payload)
	company_name  = json_payload["AdministrativeAccount"]["company_name"]
	first_name    = json_payload["AdministrativeAccount"]["first_name"]
	last_name   = json_payload["AdministrativeAccount"]["last_name"]
	email   = json_payload["AdministrativeAccount"]["email"]
	password    = json_payload["AdministrativeAccount"]["password"]
	status  = json_payload["AdministrativeAccount"]["status"]

	credit_card_number = json_payload["AdministrativeAccount"]["CreditCard"]["credit_card_number"]
	credit_card_expire_date = json_payload["AdministrativeAccount"]["CreditCard"]["credit_card_expire_date"]
	credit_card_security_code = json_payload["AdministrativeAccount"]["CreditCard"]["credit_card_security_code"]

	account = AdministrativeAccount.new(
		company_name:       company_name,
		first_name:         first_name,
		last_name:          last_name,
		email:              email,
		password:           password,
		status: "pending"
	)

	credit_card = CreditCard.new(credit_card_number: credit_card_number,
								credit_card_expire_date: credit_card_expire_date,
								credit_card_security_code: credit_card_security_code)
   account.credit_card = credit_card
   return account
end
