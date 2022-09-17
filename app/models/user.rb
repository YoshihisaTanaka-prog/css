class User < ApplicationRecord

    def products
        return Product.where(user_id: self.id).order(:name)
    end

    def hash_format
        products_hash = {}
        order = []
        self.products.each do |product|
            products_hash[product.id] = product.hash_format
            order.push(product.id)
        end
        return {products: products_hash, userId: self.id, order: order}
    end

    def delete
        self.products.each do |product|
            product.delete
        end
        self.destroy
    end

end
