class CervezasController < ApplicationController
	def index
	    @cervezas = Cerveza.all
    	if user_signed_in?
      		@mis_pedidos = current_user.pedidos
    	end
    	@mis_pedidos = current_user.pedidos
  	end

  	def show
  	end

  	def create
	    @cerveza = Cerveza.new(cerveza_params)

	    respond_to do |format|
	      if @cerveza.save
	        format.html { redirect_to @cerveza, notice: 'Cerveza was successfully created.' }
	        format.json { render :show, status: :created, location: @cerveza }
	      else
	        format.html { render :new }
	        format.json { render json: @cerveza.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_cerveza
	      @cerveza = Cerveza.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def cerveza_params
	      params.require(:cerveza).permit(:name, :brand, :photo)
	    end
end
