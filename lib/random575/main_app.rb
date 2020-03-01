module Random575
  class MainApp < Ovto::App
    class State < Ovto::State
      default_format = [5, 7, 5]
      item :poem, default: Random575.generate(format: default_format).join(' ')
      item :format, default: default_format
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

          o Components::RandomPoem, poem: state.poem, format: state.format

          o 'hr'

          o 'label' do
            o 'text', "Select format"
            o 'select', { onchange: handle_select_format } do
              o 'option', { value: '575' }, '575'
              o 'option', { value: '57577' }, '57577'
              o 'option', { value: '7775' }, '7775'
            end
          end
          o 'br'
          o 'button', { type: 'button', onclick: handle_reload }, 'reload'

          o 'hr'

          o Components::ShareLink, text: state.poem

          o 'hr'

          o 'footer' do
            o 'a', { href: 'https://github.com/pocke/random575' }, 'GitHub Repository'
          end
        end
      end

      private def handle_reload
        -> () do
          poem = Random575.generate(format: state.format).join(' ')
          actions.dispatch(state: { poem: poem })
        end
      end

      private def handle_select_format
        -> (ev) do
          fmt = ev.target.value.chars.map(&:to_i)
          actions.dispatch(state: { format: fmt })
          handle_reload.call
        end
      end
    end
  end
end
