class MembershipsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_response

    def create
        membership = Membership.create!(membership_params)
        render json: membership, status: :created
    end

    private

    def membership_params
        params.permit(:client_id, :gym_id, :charge)
    end

    def record_not_found_respons
        render json: { error: "membership not found" }, status: :not_found 
    end

    def record_invalid_response
        render json: { error: "oops looks like you need different information to create this membership" }, status: :unprocessable_entity
    end
    
end
