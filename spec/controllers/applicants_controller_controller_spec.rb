require 'spec_helper'

describe ApplicantsController do

  before do
    @applicant = create :applicant
  end

  let(:new_applicant) { build :applicant }
  let(:valid_attributes) { new_applicant.attributes.except("id") }
  let(:invalid_attributes) { {name: nil} }

  describe 'GET index' do
    it 'assigns all applicants as @applicants' do
      get :index, {}
      expect(assigns(:applicants)).to match_array(@applicant)
    end
  end

  describe "GET show" do
    it "assigns the requested applicant as @applicant" do
      get :show, {:id => @applicant.to_param}
      expect(assigns(:applicant)).to eq(@applicant)
    end
  end

  describe "GET preview" do
    it "assigns the requested applicant as @applicant" do
      get :preview, {:id => @applicant.to_param}
      expect(assigns(:applicant)).to eq(@applicant)
      expect(assigns(:vacancies)).not_to be_nil
    end

    it "renders the 'preview' template" do
      get :preview, {:id => @applicant.to_param}
      expect(response).to render_template("preview")
    end
  end

  describe "GET new" do
    it "assigns a new applicant as @applicant" do
      get :new, {}
      expect(assigns(:applicant)).to be_a_new(Applicant)
    end
  end

  describe "GET edit" do
    it "assigns the requested applicant as @applicant" do
      get :edit, {:id => @applicant.to_param}
      expect(assigns(:applicant)).to eq(@applicant)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Applicant" do
        expect {
          post :create, {:applicant => valid_attributes}
        }.to change(Applicant, :count).by(1)
      end

      it "assigns a newly created applicant as @applicant" do
        post :create, {:applicant => valid_attributes}
        expect(assigns(:applicant)).to be_a(Applicant)
        expect(assigns(:applicant)).to be_persisted
      end

      it "redirects to the applicants list" do
        post :create, {:applicant => valid_attributes}
        expect(response).to redirect_to(applicant_url(assigns(:applicant)))
      end

      it "assigns skill" do
        post :create, {:applicant => valid_attributes, skill_attributes: ['test']}
        expect(assigns(:applicant).skills.count).to eq 1
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved applicant as @applicant" do
        post :create, {:applicant => invalid_attributes}
        expect(assigns(:applicant)).to be_a_new(Applicant)
      end

      it "re-renders the 'new' template" do
        post :create, {:applicant => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        FactoryGirl.build(:applicant).attributes.slice(*%w[name]).symbolize_keys
      }

      it "updates the requested applicant" do
        put :update, {:id => @applicant.to_param, :applicant => new_attributes}
        @applicant.reload
        expect(@applicant.name).to eq new_attributes[:name]
      end

      it "assigns the requested applicant as @applicant" do
        put :update, {:id => @applicant.to_param, :applicant => valid_attributes}
        expect(assigns(:applicant)).to eq(@applicant)
      end

      it "redirects to the applicant" do
        put :update, {:id => @applicant.to_param, :applicant => valid_attributes}
        expect(response).to redirect_to(@applicant)
      end

      it "assigns skill" do
        post :create, {:applicant => valid_attributes, skill_attributes: ['test']}
        expect(assigns(:applicant).skills.count).to eq 1
      end
    end

    describe "with invalid params" do
      it "assigns the applicant as @applicant" do
        put :update, {:id => @applicant.to_param, :applicant => invalid_attributes}
        expect(assigns(:applicant)).to eq(@applicant)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => @applicant.to_param, :applicant => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested applicant" do
      expect {
        delete :destroy, {:id => @applicant.to_param}
      }.to change(Applicant, :count).by(-1)
    end

    it "redirects to the applicant list" do
      delete :destroy, {:id => @applicant.to_param}
      expect(response).to redirect_to(applicants_url)
    end
  end

end
