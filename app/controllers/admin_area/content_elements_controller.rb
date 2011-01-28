class AdminArea::ContentElementsController < AdminArea::ApplicationController
  before_filter :get_content_element, :only => [:show,:edit,:update,:destroy]

  def index
    container_class = params[:container_type].constantize
    @container = container_class.find(params[:container_id])
    if params[:arrange]
      @jquery_ui = true
      render :partial => 'arrange' and return
    end
    if params[:partial]
      render :partial => 'index' and return
    end
  end

  # GET /editor_area_content_elements/1
  # GET /editor_area_content_elements/1.xml
  def show
    unless params[:full_page]
      partial_type = (@content_element.class.name == 'ContentImageTmp') ? 'image' : @content_element.class.name.underscore.split('_').last
      render :partial => 'show_' + partial_type, :object => @content_element and return
    end
    render :action => 'show', :layout => false
  end

  # GET /editor_area_content_elements/new
  # GET /editor_area_content_elements/new.xml
  def new
    content_type = params[:type]
    content_class = content_type.constantize
    @content_element = content_class.new(:container_id => params[:container_id],:container_type => params[:container_type])
    case content_type
    when 'ContentText'
      render :partial => 'new_text', :object => @content_element
    when 'ContentImage'
      render :partial => 'new_image', :object => @content_element
    when 'ContentVideo'
      render :partial => 'new_video', :object => @content_element
    end
  end

  # GET /editor_area_content_elements/1/edit
  def edit
    
    render :partial => 'edit_' + @content_element.class.name.underscore.split('_').last, :object => @content_element
    
  end

  # POST /editor_area_content_elements
  # POST /editor_area_content_elements.xml
  def create
    success = true
    container_class = params[:content_element][:container_type].constantize
    @container = container_class.find(params[:content_element][:container_id])
    @editable_params = params[:content_element].dup
    @editable_params[:position] = @container.content_elements.length + 1
    content_type = @editable_params[:type]
    if content_type == 'ContentImage'
      content_type = 'ContentImageTmp'
      @editable_params[:type] ='ContentImageTmp'
    end
    content_class = content_type.constantize
    @editable_params.delete :type
    @content_element = content_class.new(@editable_params)
    @content_element.save || success = false
    
    case content_type
    when 'ContentImageTmp'
      responds_to_parent do
        if success
          render :update do |page|
            page << "clickRefreshImageLink('#{@content_element.id}',#{ContentElement::COLUMNS});"
          end
        else
          render :partial => 'new_image', :object => @content_element
        end
      end
    when 'ContentText', 'ContentVideo'
      if success
        render :partial => 'show_' + content_class.underscore.split('_').last, :object => @content_element
      else
        render :partial => 'new_' + content_type.underscore.split('_').last, :object => @content_element, :status => 409
      end
    end
  end

  # PUT /editor_area_content_elements/1
  # PUT /editor_area_content_elements/1.xml
  def update
    if params[:id] == 'multiple'
      @content_elements.each do |content_element|
        content_element.position = params[:content_element].index(content_element.id.to_s)
        content_element.save
      end
      render :nothing => true and return
    end
    if @content_element.update_attributes(params[:content_element])
      render :partial => 'show_' + @content_element.class.name.underscore.split('_').last, :object => @content_element
    else
      render :partial => 'edit_' + @content_element.class.name.underscore.split('_').last, :object => @content_element, :status => 409
    end
  end

  # DELETE /editor_area_content_elements/1
  # DELETE /editor_area_content_elements/1.xml
  def destroy
    container = @content_element.container
    @content_element.destroy
    container.reload
    render :nothing => true and return
  end

  private
  def get_content_element
    if params[:id] == 'multiple'
      @content_elements = ContentElement.find(params[:content_element])
    else
      @content_element = ContentElement.find(params[:id])
    end
  end
end