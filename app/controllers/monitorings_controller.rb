class MonitoringsController < ApplicationController
  before_action :set_monitoring, only: [:show, :edit, :update, :destroy]

  # GET /monitorings
  # GET /monitorings.json
  def index
    @monitorings = Monitoring.all
  end

  # GET /monitorings/1
  # GET /monitorings/1.json
  def show
    secret = Rails.application.secrets['secret_key_base']
    puts "Show: The secret is #{secret}"
    salt = @monitoring.salt
    puts "Show: The salt is #{@monitoring.salt}"
    key = ActiveSupport::KeyGenerator.new(secret).generate_key(salt)
    crypt = ActiveSupport::MessageEncryptor.new(key)
    decrypted_password = crypt.decrypt_and_verify(@monitoring.password)
    puts "Show: The decrypted password is #{decrypted_password}"
    doc = Nokogiri::HTML(open(@monitoring.url, :http_basic_authentication => [@monitoring.username, decrypted_password]))
    @state = "ok" if doc.xpath("//*[@class=\"serviceOK\"]").children.first.text.include?("OK")
  end

  # GET /monitorings/new
  def new
    @monitoring = Monitoring.new
    session[:service] = params[:service]
  end

  # GET /monitorings/1/edit
  def edit
  end

  # POST /monitorings
  # POST /monitorings.json
  def create
    respond_to do |format|
      if @monitoring.save
        update_service
        format.html { redirect_to @monitoring, notice: 'Monitoring was successfully created.' }
        format.json { render :show, status: :created, location: @monitoring }
      else
        format.html { render :new }
        format.json { render json: @monitoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monitorings/1
  # PATCH/PUT /monitorings/1.json
  def update
    @monitoring.salt = SecureRandom.urlsafe_base64
    secret = Rails.application.secrets['secret_key_base']
    key = ActiveSupport::KeyGenerator.new(secret).generate_key(@monitoring.salt)
    crypt = ActiveSupport::MessageEncryptor.new(key)
    cleartext_password = monitoring_params[:cleartext_password]
    @monitoring.password = crypt.encrypt_and_sign(cleartext_password)
    my_params = monitoring_params.except(:cleartext_password)
    respond_to do |format|
      if @monitoring.update(my_params)
        format.html { redirect_to @monitoring, notice: 'Monitoring was successfully updated.' }
        format.json { render :show, status: :ok, location: @monitoring }
      else
        format.html { render :edit }
        format.json { render json: @monitoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monitorings/1
  # DELETE /monitorings/1.json
  def destroy
    @monitoring.destroy
    respond_to do |format|
      format.html { redirect_to monitorings_url, notice: 'Monitoring was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def update_service
      service = Service.find(session[:service])
      service.monitoring= @monitoring
      service.save
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_monitoring
      @monitoring = Monitoring.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monitoring_params
      params.require(:monitoring).permit(:url, :service, :username, :cleartext_password)
    end
end
