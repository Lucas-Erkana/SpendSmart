class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show edit update destroy]

  # GET /entities or /entities.json
  def index
    @entities = Entity.all
  end

  # GET /entities/1 or /entities/1.json
  def show; end

  # GET /entities/new
  def new
    @entity = Entity.new
    @categories = Category.where(author_id: current_user.id) || []
    @category_id = params[:category_id].to_i
  end

  # GET /entities/1/edit
  def edit; end

  # POST /entities or /entities.json
  def create
    category_ids = entity_params[:category_ids].reject(&:empty?).map(&:to_i)
    @entity = Entity.new(entity_params.except(:category_ids, :category_id))

    category_ids.each do |id|
      category = Category.find(id)
      category.entities << @entity
    end

    respond_to do |format|
      if @entity.save
        format.html do
          category_id = category_ids.first # Assuming the entity belongs to a single category
          redirect_to user_category_path(current_user, category_id), notice: 'Transaction was successfully created.'
        end
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entities/1 or /entities/1.json
  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to entity_url(@entity), notice: 'Entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1 or /entities/1.json
  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entity
    @entity = Entity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:name, :amount, :category_id, category_ids: []).merge(author_id: current_user.id)
  end
end
