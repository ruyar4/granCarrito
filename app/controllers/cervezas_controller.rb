class CervezasController < ApplicationController

	  def index
	    #@cervezas = Cerveza.all
    	if user_signed_in?
      		@mis_pedidos = current_user.pedidos
    	end
      if !(params[:searchbox])
        @cervezas = Cerveza.all
      else
    	   @cervezas = Cerveza.search_name(params[:searchbox])
      end
    end

  	def show
  	end

  	def new
  		@cerveza = Cerveza.new
  	end

  	def create
	    @cerveza = Cerveza.new(cerveza_params)
	    @cerveza.user_id = current_user.id
	    @cerveza.save
	    redirect_to cervezas_path
  	end

  	def destroy
  		@cerveza = set_cerveza
	    @cerveza.destroy
	    redirect_to cervezas_path
  	end

  	#def search
  	#	results = PgSearch.multisearch()
  	#end

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
