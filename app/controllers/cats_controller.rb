class CatsController < ApplicationController
    def index 
        @cats = Cat.all 
        render :index
    end

    def show 
        @cat = Cat.find_by(id: params[:id])
        if !@cat.nil?
            render :show
        else
            redirect_to '/cats'
        end
    end

    def new
        @cat = Cat.new
        render :new
    end

    def create 
        @cat = Cat.new(cat_params)
        if @cat.save!
            #show user the cat index
            redirect_to cat_url(@cat)
        else 
            #show success page
            render :new
        end
    end

    def edit 
        @cat = Cat.find_by(id: params[:id])
        render :edit
    end

    def update
        @cat = Cat.find_by(id: params[:id])
        if @cat.update_attributes(cat_params)
            redirect_to cats_url
        else 
            render :edit
        end
    end

    private 
    def cat_params 
        params.require(:cat).permit(:birth_date, :color, :name, :description, :sex)
    end

end