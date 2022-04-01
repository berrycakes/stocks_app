require './lib/base'
require './lib/coinbase'
require './lib/coingecko'

module Api
    class Wrapper < Base
        %w[
            coinbase
            coingecko
        ]. each do |api|
            define_method(api.to_sym) do
                Object.const_get("Api::#{klassify(api)}"),new(@options).request
    end

    def klassify(name)
        name.split('_').collect(&:capitalize).join
    end
end