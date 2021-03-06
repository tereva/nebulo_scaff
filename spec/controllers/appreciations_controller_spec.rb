require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe AppreciationsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Appreciation. As you add validations to Appreciation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AppreciationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all appreciations as @appreciations" do
      appreciation = Appreciation.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:appreciations)).to eq([appreciation])
    end
  end

  describe "GET #show" do
    it "assigns the requested appreciation as @appreciation" do
      appreciation = Appreciation.create! valid_attributes
      get :show, {:id => appreciation.to_param}, valid_session
      expect(assigns(:appreciation)).to eq(appreciation)
    end
  end

  describe "GET #new" do
    it "assigns a new appreciation as @appreciation" do
      get :new, {}, valid_session
      expect(assigns(:appreciation)).to be_a_new(Appreciation)
    end
  end

  describe "GET #edit" do
    it "assigns the requested appreciation as @appreciation" do
      appreciation = Appreciation.create! valid_attributes
      get :edit, {:id => appreciation.to_param}, valid_session
      expect(assigns(:appreciation)).to eq(appreciation)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Appreciation" do
        expect {
          post :create, {:appreciation => valid_attributes}, valid_session
        }.to change(Appreciation, :count).by(1)
      end

      it "assigns a newly created appreciation as @appreciation" do
        post :create, {:appreciation => valid_attributes}, valid_session
        expect(assigns(:appreciation)).to be_a(Appreciation)
        expect(assigns(:appreciation)).to be_persisted
      end

      it "redirects to the created appreciation" do
        post :create, {:appreciation => valid_attributes}, valid_session
        expect(response).to redirect_to(Appreciation.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved appreciation as @appreciation" do
        post :create, {:appreciation => invalid_attributes}, valid_session
        expect(assigns(:appreciation)).to be_a_new(Appreciation)
      end

      it "re-renders the 'new' template" do
        post :create, {:appreciation => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested appreciation" do
        appreciation = Appreciation.create! valid_attributes
        put :update, {:id => appreciation.to_param, :appreciation => new_attributes}, valid_session
        appreciation.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested appreciation as @appreciation" do
        appreciation = Appreciation.create! valid_attributes
        put :update, {:id => appreciation.to_param, :appreciation => valid_attributes}, valid_session
        expect(assigns(:appreciation)).to eq(appreciation)
      end

      it "redirects to the appreciation" do
        appreciation = Appreciation.create! valid_attributes
        put :update, {:id => appreciation.to_param, :appreciation => valid_attributes}, valid_session
        expect(response).to redirect_to(appreciation)
      end
    end

    context "with invalid params" do
      it "assigns the appreciation as @appreciation" do
        appreciation = Appreciation.create! valid_attributes
        put :update, {:id => appreciation.to_param, :appreciation => invalid_attributes}, valid_session
        expect(assigns(:appreciation)).to eq(appreciation)
      end

      it "re-renders the 'edit' template" do
        appreciation = Appreciation.create! valid_attributes
        put :update, {:id => appreciation.to_param, :appreciation => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested appreciation" do
      appreciation = Appreciation.create! valid_attributes
      expect {
        delete :destroy, {:id => appreciation.to_param}, valid_session
      }.to change(Appreciation, :count).by(-1)
    end

    it "redirects to the appreciations list" do
      appreciation = Appreciation.create! valid_attributes
      delete :destroy, {:id => appreciation.to_param}, valid_session
      expect(response).to redirect_to(appreciations_url)
    end
  end

end
