class MainsController < ApplicationController

    def index
        respond_to do |format|
        format.html do
            gon.data = {"Admin" => Admin.all.order(:id), "NormalTag" => NormalTag.all.order(:id), "Operation" => Operation.all.order(:id), "OriginalTag" => OriginalTag.all.order(:id), "Products" => Product.all.order(:id), "Titles" => Title.all.order(:id), "Units" => Unit.all.order(:id), "Values" => Value.all.order(:id)}
        end
        format.xlsx do
            response.headers['Content-Disposition'] = 'attachment; filename="cssSiteData.xlsx"'
            @data = {"Admin" => Admin, "Normal Tag" => NormalTag, "Operation" => Operation, "Original Tag" => OriginalTag, "Products" => Product, "Titles" => Title, "Units" => Unit, "Values" => Value}
        end
      end
    end

    def data
        normal_tags_hash = {}
        NormalTag.all.each do |normal_tag|
            normal_tags_hash[normal_tag.id] = normal_tag.hash
        end
        titles_hash = {}
        Title.all.each do |title|
            titles_hash[title.id] = title.hash
        end
        categories_hash = {}
        Category.all.each do |category|
            categories_hash[category.id] = category.hash
        end
        user = User.find_by(uid: params[:uid])
        unless user
            user = User.new
            user.uid = params[:uid]
            user.save
        end
        render :json => user.hash
    end
end
