class ApplicationController < ActionController::Base

    def only_admin level
        unless admin_signed_in?
            render plain: ""
        end
        if current_admin.level < level
            render plain: ""
        end
    end

    def only_api
        unless params[:apiPassword] == ENV['API_PASSWORD']
            render plain: ""
        end
    end

    def only_admin_or_api level
        unless  params[:apiPassword] == ENV['API_PASSWORD']
            only_admin(level)
        end
    end

    def after_sign_in_path_for(resource)
        root_path # ログイン後に遷移するpathを設定
    end

    def after_sign_up_path_for(resource)
        root_path # ログイン後に遷移するpathを設定
    end

    def after_sign_out_path_for(resource)
        root_path # ログアウト後に遷移するpathを設定
    end
end
