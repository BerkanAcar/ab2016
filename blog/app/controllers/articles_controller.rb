class ArticlesController < ApplicationController
	#Üye olmayan article görmesin
	before_action :authenticate_user!
	before_action :set_article, only:[:show, :edit, :update, :destroy]
	
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end
	
	def create
		# yeni article oluştur
		@article = Article.new(article_params)
  	#article kaydet
  	#@article.save!
  	# redirect_to article_path(@article)
  	#redirect_to @article	
  	#5 karakterden kısa yazınca new sayfasında kalması sağlanır.
		if @article.save
    	redirect_to @article
  	else
    	render 'new'
  	end
  end
  	
  def edit
  end
  
  def update
  	if @article.update_attributes(article_params)
  		redirect_to articles_path
  	else
      render 'edit'
    end
  end
	
	def destroy
  	@article.destroy
  	redirect_to articles_path
	end

	def show
	end
	
	private
		def set_article
			@article = Article.find(params[:id])
		end
		
		def article_params
			# bu fonk. ile yukarıda uzun uzadıya yazmak yerine burda tanımlayıp yukarıya fonk. adını gönderdik. ve güvenliği sağladık.(rus genç)
			params.require(:article).permit(:title, :text, :string)
		end
end
