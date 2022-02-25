class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:new, :show, :destroy, :index]

  def index
    @microposts = Micropost.all.includes(:user)
  end

  def show; end

  def new; end

  def create
    @micropost = Micropost.new(micropost_params)

    if @micropost.save
      redirect_to @micropost, notice: 'micropost created'
    else
      # redirect to where micropost was created

      case params[:micropost][:created_at]
      when 'index' then redirect_to :microposts, alert: custom_alert(@micropost.errors) 
      when 'new' then render :new, status: :unprocessable_entity
      end
    end
  end

  def edit; end

  def update
    if @micropost.save 
      redirect_to @micropost, notice: 'micropost updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @micropost.destroy

    redirect_to microposts_url, notice: 'micropost destroyed'
  end

  private

  def set_micropost
    # set a new micropost if no params[:id]
    @micropost = params[:id] ? Micropost.find(params[:id]) : Micropost.new
  end

  def micropost_params
    params.require(:micropost).permit(:content, :user_id)
  end

  def custom_alert(errors)
    alert_value = "#{pluralize(errors.count, 'error')} prohibited this micropost from being saved"
    i = 0
    errors.each do |error|
      separator = i.zero? ? ': ' : ', '
      alert_value += separator + error.full_message
      i += 1
    end

    alert_value
  end

  # can't access pluralize in controller
  def pluralize(n, singular, plural=nil)
    if n == 1
        "1 #{singular}"
    elsif plural
        "#{n} #{plural}"
    else
        "#{n} #{singular}s"
    end
  end
end
