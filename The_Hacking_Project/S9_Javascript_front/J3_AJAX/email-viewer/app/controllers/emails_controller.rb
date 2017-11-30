class EmailsController < ApplicationController
  def new
  end

  def create
    @email = Email.new(email_params) #|| @email = User.new(email_params_bis)

    respond_to do |format|
      if @email.save
        format.html { redirect_to emails_url, notice: 'Email was successfully created.' }
        format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
     @email = Email.find(params[:id])
     @email.destroy

     respond_to do |format|
        format.html { redirect_to emails_url, notice: 'Email was successfully destroyed.' }
        format.json { head :no_content }
        format.js   { render :layout => false }
     end

  end

  def index
     @emails = Email.all
  end

  def show
  end
end

def email_params
      params.require(:emails).permit(:object, :body)
    end
