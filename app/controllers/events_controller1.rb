class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    @q = Event.ransack(params[:q])


    render("events/index.html.erb")
  end

  def show
    @event = Event.find(params[:id])

    render("events/show.html.erb")
  end

  def new
    @event = Event.new

    render("events/new.html.erb")
  end

  # POST /events
  # POST /events.json
  def create

      # @event = Event.new(event_params)
      #
      # respond_to do |format|
      #   if @event.save
      #     format.html { redirect_to @event, notice: 'Event was successfully created.' }
      #     format.json { render action: 'show', status: :created, location: @event }
      #   else
      #     format.html { render action: 'new' }
      #     format.json { render json: @event.errors, status: :unprocessable_entity }
      #   end
      # end

    @event = Event.new

    @event.day_of_week = params[:day_of_week]
    @event.apartment_id = params[:apartment_id]
    @event.tenant_id = params[:tenant_id]
    @event.status_id = params[:status_id]
    @event.lease_id = params[:lease_id]
    @event.title = params[:title]
    @event.description = params[:description]
    @event.start_time = params[:start_time]
    @event.end_time = params[:end_time]
    @event.resourceId = params[:resourceId]

    save_status = @event.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/events/new", "/create_event"
        redirect_to("/events")
      else
        redirect_back(:fallback_location => "/", :notice => "Event created successfully.")
      end
    else
      render("events/new.html.erb")
    end
  end

  def edit
    @event = Event.find(params[:id])

    render("events/edit.html.erb")
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
    # @event = Event.find(params[:id])
    #
    # @event.day_of_week = params[:day_of_week]
    # @event.apartment_id = params[:apartment_id]
    # @event.tenant_id = params[:tenant_id]
    # @event.status_id = params[:status_id]
    # @event.lease_id = params[:lease_id]
    # @event.title = params[:title]
    # @event.description = params[:description]
    # @event.start_time = params[:start_time]
    # @event.end_time = params[:end_time]
    # @event.resourceId = params[:resourceId]
    #
    # save_status = @event.save
    #
    # if save_status == true
    #   referer = URI(request.referer).path
    #
    #   case referer
    #   when "/events/#{@event.id}/edit", "/update_event"
    #     redirect_to("/events/#{@event.id}", :notice => "Event updated successfully.")
    #   else
    #     redirect_back(:fallback_location => "/", :notice => "Event updated successfully.")
    #   end
    # else
    #   render("events/edit.html.erb")
    # end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy

    if URI(request.referer).path == "/events/#{@event.id}"
      redirect_to("/", :notice => "Event deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Event deleted.")
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :start_time, :end_time, :resourceId)
    end

end
