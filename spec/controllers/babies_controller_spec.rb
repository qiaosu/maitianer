require 'spec_helper'



describe BabiesController do

  describe "GET show" do
    it "assigns the requested baby as @baby" do
      baby = Baby.create! valid_attributes
      get :show, :id => baby.id.to_s
      assigns(:baby).should eq(baby)
    end
  end

  describe "GET new" do
    it "assigns a new baby as @baby" do
      get :new
      assigns(:baby).should be_a_new(Baby)
    end
  end

  describe "GET edit" do
    it "assigns the requested baby as @baby" do
      baby = Baby.create! valid_attributes
      get :edit, :id => baby.id.to_s
      assigns(:baby).should eq(baby)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Baby" do
        expect {
          post :create, :baby => valid_attributes
        }.to change(Baby, :count).by(1)
      end

      it "assigns a newly created baby as @baby" do
        post :create, :baby => valid_attributes
        assigns(:baby).should be_a(Baby)
        assigns(:baby).should be_persisted
      end

      it "redirects to the created baby" do
        post :create, :baby => valid_attributes
        response.should redirect_to(Baby.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved baby as @baby" do
        # Trigger the behavior that occurs when invalid params are submitted
        Baby.any_instance.stub(:save).and_return(false)
        post :create, :baby => {}
        assigns(:baby).should be_a_new(Baby)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Baby.any_instance.stub(:save).and_return(false)
        post :create, :baby => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested baby" do
        baby = Baby.create! valid_attributes
        # Assuming there are no other babies in the database, this
        # specifies that the Baby created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Baby.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => baby.id, :baby => {'these' => 'params'}
      end

      it "assigns the requested baby as @baby" do
        baby = Baby.create! valid_attributes
        put :update, :id => baby.id, :baby => valid_attributes
        assigns(:baby).should eq(baby)
      end

      it "redirects to the baby" do
        baby = Baby.create! valid_attributes
        put :update, :id => baby.id, :baby => valid_attributes
        response.should redirect_to(baby)
      end
    end

    describe "with invalid params" do
      it "assigns the baby as @baby" do
        baby = Baby.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Baby.any_instance.stub(:save).and_return(false)
        put :update, :id => baby.id.to_s, :baby => {}
        assigns(:baby).should eq(baby)
      end

      it "re-renders the 'edit' template" do
        baby = Baby.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Baby.any_instance.stub(:save).and_return(false)
        put :update, :id => baby.id.to_s, :baby => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested baby" do
      baby = Baby.create! valid_attributes
      expect {
        delete :destroy, :id => baby.id.to_s
      }.to change(Baby, :count).by(-1)
    end

    it "redirects to the babies list" do
      baby = Baby.create! valid_attributes
      delete :destroy, :id => baby.id.to_s
      response.should redirect_to(babies_url)
    end
  end

end
