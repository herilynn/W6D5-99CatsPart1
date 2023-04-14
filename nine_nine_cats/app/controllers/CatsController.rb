class CatsController < ApplicationController

    def index
        @cats = Cat.all
        render :index
    end


    def create
        @cats = Cat.new(cats_params)
        if  @cats.save
            redirect_to cats_url
        else
            render json: @cats.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
            @cats = Cat.find(params[:id])
            render :show
    end

    def update
        @cats = Cat.find(params[:id])
        if @cats.update(cat_params)
            redirect_to cat_url(@cats)
        else
            render json: @cats.errors.full_messages, status: 422
        end
    end

    private
    def cats_params
    params.require(:cats).permit(:birth_date, :color, :name, :sex)
    end
end
