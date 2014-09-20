class ContactsController < ApplicationController
  include SessionsHelper

  def index
    # @contacts = current_user.contacts
    @contacts, @alphaParams = current_user.contacts.alpha_paginate(params[:letter], {:bootstrap3 => true}){|contact| contact.name}
  end

  def show
    theContact = Contact.find(params[:id])

    if (theContact.user_id == current_user.id)
      @contact = Contact.find(params[:id])
    else
      redirect_to contacts_url
    end
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id

    @contact.save

    if @contact.save
      flash[:success] = "Contact created!"
      redirect_to contact_path(@contact)
    else
      render 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update(contact_params)
      flash[:success] = "Contact updated"
      redirect_to @contact
    else
      render 'edit'
    end
  end

  def destroy
    Contact.find(params[:id]).destroy
    flash[:success] = "Contact deleted"
    redirect_to contacts_url
  end

  private
  
    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :notes)
    end
end