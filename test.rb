def new
  @item = Item.new
  @item.item_images.build
end


def create
  # ブランド名がstringでparamsに入ってくるので、id番号に書き換え
  if brand = Brand.find_by(name: params[:item][:brand_id])
    params[:item][:brand_id] = brand.id
  else
    params[:item][:brand_id] = Brand.create(name: params[:item][:brand_id]).id
  end


  @item = Item.new(item_params)
  if @item.save && new_image_params[:images][0] != " "
    new_image_params[:images].each do |image|
      @item.item_images.create(image_url: image, item_id: @item.id)
    end


    Deal.create(seller_id: current_user.id ,item_id: @item.id, status_id:1)


    flash[:notice] = '出品が完了しました'
    redirect_to root_path
  else
    @item.item_images.build
    flash[:alert] = '未入力項目があります'
    redirect_back(fallback_location: root_path)
  end
end


private
def item_params
  params.require(:item).permit(:name, :text, :category_id, :size_id, :brand_id, :condition, :delivery_fee_payer, :delivery_type, :delibery_from_area, :delivery_days, :price)
end


def new_image_params
  params.require(:new_images).permit({images: []})
end