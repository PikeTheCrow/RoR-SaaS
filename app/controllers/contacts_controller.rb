class ContactsController < ApplicationController
  def new
    @contact = Contact.new # define contacts varibale
  end

  def create
    @contact = Contact.new(contact_params) # creates a blacnk contacts object

    if @contact.save
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]

      ContactMailer.contact_email(name, email, body).deliver
      
      flash[:success] = "Glad you want to Game"
      redirect_to new_contacts_path
    else
      flash[:danger] = "Fuck bro, something went wrong"
      redirect_to new_contacts_path
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end
