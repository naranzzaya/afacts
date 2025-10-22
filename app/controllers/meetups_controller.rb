class MeetupsController < ApplicationController
  before_action :set_meetup, only: %i[ show edit update destroy ]

  # GET /meetups
  def index
    @meetups = Meetup.all
  end

  # GET /meetups/1
  def show
  end

  # GET /meetups/new
  def new
    @meetup = Meetup.new
  end

  # GET /meetups/1/edit
  def edit
  end

  # POST /meetups
  def create
    @meetup = Meetup.new(meetup_params)

    if @meetup.save
      redirect_to @meetup, notice: "Meetup was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /meetups/1
  def update
    if @meetup.update(meetup_params)
      redirect_to @meetup, notice: "Meetup was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /meetups/1
  def destroy
    @meetup.destroy!
    redirect_to meetups_path, notice: "Meetup was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meetup
      @meetup = Meetup.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def meetup_params
      params.expect(meetup: [ :title, :description, :starts_at, :ends_at, :stream_url, :status ])
    end
end
