module Random575
  module Components
    class RandomPoem < Ovto::PureComponent
      def render(nonce:)
        o 'div' do
          o 'text', gen
        end
      end

      private def gen
        Random575.generate(format: [5, 7, 5, 7, 7]).join(' ')
      end
    end
  end
end
