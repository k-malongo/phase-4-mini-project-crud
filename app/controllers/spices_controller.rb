class SpicesController < ApplicationController
     # GET /spices
     def index
        spices = Spice.all
        render json: spices
      end
    
      # POST /spices
      def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
      end
    
      # GET /spices/:id
      def show
        spice = Spice.find_by(id: params[:id])
        if spice
          render json: spice
        else
          render json: { error: "spice not found" }, status: :not_found
        end
      end
    
      # PATCH /spices/:id
      def update
        spice = Spice.find_by(id: params[:id])
        if spice
          spice.update(spice_params)
          render json: spice
        else
          render json: { error: "spice not found" }, status: :not_found
        end
      end
    
      # # PATCH /spices/:id/like
      # def increment_likes
      #   spice = Spice.find_by(id: params[:id])
      #   if spice
      #     spice.update(likes: spice.likes + 1)
      #     render json: spice
      #   else
      #     render json: { error: "spice not found" }, status: :not_found
      #   end
      # end
    
      #delete spices
      def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
          spice.destroy
          head :no_content
        else
          render json: { error: "spice not found" }, status: :not_found
        end
      end 
    
      private
    
      def bird_params
        params.permit(:name, :species, :likes)
      end
    
end
