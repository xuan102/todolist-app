class EmailController < ApplicationController
    def index
        @email = Email.all
    end

    def show
        @email = Email.find(params[:id])
        respond_to do |format|
            format.html { redirect_to root_path }
            format.js {}
        end        
    end 
    def create
        @email = Email.new(object: Faker::Book.title, body:Faker::Lorem.paragraph)

        if @email.save
            respond_to do |format|
                format.html { redirect_to root_path}
                format.js {}
            end
        else
            redirect_to root_path, flash: {error: "Email non cree"}
        end
    end

    def update
    end
    
end
