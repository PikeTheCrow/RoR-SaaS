class ContactsController < ApplicationController
  def new
    @contact = Contact.new # define contacts varibale
  end

  def create
  end
end
