describe Ecomm::Checkout::ShowCompleteStep, type: :command do
  describe '#call' do
    it "with visiting 'complete' step page without placing an order "\
    'in the previous step publishes :denied and redirects to cart' do
      expect { described_class.new(nil).call(nil, {}) }.to(
        publish(:denied, cart_path)
      )
    end

    context 'with confirmed order' do
      let(:order) do
        build(:order, customer: build(:member),
                      line_items: build_list(:line_item, 2))
      end
      let(:last_order) { double('UserLastOrder', new: [order]) }
      let(:flash) do
        ActionDispatch::Flash::FlashHash.new(order_confirmed: true)
      end

      before { allow(Ecomm).to receive(:get_customer_id).and_return(1) }

      it "ensures flash.keep for accessing 'complete' page on reloads" do
        expect(flash).to receive(:keep)
        described_class.new(last_order).call(nil, flash)
      end

      it 'publishes :ok passing decorated order and line_items variables' do
        expect { described_class.new(last_order).call(nil, flash) }.to(
          publish(:ok, order: order.decorate, line_items: order.line_items)
        )
      end
    end
  end
end
