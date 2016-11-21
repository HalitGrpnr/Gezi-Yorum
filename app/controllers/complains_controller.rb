class ComplainsController < ApplicationController
  before_action :set_complain, only: [:show, :edit, :update, :destroy]

  # GET /complains
  # GET /complains.json
  def index
    @complains = Complain.all
  end

  # GET /complains/1
  # GET /complains/1.json
  def show
  end

  # GET /complains/new
  def new
    @complain = Complain.new
  end

  # GET /complains/1/edit
  def edit
  end

  # POST /complains
  # POST /complains.json
  def create
    @post = Post.find(params[:post_id])
    @complain = Complain.create(complain_params)
    @complain.user_id = current_user.id
    @complain.post_id = @post.id

    if @complain.save
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end

  # PATCH/PUT /complains/1
  # PATCH/PUT /complains/1.json
  def update
    respond_to do |format|
      if @complain.update(complain_params)
        format.html { redirect_to @complain, notice: 'Complain was successfully updated.' }
        format.json { render :show, status: :ok, location: @complain }
      else
        format.html { render :edit }
        format.json { render json: @complain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complains/1
  # DELETE /complains/1.json
  def destroy
    @complain.destroy
    respond_to do |format|
      format.html { redirect_to complains_url, notice: 'Complain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complain
      @complain = Complain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def complain_params
      params.require(:complain).permit(:user_id, :post_id, :content)
    end
end
