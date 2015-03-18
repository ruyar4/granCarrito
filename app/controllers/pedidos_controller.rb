class PedidosController < ApplicationController
	def index
		if user_signed_in?
			@pedidos = current_user.pedidos
		end
		#@cervezas = Cerveza.find(params[@pedidos.cerveza_id])
	end

	def new
	    @cerveza = Cerveza.find(params[:cerveza_id])
	    Pedido.create(cerveza:@cerveza, user:current_user)
	    redirect_to cervezas_path
  	end

  	def destroy
	    @pedido = Pedido.find(params[:id])
	    @pedido.destroy
	    redirect_to cervezas_path
  	end
end
