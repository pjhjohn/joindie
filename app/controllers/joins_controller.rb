class JoinsController < ApplicationController
  def new
    @join = Join.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @join }
    end
  end

  def create
    @join = Join.new(join_params)

    respond_to do |format|
      if @join.save
        flash[:notice] = 'Join was successfully created.'
        format.html { redirect_to(@join) }
        format.xml  { render xml: @join, status: :created, location: @join }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @join.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @join = Join.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @join }
    end
  end

  def edit
    @join = Join.find(params[:id])
  end

  def update
    @join = Join.find(params[:id])

    respond_to do |format|
      if @join.update(join_params)
        flash[:notice] = 'Join was successfully updated.'
        format.html { redirect_to(@join) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @join.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @join = Join.find(params[:id])
    @join.destroy

    respond_to do |format|
      format.html { redirect_to(joins_url) }
      format.xml  { head :ok }
    end
  end
end
