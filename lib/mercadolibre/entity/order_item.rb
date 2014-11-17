module Mercadolibre
  module Entity
    class OrderItem
      def self.attr_list
        [:item, :quantity, :unit_price, :currency_id]
      end

      attr_reader *attr_list

      def initialize(attributes={})
        attributes.each do |k, v|
          if k.to_s == 'item'
            self.item = Item.new(v) unless v.nil?
          else
            self.send("#{k}=", v) if self.respond_to?(k)
          end
        end
      end

      private

      attr_writer *attr_list
    end
  end
end
