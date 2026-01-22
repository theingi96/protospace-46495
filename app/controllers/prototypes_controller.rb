class PrototypesController < ApplicationController
  # ၁။ Login စစ်ဆေးခြင်း (index နဲ့ show ကလွဲရင် ကျန်တာ login လိုအပ်မယ်)
  before_action :authenticate_user!, except: [:index, :show]
  # ၂။ ပိုင်ရှင်ဟုတ်မဟုတ် စစ်ဆေးခြင်း (edit action မတိုင်ခင် စစ်မယ်)
  before_action :move_to_index, only: [:edit]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    # move_to_index မှာ @prototype ကို ရှာပြီးသားမို့ ဒီမှာ ထပ်ရေးစရာမလိုတော့ပါဘူး
    # ဒါပေမယ့် ရေးထားလည်း အမှားတော့မဟုတ်ပါဘူး
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @prototype = Prototype.find(params[:id])
    # ပိုင်ရှင်မဟုတ်ရင် Top Page ကို ပြန်ပို့မယ်
    unless current_user.id == @prototype.user_id
      redirect_to action: :index
    end
  end
end