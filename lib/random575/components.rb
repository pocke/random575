module Random575
  module Components
    class RandomPoem < Ovto::Component
      def render(poem:, format:)
        o 'div' do
          o 'text', poem
        end
      end
    end

    class ShareLink < Ovto::Component
      def render(text:, link_text: "Share to Twitter", url: Native(`location.href`))
        o 'a.twitter-share-link', { target: '_blank', href: build_url(url: url, text: text) }, link_text
      end

      private def build_url(url:, text:)
        "https://twitter.com/share?url=" + encode(url) + "&text=" + encode(text)
      end

      private def encode(text)
        `encodeURIComponent(text)`
      end
    end
  end
end
