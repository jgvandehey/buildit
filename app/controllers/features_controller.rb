class FeaturesController < ApplicationController
  # GET /features
  # GET /features.json
  def index
    # @features = Feature.all
    @features = Feature.find_with_reputation(:votes, :all, order: 'votes desc')
    @features_days = Feature.find_with_reputation(:votes, :all, order: 'votes desc').group_by { |f| f.created_at.beginning_of_day }
    # @features_days = @features.group_by { |f| f.created_at.time }
    # @features = Feature.group_by{ |feature| feature.created_at.to_date }
    # @features = Feature.group_by_day(:created_at).count
    # @features = Feature.order("DATE(start_at)").group("DATE(start_at)").count
    # @features_by_date = Feature.group_by_day(:created_at).reverse_order.count

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @features }
    end
  end

  # GET /features/1
  # GET /features/1.json
  def show
    @feature = Feature.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feature }
    end
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @feature = Feature.find(params[:id])
    @feature.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting!"
  end

  # GET /features/new
  # GET /features/new.json
  def new
    @feature = current_user.features.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feature }
    end
  end

  # GET /features/1/edit
  def edit
    @feature = current_user.features.find(params[:id])
  end

  # POST /features
  # POST /features.json
  def create
    @feature = current_user.features.new(params[:feature])

    respond_to do |format|
      if @feature.save
        format.html { redirect_to @feature, notice: 'Feature was successfully created.' }
        format.json { render json: @feature, status: :created, location: @feature }
      else
        format.html { render action: "new" }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /features/1
  # PUT /features/1.json
  def update
    @feature = current_user.features.find(params[:id])

    respond_to do |format|
      if @feature.update_attributes(params[:feature])
        format.html { redirect_to @feature, notice: 'Feature was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /features/1
  # DELETE /features/1.json
  def destroy
    @feature = current_user.features.find(params[:id])
    @feature.destroy

    respond_to do |format|
      format.html { redirect_to features_url }
      format.json { head :no_content }
    end
  end
end
