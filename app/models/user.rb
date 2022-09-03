class User < ApplicationRecord

    def products
        return Product.where(user_id: self.id)
    end

    def hash
        products_hash = {}
        self.products.each do |product|
            products_hash[product.id] = product.hash
        end
        return {products: products_hash}
    end

end
