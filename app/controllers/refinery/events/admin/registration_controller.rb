class Refinery::Events::Admin::RegistrationController < ::Refinery::AdminController

  def index
    @event = Refinery::Events::Event.find(params[:event_id])
    @form_fields = @event.form.form_fields
  end

  def show
  end

  def new
    @event = Refinery::Events::Event.find(params[:event_id])
    @field = Refinery::Events::FormField.new(:form_id=>@event.form.id)
  end

  def create
    @event = Refinery::Events::Event.find(params[:event_id])
    @field = Refinery::Events::FormField.new(params[:field])
    @field.form_id = @event.form.id
    @field.save
    if( ["dropdown","checkbox","radiobutton"].include?(@field.field_type) ) && !params[:field_type_options].blank?
      @field.form_field_options.delete_all
      params[:field_type_options].each do |op|
        @field.form_field_options << Refinery::Events::FormFieldOption.create(:form_field_id=>params[:field][:id],:value=>op)
      end
    end
    redirect_to "/refinery/events/#{params[:event_id]}/registration"
  end

  def edit
    @event = Refinery::Events::Event.find(params[:event_id])
    @field = Refinery::Events::FormField.find(params[:id])
  end

  def update
    @event = Refinery::Events::Event.find(params[:event_id])
    @field = @event.form.form_fields.find(params[:field][:id])
    @field.update_attributes(:field_name=>params[:field][:field_name],:field_type=>params[:field][:field_type],:is_mandatory=>params[:field][:is_mandatory].present?)
    if( ["dropdown","checkbox","radiobutton"].include?(@field.field_type) ) && !params[:field_type_options].blank?
      @field.form_field_options.delete_all
      params[:field_type_options].each do |op|
        @field.form_field_options << Refinery::Events::FormFieldOption.create(:form_field_id=>params[:field][:id],:value=>op)
      end
    end
    redirect_to "/refinery/events/#{params[:event_id]}/registration"
  end

  def destroy
    @event = Refinery::Events::Event.find(params[:event_id])
    @field = Refinery::Events::FormField.find(params[:id])
    @field.delete
    redirect_to "/refinery/events/#{params[:event_id]}/registration"
  end

end
