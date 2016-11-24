class TenantsController < ApplicationController
  def index
    @tenants = Tenant.page(params[:page]).per(10)

    render("tenants/index.html.erb")
  end

  def show
    @lease = Lease.new
    @event = Event.new
    @tenant = Tenant.find(params[:id])

    render("tenants/show.html.erb")
  end

  def new
    @tenant = Tenant.new

    render("tenants/new.html.erb")
  end

  def create
    @tenant = Tenant.new

    @tenant.tenant_name = params[:tenant_name]

    save_status = @tenant.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tenants/new", "/create_tenant"
        redirect_to("/tenants")
      else
        redirect_back(:fallback_location => "/", :notice => "Tenant created successfully.")
      end
    else
      render("tenants/new.html.erb")
    end
  end

  def edit
    @tenant = Tenant.find(params[:id])

    render("tenants/edit.html.erb")
  end

  def update
    @tenant = Tenant.find(params[:id])

    @tenant.tenant_name = params[:tenant_name]

    save_status = @tenant.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tenants/#{@tenant.id}/edit", "/update_tenant"
        redirect_to("/tenants/#{@tenant.id}", :notice => "Tenant updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Tenant updated successfully.")
      end
    else
      render("tenants/edit.html.erb")
    end
  end

  def destroy
    @tenant = Tenant.find(params[:id])

    @tenant.destroy

    if URI(request.referer).path == "/tenants/#{@tenant.id}"
      redirect_to("/", :notice => "Tenant deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Tenant deleted.")
    end
  end
end
