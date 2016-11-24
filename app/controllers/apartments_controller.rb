class ApartmentsController < ApplicationController
  def index
    @q = Apartment.ransack(params[:q])
    @apartments = @q.result(:distinct => true).includes(:dates, :leases).page(params[:page]).per(10)

    render("apartments/index.html.erb")
  end

  def show
    @lease = Lease.new
    @event = Event.new
    @apartment = Apartment.find(params[:id])

    render("apartments/show.html.erb")
  end

  def new
    @apartment = Apartment.new

    render("apartments/new.html.erb")
  end

  def create
    @apartment = Apartment.new

    @apartment.apartment_name = params[:apartment_name]
    @apartment.address = params[:address]
    @apartment.city = params[:city]
    @apartment.state = params[:state]
    @apartment.zip = params[:zip]
    @apartment.bedrooms = params[:bedrooms]
    @apartment.bathrooms = params[:bathrooms]

    save_status = @apartment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/apartments/new", "/create_apartment"
        redirect_to("/apartments")
      else
        redirect_back(:fallback_location => "/", :notice => "Apartment created successfully.")
      end
    else
      render("apartments/new.html.erb")
    end
  end

  def edit
    @apartment = Apartment.find(params[:id])

    render("apartments/edit.html.erb")
  end

  def update
    @apartment = Apartment.find(params[:id])

    @apartment.apartment_name = params[:apartment_name]
    @apartment.address = params[:address]
    @apartment.city = params[:city]
    @apartment.state = params[:state]
    @apartment.zip = params[:zip]
    @apartment.bedrooms = params[:bedrooms]
    @apartment.bathrooms = params[:bathrooms]

    save_status = @apartment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/apartments/#{@apartment.id}/edit", "/update_apartment"
        redirect_to("/apartments/#{@apartment.id}", :notice => "Apartment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Apartment updated successfully.")
      end
    else
      render("apartments/edit.html.erb")
    end
  end

  def destroy
    @apartment = Apartment.find(params[:id])

    @apartment.destroy

    if URI(request.referer).path == "/apartments/#{@apartment.id}"
      redirect_to("/", :notice => "Apartment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Apartment deleted.")
    end
  end
end
