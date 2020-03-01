require 'ovto'

module Random575
  class MainApp < Ovto::App
    class State < Ovto::State
    end

    class Actions < Ovto::Actions
      def dispatch(state:)
        return state
      end
    end

    class MainComponent < Ovto::Component
      def render
        o 'div' do
          o 'text', 'hello, ovto'
        end
      end
    end
  end
end

Random575::MainApp.run(id: 'ovto')
