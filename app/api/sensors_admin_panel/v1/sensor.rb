module SensorsAdminPanel
  class V1::Sensor < Grape::API
    use Rack::JSONP

    helpers do
      params :token do
        optional :token, type: String, default: nil,
        documentation: {
          type: 'String',
          desc: 'Authenticate token'
        }
      end

      params :attributes do
        optional :attributes, type: Hash, default: {},
        documentation: {
          type: 'Hash',
          desc: 'Params attributes of sensor'
        }
      end
    end

    resource :sensors do
      desc 'REST GET with no parameters.' do
        detail <<-NOTE
            Make a query for sensors.
            -----------------

            Returns an array of all sensors.
          NOTE
      end
      get do
        api_response(::Sensor.all.to_json)
      end

      route_param :id do
        desc 'REST GET with id param.' do
          detail <<-NOTE
              Make a query for a sensor with certain id.
              -----------------

              Returns the result of query for a sensor.
            NOTE
        end
        params do
          requires :token, type: String, desc: 'Authentication token'
          requires :id, type: Integer, desc: "Sensor ID"
        end
        get do
          begin
            authenticate!

            sensor = ::Sensor.find(params[:id])
            api_response(sensor.to_json)
          rescue ActiveRecord::RecordNotFound => e
            status 404 # Not found
          end
        end
      end

      desc 'REST Post with attributes param.' do
        detail <<-NOTE
            Creates a sensor with the information passed through attributes param.
            -----------------

            This is a hash, with the estruture:

            ```
              {"name": "Example", "description": "Description example", "kind": 1}
            ```
          NOTE
      end
      params do
        requires :token
        requires :attributes, type: Hash, desc: 'Sensor object to create' do
          requires :name, type: String, desc: 'Name of sensor'
          requires :description, type: String, desc: 'Description of sensor'
          requires :kind, type: Integer, desc: 'Kind of sensor'
        end
        optional :value, type: Integer, desc: 'Value of sensor'
      end
      post do
        begin
          authenticate!
          safe_params = clean_params(params[:attributes])
                        .permit(:name, :description, :kind, :Value)

          if safe_params
            ::Sensor.create!(safe_params)
            status 200 # Saved OK
          end
        rescue ActiveRecord::RecordNotFound => e
          status 404 # Not found
        end
      end

      desc 'REST Put with attributes param.' do
        detail <<-NOTE
            Updates a sensor with the information passed through attributes param.
            -----------------

            This is a hash, with the estruture:

            ```
              {"name": "Example", "description": "Description example", "kind": 1}
            ```
          NOTE
      end
      params do
        requires :token, type: String, desc: 'Authentication token'
        requires :id, type: Integer, desc: "Sensor ID"
        group :attributes, type: Hash, desc: 'Sensor object to create' do
          optional :name, type: String, desc: 'Name of sensor'
          optional :description, type: String, desc: 'Description of sensor'
          optional :kind, type: Integer, desc: 'Kind of sensor'
        end
        requires :value, type: Integer, desc: 'Value of sensor'
      end
      put ':id' do
        begin
          authenticate!
          safe_params = clean_params(params[:attributes])
                        .permit(:name, :description, :kind)

          if safe_params
            sensor = ::Sensor.find(params[:id])
            sensor.update_attributes(safe_params) unless sensor.blank?

            if sensor.present? && params[:value].present?
              measure = Measure.create!(value: params[:value], sensor_id: sensor.id)
              sensor.measures << measure
            end

            status 200 # Saved OK
          end
        rescue ActiveRecord::RecordNotFound => e
          status 404 # Not found
        end
      end
    end

  end
end
