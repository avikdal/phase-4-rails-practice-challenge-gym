class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_response
    
        def create
            client = Client.create!(client_params)
            render json: client, status: :created
        end

        def index
            render json: Client.all
        end

        def show
            client = find_client
            redner json: client
        end

        def update
            client = find_client
            client.update(client_params)
            render json: client
        end
        
        def destroy
            client = find_client
            client.destroy
            head :no_content
        end

        private
    
        def client_params
            params.permit(:name, :age)
        end

        def find_client
            Client.find(params[:id])
        end
    
        def record_not_found_respons
            render json: { error: "client not found" }, status: :not_found 
        end
    
        def record_invalid_response
            render json: { error: "oops looks like you need different information to create this client" }, status: :unprocessable_entity
        end
    
end
