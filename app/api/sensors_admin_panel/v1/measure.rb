module SensorsAdminPanel
  class V1::Measure < Grape::API
    use Rack::JSONP

    helpers do
      params :token do
        optional :token, type: String, default: nil,
        documentation: {
          type: 'String',
          desc: 'Authenticate token'
        }
      end

      params :value do
        optional :value, type: Integer, default: nil,
        documentation: {
          type: 'Integer',
          desc: 'Value of measure'
        }
      end
    end

    resource :measures do
      desc 'REST GET with no parameters.' do
        detail <<-NOTE
            Make a query for measures.
            -----------------

            Returns an array of all measures.
          NOTE
      end
      get do
        api_response(::Measure.all.to_json)
      end

      route_param :id do
        desc 'REST GET with id param.' do
          detail <<-NOTE
              Make a query for a measure with certain id.
              -----------------

              Returns the result of query for a measure.
            NOTE
        end
        params do
          requires :token, type: String, desc: 'Authentication token'
          requires :id, type: Integer, desc: "Measure ID"
        end
        get do
          begin
            authenticate!

            measure = ::Measure.find(params[:id])
            api_response(measure.to_json)
          rescue ActiveRecord::RecordNotFound => e
            status 404 # Not found
          end
        end
      end

      desc 'REST Post with attributes params.' do
        detail <<-NOTE
            Creates a measure with the information passed through params.
            -----------------
          NOTE
      end
      params do
        requires :token
        requires :sensor_id, type: Integer, desc: 'ID of sensor measure'
        requires :value, type: Integer, desc: 'Value of measure'
      end
      post do
        begin
          authenticate!
          safe_params = clean_params(params)
                        .permit(:value, :sensor_id)

          if safe_params
            ::Measure.create!(safe_params)
            status 200 # Saved OK
          end
        rescue ActiveRecord::RecordNotFound => e
          status 404 # Not found
        end
      end

      desc 'REST Put with attributes param.' do
        detail <<-NOTE
            Updates a measure with the information passed through params.
            -----------------
          NOTE
      end
      params do
        requires :token
        requires :sensor_id, type: Integer, desc: 'ID of sensor measure'
        requires :value, type: Integer, desc: 'Value of measure'
      end
      put ':id' do
        begin
          authenticate!
          safe_params = clean_params(params)
                        .permit(:value, :sensor_id)

          if safe_params
            measure = ::Measure.find(params[:id])
            measure.update_attributes(safe_params) unless measure.blank?

            status 200 # Saved OK
          end
        rescue ActiveRecord::RecordNotFound => e
          status 404 # Not found
        end
      end
    end

  end
end
