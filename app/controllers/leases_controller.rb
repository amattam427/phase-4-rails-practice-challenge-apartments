class LeasesController < ApplicationController

    # def index
    #     render json: Lease.all
    # end

    def create
        lease = Lease.create(lease_params)
        render json: lease, status: :created
    end

    def destroy
        lease = find_lease
        lease.destroy
        head :no_content
    end

    private 

    def find_lease
        Lease.find(params[:id])
    end

    def lease_params
        params.permit(:rent, :tenant_id, :apartment_id)
    end
end
