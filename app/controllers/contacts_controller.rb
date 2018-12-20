class ContactsController < ApplicationController
  def index
    @contact = Contact.new
    @contacts = current_user.contacts.sort
  end

  def create
    @contact = Contact.new(create_contact_params)
    @contact.user = current_user
    if @contact.save
      # respond_to do |format|
      #   format.html {redirect_to contacts_path}
      #   format.js
      redirect_to contacts_index_path


    else
      # respond_to do |format|
      #   format.html {render :index}
      #   format.js
      @contacts = current_user.contacts
      render contacts_index_path


    end
  end

  def update
    @contact = Contact.find_by(user: current_user, id: params[:id])
    if @contact
      if @contact.update(update_contact_params)
        respond_to do |format|
          format.html { redirect_to contacts_path }
          format.js { head :ok }
        end
      else
        respond_to do |format|
          format.html { render :index }
          format.js { head :ok }
        end
      end
    end
  end

  def destroy
    @contact = Contact.find_by(user: current_user, id: params[:id])

    if @contact.destroy
      respond_to do |format|
        format.html { redirect_to contacts_path }
        format.js { head :ok }
      end
    else
      respond_to do |format|
        format.html { render :index }
        format.js { head :ok }
      end
    end
  end

  private

  def create_contact_params
    params.require(:contact).permit(:contact)
  end

   def update_contact_params
    params.require(:contact).permit(:share)
  end
end
