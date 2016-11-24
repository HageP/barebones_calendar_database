class LeasesController < ApplicationController
  def index
    @leases = Lease.all

    render("leases/index.html.erb")
  end

  def show
    @event = Event.new
    @lease = Lease.find(params[:id])

    render("leases/show.html.erb")
  end

  def new
    @lease = Lease.new

    render("leases/new.html.erb")
  end

  def create
    @lease = Lease.new

    @lease.lease_start = params[:lease_start]
    @lease.lease_end = params[:lease_end]
    @lease.tenant_id = params[:tenant_id]
    @lease.apartment_id = params[:apartment_id]

    save_status = @lease.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/leases/new", "/create_lease"
        redirect_to("/leases")
      else
        redirect_back(:fallback_location => "/", :notice => "Lease created successfully.")
      end
    else
      render("leases/new.html.erb")
    end
  end

  def edit
    @lease = Lease.find(params[:id])

    render("leases/edit.html.erb")
  end

  def update
    @lease = Lease.find(params[:id])

    @lease.lease_start = params[:lease_start]
    @lease.lease_end = params[:lease_end]
    @lease.tenant_id = params[:tenant_id]
    @lease.apartment_id = params[:apartment_id]

    save_status = @lease.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/leases/#{@lease.id}/edit", "/update_lease"
        redirect_to("/leases/#{@lease.id}", :notice => "Lease updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Lease updated successfully.")
      end
    else
      render("leases/edit.html.erb")
    end
  end

  def destroy
    @lease = Lease.find(params[:id])

    @lease.destroy

    if URI(request.referer).path == "/leases/#{@lease.id}"
      redirect_to("/", :notice => "Lease deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Lease deleted.")
    end
  end
end
