require 'spec_helper'

describe VacanciesController do

  before do
    @vacancy = create :vacancy
  end

  let(:new_vacancy) { build :vacancy }
  let(:valid_attributes) { new_vacancy.attributes.except("id") }
  let(:invalid_attributes) { {name: nil} }

  describe 'GET index' do
    it 'assigns all vacancies as @vacancies' do
      get :index, {}
      expect(assigns(:vacancies)).to match_array(@vacancy)
    end
  end

  describe "GET show" do
    it "assigns the requested vacancy as @vacancy" do
      get :show, {:id => @vacancy.to_param}
      expect(assigns(:vacancy)).to eq(@vacancy)
    end
  end

  describe "GET new" do
    it "assigns a new vacancy as @vacancy" do
      get :new, {}
      expect(assigns(:vacancy)).to be_a_new(Vacancy)
    end
  end

  describe "GET edit" do
    it "assigns the requested vacancy as @vacancy" do
      get :edit, {:id => @vacancy.to_param}
      expect(assigns(:vacancy)).to eq(@vacancy)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Vacancy" do
        expect {
          post :create, {:vacancy => valid_attributes}
        }.to change(Vacancy, :count).by(1)
      end

      it "assigns a newly created vacancy as @vacancy" do
        post :create, {:vacancy => valid_attributes}
        expect(assigns(:vacancy)).to be_a(Vacancy)
        expect(assigns(:vacancy)).to be_persisted
      end

      it "redirects to the vacancies list" do
        post :create, {:vacancy => valid_attributes}
        expect(response).to redirect_to(vacancy_url(assigns(:vacancy)))
      end

      it "assigns skill" do
        post :create, {:vacancy => valid_attributes, skill_attributes: ['test']}
        expect(assigns(:vacancy).skills.count).to eq 1
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vacancy as @vacancy" do
        post :create, {:vacancy => invalid_attributes}
        expect(assigns(:vacancy)).to be_a_new(Vacancy)
      end

      it "re-renders the 'new' template" do
        post :create, {:vacancy => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        FactoryGirl.build(:vacancy).attributes.slice(*%w[name]).symbolize_keys
      }

      it "updates the requested vacancy" do
        put :update, {:id => @vacancy.to_param, :vacancy => new_attributes}
        @vacancy.reload
        expect(@vacancy.name).to eq new_attributes[:name]
      end

      it "assigns the requested vacancy as @vacancy" do
        put :update, {:id => @vacancy.to_param, :vacancy => valid_attributes}
        expect(assigns(:vacancy)).to eq(@vacancy)
      end

      it "redirects to the vacancy" do
        put :update, {:id => @vacancy.to_param, :vacancy => valid_attributes}
        expect(response).to redirect_to(@vacancy)
      end

      it "assigns skill" do
        post :create, {:vacancy => valid_attributes, skill_attributes: ['test']}
        expect(assigns(:vacancy).skills.count).to eq 1
      end
    end

    describe "with invalid params" do
      it "assigns the vacancy as @vacancy" do
        put :update, {:id => @vacancy.to_param, :vacancy => invalid_attributes}
        expect(assigns(:vacancy)).to eq(@vacancy)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => @vacancy.to_param, :vacancy => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vacancy" do
      expect {
        delete :destroy, {:id => @vacancy.to_param}
      }.to change(Vacancy, :count).by(-1)
    end

    it "redirects to the vacancy list" do
      delete :destroy, {:id => @vacancy.to_param}
      expect(response).to redirect_to(vacancies_url)
    end
  end

end
