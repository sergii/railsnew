class GeneratorOptionsController < ApplicationController
  before_action :set_generator_option, only: %i[ show edit update destroy ]

  # GET /generator_options or /generator_options.json
  def index
    @generator_options = GeneratorOption.all
  end

  # GET /generator_options/1 or /generator_options/1.json
  def show
  end

  # GET /generator_options/new
  def new
    @generator_option = GeneratorOption.new
  end

  # GET /generator_options/1/edit
  def edit
  end

  # POST /generator_options or /generator_options.json
  def create
    @generator_option = GeneratorOption.new(generator_option_params)

    respond_to do |format|
      if @generator_option.save
        format.html { redirect_to @generator_option, notice: "Generator option was successfully created." }
        format.json { render :show, status: :created, location: @generator_option }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @generator_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /generator_options/1 or /generator_options/1.json
  def update
    respond_to do |format|
      if @generator_option.update(generator_option_params)
        format.html { redirect_to @generator_option, notice: "Generator option was successfully updated." }
        format.json { render :show, status: :ok, location: @generator_option }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @generator_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generator_options/1 or /generator_options/1.json
  def destroy
    @generator_option.destroy!

    respond_to do |format|
      format.html { redirect_to generator_options_path, status: :see_other, notice: "Generator option was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_generator_option
      @generator_option = GeneratorOption.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def generator_option_params
      params.expect(generator_option: [ :name, :slug, :options, :template_id ])
    end
end
