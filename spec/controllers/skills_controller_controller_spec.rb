require 'spec_helper'

describe SkillsController do

  before do
    @skill = create :skill
  end

  let(:valid_attributes) { { name: 'Test' } }
  let(:invalid_attributes) { {name: nil} }

  describe 'GET index' do
    it 'assigns all skills as @skills' do
      get :index, {}
      expect(assigns(:skills)).to match_array(@skill)
    end
  end

  describe "GET show" do
    it "assigns the requested skill as @skill" do
      get :show, {:id => @skill.to_param}
      expect(assigns(:skill)).to eq(@skill)
    end
  end

  describe "GET new" do
    it "assigns a new skill as @skill" do
      get :new, {}
      expect(assigns(:skill)).to be_a_new(Skill)
    end
  end

  describe "GET edit" do
    it "assigns the requested skill as @skill" do
      get :edit, {:id => @skill.to_param}
      expect(assigns(:skill)).to eq(@skill)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Skill" do
        expect {
          post :create, {:skill => valid_attributes}
        }.to change(Skill, :count).by(1)
      end

      it "assigns a newly created skill as @skill" do
        post :create, {:skill => valid_attributes}
        expect(assigns(:skill)).to be_a(Skill)
        expect(assigns(:skill)).to be_persisted
      end

      it "redirects to the skills list" do
        post :create, {:skill => valid_attributes}
        expect(response).to redirect_to(skill_url(assigns(:skill)))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved skill as @skill" do
        post :create, {:skill => invalid_attributes}
        expect(assigns(:skill)).to be_a_new(Skill)
      end

      it "re-renders the 'new' template" do
        post :create, {:skill => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        FactoryGirl.build(:skill).attributes.slice(*%w[name]).symbolize_keys
      }

      it "updates the requested skill" do
        put :update, {:id => @skill.to_param, :skill => new_attributes}
        @skill.reload
        expect(@skill.name).to eq new_attributes[:name]
      end

      it "assigns the requested skill as @skill" do
        put :update, {:id => @skill.to_param, :skill => valid_attributes}
        expect(assigns(:skill)).to eq(@skill)
      end

      it "redirects to the skill" do
        put :update, {:id => @skill.to_param, :skill => valid_attributes}
        expect(response).to redirect_to(@skill)
      end
    end

    describe "with invalid params" do
      it "assigns the skill as @skill" do
        put :update, {:id => @skill.to_param, :skill => invalid_attributes}
        expect(assigns(:skill)).to eq(@skill)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => @skill.to_param, :skill => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested skill" do
      expect {
        delete :destroy, {:id => @skill.to_param}
      }.to change(Skill, :count).by(-1)
    end

    it "redirects to the skill list" do
      delete :destroy, {:id => @skill.to_param}
      expect(response).to redirect_to(skills_url)
    end
  end

end
