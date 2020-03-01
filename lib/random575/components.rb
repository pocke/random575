module Random575
  module Components
    class RandomPoem < Ovto::PureComponent
      def render(nonce:, format:)
        o 'div' do
          o 'text', gen(format: format)
        end
      end

      private def gen(format:)
        Random575.generate(format: format).join(' ')
      end
    end
  end
end
