describe Ecomm::Checkout::BuildCompletedOrder do
  describe '#call' do
    let(:service) do
      described_class.new(
        double('BuildOrderAddresses', call: build_list(:address, 2)),
        double('BuildLineItemsFromCart',
               call: build_list(:line_item, 4))
      )
    end

    let(:session) do
      {
        coupon_id: 23,
        order: {
          'shipment_id' => 32,
          'subtotal' => 10.0,
          'card' => attributes_for(:credit_card)
        },
        'warden.user.member.key' => [[1]]
      }
    end

    let(:order) { service.call(session) }

    it 'returns Ecomm::Order instance' do
      expect(order).to be_instance_of(Ecomm::Order)
    end

    it 'assigns current user id to order' do
      expect(order.customer_id).to eq(1)
    end

    it 'assigns coupon_id to order' do
      expect(order.coupon_id).to eq(23)
    end

    it 'assigns shipment_id to order' do
      expect(order.shipment_id).to eq(32)
    end

    it 'assigns order subtotal' do
      expect(order.subtotal).to eq(10)
    end

    it 'populates order addresses' do
      expect(order.addresses.length).to eq(2)
    end

    it 'assigns order credit card' do
      expect(order.credit_card).to be_truthy
      expect(order.credit_card.cvv).to eq('1234')
    end

    it 'populates order items' do
      expect(order.line_items.length).to eq(4)
    end
  end
end
