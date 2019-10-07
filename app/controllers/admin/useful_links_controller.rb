class Admin::UsefulLinksController < AdminController

  def index
    load_useful_links
  end

  def show
    load_useful_link
  end

  def new
    build_useful_link
  end

  def create
    build_useful_link
    create_useful_link or render :new
  end

  def edit
    load_useful_link
  end

  def update
    load_useful_link
    update_useful_link or render :edit
  end

  def destroy
    load_useful_link
    destroy_useful_link
  end

  private

  def destroy_useful_link
    @useful_link.destroy
    redirect_to admin_useful_links_path, notice: "UsefulLink successfully deleted."
  end

  def create_useful_link
    @useful_link = UsefulLink.new(useful_link_params)
    if @useful_link.save
      redirect_to admin_useful_links_path, notice: "UsefulLink has been created"
    else
      render :new
    end
  end

  def update_useful_link
    if @useful_link.update_attributes(useful_link_params)
      redirect_to admin_useful_link_path, notice: "useful_link successfully updated."
    else
      false
    end
  end

  def build_useful_link
    @useful_link = UsefulLink.new(useful_link_params)
  end

  def load_useful_links
    @useful_links = UsefulLink.all.page(params[:page])
  end

  def load_useful_link
    @useful_link = UsefulLink.find(params[:id])
  end

  def useful_link_params
    return {} unless params[:useful_link]

    params.require(:useful_link)
      .permit(:url, :description, :processed)
  end

end
