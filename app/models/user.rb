class User < ApplicationRecord

    def products
        return Product.where(user_id: self.id)
    end

    def hash_format
        products_hash = {}
        self.products.each do |product|
            products_hash[product.id] = product.hash_format
        end
        return {products: products_hash}
    end

end
