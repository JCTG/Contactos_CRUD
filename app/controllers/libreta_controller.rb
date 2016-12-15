class LibretaController < ActionController::Base
  before_action :set_libretum, only: [:show, :edit, :update, :destroy]

  http_basic_authenticate_with :name => "rails", :password => "secret", :except => [:index, :show]


  # GET /libreta
  # GET /libreta.json
  def index
   
    @filterrific = initialize_filterrific(
      Libretum,
      params[:filterrific],
      select_options: {
        #Revisar que filtro aplicar ya que marca error
        #sorted_by:    Libretum.options_for_sorted_by,
        search_query: Libretum.search_query('guadalupe')
        #,
        #with_country_id: Country.options_for_select
      },
      #persistence_id: 'shared_key',
      #default_filter_params: {},
      #available_filters: [],
    ) or return
     @libretum = @filterrific.find.page(params[:page])

     puts "los registros son #{@libretum.size}"
     puts ">>>>>>>>>>>>>>>>> El filtro es #{@filterrific }"

    # Respond to html for initial page load and to js for AJAX filter updates.
    respond_to do |format|
      format.html
      format.js
    end

    # Recover from invalid param sets, e.g., when a filter refers to the
    # database id of a record that doesn’t exist any more.
    # In this case we reset filterrific and discard all filter params.
    rescue ActiveRecord::RecordNotFound => e
      # There is an issue with the persisted param_set. Reset it.
      puts "Had to reset filterrific params: #{ e.message }"
      redirect_to(reset_filterrific_url(format: :html)) and return

  end

  # GET /libreta/1
  # GET /libreta/1.json
  def show
  end

  # GET /libreta/new
  def new
    @libretum = Libretum.new
  end

  # GET /libreta/1/edit
  def edit
  end

  # POST /libreta
  # POST /libreta.json
  def create
    puts 'ingresa al metodo creta >>>>'
    @libretum = Libretum.new(libretum_params)

    puts 'Los valores del objeto son  nomb = #{@libretum.nombre} , 
                                      tel  = #{@libretum.tlf}    ,
                                      email  = #{@libretum.email},'

    respond_to do |format|
      if @libretum.save
        format.html { redirect_to @libretum, notice: 'Libretum was successfully created.' }
        format.json { render :show, status: :created, location: @libretum }
      else
        format.html { render :new }
        format.json { render json: @libretum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /libreta/1
  # PATCH/PUT /libreta/1.json
  def update
    respond_to do |format|
      if @libretum.update(libretum_params)
        format.html { redirect_to @libretum, notice: 'Libretum was successfully updated.' }
        format.json { render :show, status: :ok, location: @libretum }
      else
        format.html { render :edit }
        format.json { render json: @libretum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /libreta/1
  # DELETE /libreta/1.json
  def destroy
    @libretum.destroy
    respond_to do |format|
      format.html { redirect_to libreta_url, notice: 'Libretum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  #envio de correos
  def enviar_correo
    #Creamos el usuario
    #@persona1 = Persona.create({ nombre: 'Ricardo Sampayo', email: 'me@ricardoSampayo.com',email_confirmation: 'me@ricardoSampayo.com"', identificador: "123456789", sexo: 'm', telefono: '123456789123' })

    # Llamamos al   ActionMailer que creamos
    #ActionCorreo.bienvenido_email(@persona1).deliver
    ApplicationMailer.bienvenido_email(@user).deliver
    # mostramos el usuario en formato JSON
    render json: "Mail was succesfully send!!!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_libretum
      @libretum = Libretum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def libretum_params
      params.require(:libretum).permit(:nombre, :tlf , :email)
    end
end
