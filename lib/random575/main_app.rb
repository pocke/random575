module Random575
  class MainApp < Ovto::App
    class State < Ovto::State
      item :nonce, default: 0
    end

    class Actions < Ovto::Actions
      def dispatch(state:)
        return state
      end
    end

    class MainComponent < Ovto::Component
      def render
        o 'div' do
          o 'h1' do
            o 'text', 'Random 575'
            o 'small', ' - Get 575 randomly'
          end
          o Components::RandomPoem, nonce: state.nonce
          o 'button', { onclick: handle_reload }, 'reload'
        end
      end

      private def handle_reload
        -> () do
          actions.dispatch(state: { nonce: rand })
        end
      end
    end
  end
end
