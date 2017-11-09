class GossipsController < ApplicationController
  before_action :set_gossip, only: [:show, :edit, :update, :destroy]

  # GET /gossips
  # GET /gossips.json
  def index
    @gossips = Gossip.all
  end

  # GET /gossips/1
  # GET /gossips/1.json
  def show
  end

  # GET /gossips/new
  def new
    @gossip = current_moussaillon.gossips.build
  end

  # GET /gossips/1/edit
  def edit
  end

  # POST /gossips
  # POST /gossips.json
  def create
    @gossip = current_moussaillon.gossips.build(gossip_params)
    
    respond_to do |format|
      if @gossip.save
        cookies[current_moussaillon.email.to_s] = params[:anonymous_username]

        format.html { redirect_to @gossip, notice: 'Gossip was successfully created.' }
        format.json { render :show, status: :created, location: @gossip }
      else
        format.html { render :new }
        format.json { render json: @gossip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gossips/1
  # PATCH/PUT /gossips/1.json
  def update
    respond_to do |format|
      if @gossip.update(gossip_params)
        format.html { redirect_to @gossip, notice: 'Gossip was successfully updated.' }
        format.json { render :show, status: :ok, location: @gossip }
      else
        format.html { render :edit }
        format.json { render json: @gossip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gossips/1
  # DELETE /gossips/1.json
  def destroy
    @gossip.destroy
    respond_to do |format|
      format.html { redirect_to gossips_url, notice: 'Gossip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gossip
      @gossip = Gossip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gossip_params
      params.require(:gossip).permit(:content)
    end
end
