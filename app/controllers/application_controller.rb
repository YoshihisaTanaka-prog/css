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

    def hashed_params text
        text_params = text.split('{')[1].split('}')[0]
        hash_params = {}
        text_params.split(', ').each do |element|
          list = element.split('=')
          if list[0] == 'uid'
            user = User.find_by(uid: list[1])
            hash_params[:user_id] = user.id
          else
            hash_params[list[0].to_sym] = list[1]
          end
        end
        return hash_params
    end

    def fetch_main_cache_data
        require "google/cloud/firestore"
        credentials_hash = JSON.parse(ENV['FIREBASE_ADMIN_SDK'])
        firestore = Google::Cloud::Firestore.new(project_id: credentials_hash["project_id"], credentials: credentials_hash)
        doc_ref = firestore.doc("CSS/cache") # 読み込み先パスを指定
        
        update_data = {}
        
        update_data[:tag] = []
        NormalTag.all.order(:name).each do |tag|
            update_data[:tag].push(tag.name)
        end
        
        update_data[:category] = []
        Category.all.order(:name).each do |category|
            update_data[:category].push({category.name => category.title_ids})
        end

        update_data[:titles] = []
        Title.all.order(:name).each do |title|
            update_data[:titles].push({title.name => title.operation.hash_format}) if title.operation
        end

        logger.debug update_data
        doc_ref.set(update_data)
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
