require 'will_paginate/array'

class BloggersController < ApplicationController
  before_action :set_blogger, only: [:show, :edit, :update, :destroy]

  # GET /bloggers
  # GET /bloggers.json
  def index
    @bloggers = Blogger.all
    blogs = []
    @bloggers.each do |x|
      blog = {
        id: x.id,
        tite: x.title,
        author: x.author,
        paragraphs: x.paragraphs.collect { |x| x.data },
        created_at: x.created_at
      }
      blogs << blog
    end
    paginate json: blogs, per_page: 5
  end

  # GET /bloggers/1
  # GET /bloggers/1.json
  def show
     respond_to do |format|
       par = []
      @blogger.paragraphs.each do |para|
      para_details = {
        id: para.id,
        data: para.data,
        comments: para.comments.collect{ |dat| dat.body } 
      }
      par << para_details
    end
       blog_json = {
          id: @blogger[:id],
          title: @blogger[:title],
          author: @blogger[:author],
          paragraph_details:  par
        }
      
        format.json { render json: blog_json, status: :ok, location: @blogger }
    
    end
  end

  # GET /bloggers/new
  def new
    @blogger = Blogger.new
  end

  # GET /bloggers/1/edit
  def edit
  end

  # POST /bloggers
  # POST /bloggers.json
  def create
    paragraphs = blogger_params["paragraphs"].split(/\n\n+/)
    @blogger = Blogger.new(blogger_params.except(:paragraphs))


    respond_to do |format|
      if @blogger.save
        paragraphs.each do |p|
          @blogger.paragraphs << Paragraph.create(data: p)
        end
        blog_json = {
          id: @blogger[:id],
          title: @blogger[:title],
          author: @blogger[:author],
          paragraphs: @blogger.paragraphs.all.collect{ |x| x.data  }
        }

        format.json { render json: blog_json, status: :ok, location: @blogger }

      else
        format.html { render :new }
        format.json { render json: @blogger.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blogger
      @blogger = Blogger.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blogger_params
      params.require(:blogger).permit(:title, :author, :paragraphs)
    end
end
