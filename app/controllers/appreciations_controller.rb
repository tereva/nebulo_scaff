class AppreciationsController < ApplicationController
  before_action :set_appreciation, only: [:show, :edit, :update, :destroy]

  # GET /appreciations
  # GET /appreciations.json
  def index
    @appreciations = Appreciation.all
  end

  # GET /appreciations/1
  # GET /appreciations/1.json
  def show
  end

  # GET /appreciations/new
  def new
    @appreciation = Appreciation.new
  end

  # GET /appreciations/1/edit
  def edit
  end

  # POST /appreciations
  # POST /appreciations.json
  def create
    @appreciation = Appreciation.new(appreciation_params)

    respond_to do |format|
      if @appreciation.save 
         @appreciation.parse
        
        format.html { redirect_to @appreciation, notice: 'Appreciation was successfully created.' }
        format.json { render :show, status: :created, location: @appreciation }
      else
        format.html { render :new }
        format.json { render json: @appreciation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appreciations/1
  # PATCH/PUT /appreciations/1.json
  def update
    respond_to do |format|
      if @appreciation.update(appreciation_params)
        format.html { redirect_to @appreciation, notice: 'Appreciation was successfully updated.' }
        format.json { render :show, status: :ok, location: @appreciation }
      else
        format.html { render :edit }
        format.json { render json: @appreciation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appreciations/1
  # DELETE /appreciations/1.json
  def destroy
    @appreciation.destroy
    respond_to do |format|
      format.html { redirect_to appreciations_url, notice: 'Appreciation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def selectCat
    if params[:cat]
      if params[:cat]=="" # ttes les cat
        @cat = 'all'
        @keyword_list = Keyword.all 
      else
        @categorie = Category.find(params[:cat])
        @keyword_list = Keyword.where(:id => @categorie.list_keyword_ids)
        @cat = params[:cat]
      end
      render 'search'
    end
  end

  def search

    if params[:kw1].present? && params[:kw2].present?
      kw1_id = Keyword.find(params[:kw1]).appreciation_ids
      kw2_id = Keyword.find(params[:kw2]).appreciation_ids
      @mot1 = Keyword.find(params[:kw1]).word
      @mot2 = Keyword.find(params[:kw2]).word
      if params[:cat] =='all'
          @cat= 'all'
          @keyword_list = Keyword.all
          @cat_name = 'Toutes les catégories'
          @appreciations_OR = Appreciation.where(:id =>  kw1_id + kw2_id)
          @appreciations_AND = Appreciation.where(:id =>  kw1_id & kw2_id)
      else 
          @categorie = Category.find(params[:cat])
          @cat = @categorie.id
          @cat_name = @categorie.title
          @keyword_list = Keyword.where(:id => @categorie.list_keyword_ids)
          @appreciations_OR = Appreciation.where(category: params[:cat], :id =>  kw1_id + kw2_id)
          @appreciations_AND = Appreciation.where(category: params[:cat], :id =>  kw1_id & kw2_id)
      
      end
    else
      flash.now[:danger] = "Vous devez selectionner deux mots clés"
      render 'selectCat'

    end
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appreciation
      @appreciation = Appreciation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appreciation_params
      params.require(:appreciation).permit(:content, :remark, :category_id)
    end
end
