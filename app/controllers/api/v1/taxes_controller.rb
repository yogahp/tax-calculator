module Api
  # :reek:UncommunicativeModuleName
  module V1
    # This class is responsible for handling all
    # request from client
    class TaxesController < ApplicationController
      # GET /taxes
      api :GET, '/v1/taxes', 'Show list of taxes'
      description 'Listing taxes'
      formats ['json']
      example <<~HEREDOC
        # Response
        {
            "data": [
                {
                    "id": "1",
                    "type": "tax",
                    "attributes": {
                        "id": 1,
                        "name": "Test",
                        "tax_code": 1,
                        "type": "food",
                        "amount": 10000,
                        "tax_amount": 1000,
                        "total_amount": 11000
                    }
                },
                {
                    "id": "4",
                    "type": "tax",
                    "attributes": {
                        "id": 4,
                        "name": "Test",
                        "tax_code": 2,
                        "type": "tobacco",
                        "amount": 10000,
                        "tax_amount": 210,
                        "total_amount": 10210
                    }
                },
                {
                    "id": "9",
                    "type": "tax",
                    "attributes": {
                        "id": 9,
                        "name": "Test",
                        "tax_code": 3,
                        "type": "entertainment",
                        "amount": 10000,
                        "tax_amount": 99,
                        "total_amount": 10099
                    }
                }
            ],
            "meta": {
                "total_amount": 30000,
                "total_tax_amount": 1309,
                "grand_total": 31309
          }
        }
      HEREDOC
      # :reek:FeatureEnvy
      def index
        taxes = Tax.all
        options = {}
        options[:meta] = {
          total_amount: taxes.sum(:amount),
          total_tax_amount: taxes.sum(:tax_amount),
          grand_total: taxes.sum(:total_amount)
        }

        render json: TaxSerializer.new(taxes, options).serialized_json
      end

      # POST /taxes
      api :POST, '/v1/taxes', 'Create tax'
      error code: 422, desc: 'Unprocessable Entity'
      param :tax, Hash, desc: 'Tax bill' do
        param :name, String, desc: 'Name for tax', required: true
        param :tax_code, [1, 2, 3], desc: 'Tax type: food(1) / tobacco (2) / entertainment (3)'
        param :amount, Float, desc: 'Amount of item', required: true
      end
      description 'Creating tax'
      formats ['json']
      example <<~HEREDOC
        # Request
        {
          "tax": {
              "name": "Tax 1",
              "tax_code": 2,
              "amount": 10000.0
          }
        }

        # Response Success
        {
            "data": {
                "id": "10",
                "type": "tax",
                "attributes": {
                    "id": 10,
                    "name": "Tax 1",
                    "tax_code": 2,
                    "type": "tobacco",
                    "amount": 10000,
                    "tax_amount": 210,
                    "total_amount": 10210
                }
            }
        }

        # Response Failed
        {
            "errors": [
                {
                    "id": "name",
                    "title": "Name has already been taken"
                }
            ]
        }

        {
            "errors": [
                {
                    "id": "name",
                    "title": "Name can't be blank"
                },
                {
                    "id": "amount",
                    "title": "Amount can't be blank"
                },
                {
                    "id": "amount",
                    "title": "Amount is not a number"
                }
            ]
        }

        {
            "errors": [
                {
                    "id": "tax_code",
                    "title": "Tax code is not included in the list"
                }
            ]
        }
      HEREDOC
      def create
        tax = Tax.new(tax_params)

        if tax.save
          render json: TaxSerializer.new(tax).serialized_json, status: :created
        else
          render json: ErrorSerializer.serialize(tax.errors, %i[name tax_code amount]), status: :unprocessable_entity
        end
      end

      private

      # Only allow a trusted parameter "white list" through.
      def tax_params
        params.fetch(:tax) {}.permit(:name, :tax_code, :amount)
      end
    end
  end
end
