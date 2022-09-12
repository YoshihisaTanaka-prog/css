class MainsController < ApplicationController
    protect_from_forgery except: [:data]
    before_action :only_api, only: [:data]
    before_action :authenticate_admin!, only: [:index]

    def index
        respond_to do |format|
        format.html do
            gon.data = {"Admin" => Admin.all.order(:id), "NormalTag" => NormalTag.all.order(:id), "Operation" => Operation.all.order(:id), "OriginalTag" => OriginalTag.all.order(:id), "Products" => Product.all.order(:id), "Titles" => Title.all.order(:id), "Units" => Unit.all.order(:id), "Values" => Value.all.order(:id)}
        end
        format.xlsx do
            response.headers['Content-Disposition'] = 'attachment; filename="cssSiteData.xlsx"'
            @data = {"Admin" => Admin, "Normal Tag" => NormalTag, "Operation" => Operation, "Original Tag" => OriginalTag, "Products" => Product, "Titles" => Title, "Units" => Unit, "Values" => Value}
        end
        format.json do
            render json: {"Admin" => Admin.all.order(:id), "NormalTag" => NormalTag.all.order(:id), "Operation" => Operation.all.order(:id), "OriginalTag" => OriginalTag.all.order(:id), "Products" => Product.all.order(:id), "Titles" => Title.all.order(:id), "Units" => Unit.all.order(:id), "Values" => Value.all.order(:id)}
        end
      end
    end

    def data
        user = User.find_by(uid: params[:uid])
        unless user
            user = User.new
            user.uid = params[:uid]
            logger.debug user
            user.save
        end
        render :json => user.hash_format
    end

    def dummy
        render plain: ""
    end
end
