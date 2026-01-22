class UsersController < ApplicationController
  def show
    # URL ကလာတဲ့ :id ကိုသုံးပြီး User တစ်ယောက်ချင်းစီရဲ့ data ကို ရှာပါမယ်
    @user = User.find(params[:id])
    # အဲ့ဒီ User နဲ့ သက်ဆိုင်တဲ့ prototype အားလုံးကို ဆွဲထုတ်ပါမယ်
    @prototypes = @user.prototypes
  end
end
