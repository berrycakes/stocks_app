# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

stocks = Stock.create([
    {
      slug: 'bitcoin',
      symbol: 'btc',
      name: 'Bitcoin',
      image: 'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
      max_supply: 21000000
    },
    {
      slug: 'ethereum',
      symbol: 'eth',
      name: 'Ethereum',
      image: 'https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880',
      max_supply: nil
    },
    {
      slug: 'tether',
      symbol: 'usdt',
      name: 'Tether',
      image: 'https://assets.coingecko.com/coins/images/325/large/Tether-logo.png?1598003707',
      max_supply: nil
    },
    {
      slug: 'binancecoin',
      symbol: 'bnb',
      name: 'BNB',
      image: 'https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850',
      max_supply: 168137035.9
    },
    {
      slug: 'usd-coin',
      symbol: 'usdc',
      name: 'USD Coin',
      image: 'https://assets.coingecko.com/coins/images/6319/large/USD_Coin_icon.png?1547042389',
      max_supply: nil
    },
    {
      slug: 'ripple',
      symbol: 'xrp',
      name: 'XRP',
      image: 'https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1605778731',
      max_supply: 100000000000
    },
    {
      slug: 'terra-luna',
      symbol: 'luna',
      name: 'Terra',
      image: 'https://assets.coingecko.com/coins/images/8284/large/luna1557227471663.png?1567147072',
      max_supply: 1000000000
    },
    {
      slug: 'cardano',
      symbol: 'ada',
      name: 'Cardano',
      image: 'https://assets.coingecko.com/coins/images/975/large/cardano.png?1547034860',
      max_supply: 45000000000
    },
    {
      slug: 'solana',
      symbol: 'sol',
      name: 'Solana',
      image: 'https://assets.coingecko.com/coins/images/4128/large/solana.png?1640133422',
      max_supply: nil
    },
    {
      slug: 'avalanche-2',
      symbol: 'avax',
      name: 'Avalanche',
      image: 'https://assets.coingecko.com/coins/images/12559/large/coin-round-red.png?1604021818',
      max_supply: 720000000
    },
    {
      slug: 'polkadot',
      symbol: 'dot',
      name: 'Polkadot',
      image: 'https://assets.coingecko.com/coins/images/12171/large/polkadot.png?1639712644',
      max_supply: nil
    },
    {
      slug: 'dogecoin',
      symbol: 'doge',
      name: 'Dogecoin',
      image: 'https://assets.coingecko.com/coins/images/5/large/dogecoin.png?1547792256',
      max_supply: nil
    },
    {
      slug: 'binance-usd',
      symbol: 'busd',
      name: 'Binance USD',
      image: 'https://assets.coingecko.com/coins/images/9576/large/BUSD.png?1568947766',
      max_supply: nil
    },
    {
      slug: 'terrausd',
      symbol: 'ust',
      name: 'TerraUSD',
      image: 'https://assets.coingecko.com/coins/images/12681/large/UST.png?1601612407',
      max_supply: nil
    },
    {
      slug: 'shiba-inu',
      symbol: 'shib',
      name: 'Shiba Inu',
      image: 'https://assets.coingecko.com/coins/images/11939/large/shiba.png?1622619446',
      max_supply: nil
    },
    {
      slug: 'wrapped-bitcoin',
      symbol: 'wbtc',
      name: 'Wrapped Bitcoin',
      image: 'https://assets.coingecko.com/coins/images/7598/large/wrapped_bitcoin_wbtc.png?1548822744',
      max_supply: 274230.4661
    },
    {
      slug: 'crypto-com-chain',
      symbol: 'cro',
      name: 'Cronos',
      image: 'https://assets.coingecko.com/coins/images/7310/large/oCw2s3GI_400x400.jpeg?1645172042',
      max_supply: nil
    },
    {
      slug: 'matic-network',
      symbol: 'matic',
      name: 'Polygon',
      image: 'https://assets.coingecko.com/coins/images/4713/large/matic-token-icon.png?1624446912',
      max_supply: 10000000000
    },
    {
      slug: 'staked-ether',
      symbol: 'steth',
      name: 'Lido Staked Ether',
      image: 'https://assets.coingecko.com/coins/images/13442/large/steth_logo.png?1608607546',
      max_supply: 2835578.996
    },
    {
      slug: 'near',
      symbol: 'near',
      name: 'NEAR Protocol',
      image: 'https://assets.coingecko.com/coins/images/10365/large/near_icon.png?1601359077',
      max_supply: 1000000000
    },
    {
      slug: 'dai',
      symbol: 'dai',
      name: 'Dai',
      image: 'https://assets.coingecko.com/coins/images/9956/large/4943.png?1636636734',
      max_supply: 9196719661
    },
    {
      slug: 'litecoin',
      symbol: 'ltc',
      name: 'Litecoin',
      image: 'https://assets.coingecko.com/coins/images/2/large/litecoin.png?1547033580',
      max_supply: 84000000
    },
    {
      slug: 'cosmos',
      symbol: 'atom',
      name: 'Cosmos Hub',
      image: 'https://assets.coingecko.com/coins/images/1481/large/cosmos_hub.png?1555657960',
      max_supply: nil
    },
    {
      slug: 'chainlink',
      symbol: 'link',
      name: 'Chainlink',
      image: 'https://assets.coingecko.com/coins/images/877/large/chainlink-new-logo.png?1547034700',
      max_supply: 1000000000
    },
    {
      slug: 'bitcoin-cash',
      symbol: 'bch',
      name: 'Bitcoin Cash',
      image: 'https://assets.coingecko.com/coins/images/780/large/bitcoin-cash-circle.png?1594689492',
      max_supply: 21000000
    },
    {
      slug: 'ftx-token',
      symbol: 'ftt',
      name: 'FTX Token',
      image: 'https://assets.coingecko.com/coins/images/9026/large/F.png?1609051564',
      max_supply: 333167763.4
    },
    {
      slug: 'tron',
      symbol: 'trx',
      name: 'TRON',
      image: 'https://assets.coingecko.com/coins/images/1094/large/tron-logo.png?1547035066',
      max_supply: nil
    },
    {
      slug: 'ethereum-classic',
      symbol: 'etc',
      name: 'Ethereum Classic',
      image: 'https://assets.coingecko.com/coins/images/453/large/ethereum-classic-logo.png?1547034169',
      max_supply: 210700000
    },
    {
      slug: 'axie-infinity',
      symbol: 'axs',
      name: 'Axie Infinity',
      image: 'https://assets.coingecko.com/coins/images/13029/large/axie_infinity_logo.png?1604471082',
      max_supply: 270000000
    },
    {
      slug: 'algorand',
      symbol: 'algo',
      name: 'Algorand',
      image: 'https://assets.coingecko.com/coins/images/4380/large/download.png?1547039725',
      max_supply: 10000000000
    },
    {
      slug: 'waves',
      symbol: 'waves',
      name: 'Waves',
      image: 'https://assets.coingecko.com/coins/images/425/large/waves.png?1548386117',
      max_supply: nil
    },
    {
      slug: 'stellar',
      symbol: 'xlm',
      name: 'Stellar',
      image: 'https://assets.coingecko.com/coins/images/100/large/Stellar_symbol_black_RGB.png?1552356157',
      max_supply: 50001788004
    },
    {
      slug: 'leo-token',
      symbol: 'leo',
      name: 'LEO Token',
      image: 'https://assets.coingecko.com/coins/images/8418/large/leo-token.png?1558326215',
      max_supply: nil
    },
    {
      slug: 'okb',
      symbol: 'okb',
      name: 'OKB',
      image: 'https://assets.coingecko.com/coins/images/4463/large/WeChat_Image_20220118095654.png?1642471050',
      max_supply: nil
    },
    {
      slug: 'uniswap',
      symbol: 'uni',
      name: 'Uniswap',
      image: 'https://assets.coingecko.com/coins/images/12504/large/uniswap-uni.png?1600306604',
      max_supply: 1000000000
    },
    {
      slug: 'hedera-hashgraph',
      symbol: 'hbar',
      name: 'Hedera',
      image: 'https://assets.coingecko.com/coins/images/3688/large/hbar.png?1637045634',
      max_supply: nil
    },
    {
      slug: 'internet-computer',
      symbol: 'icp',
      name: 'Internet Computer',
      image: 'https://assets.coingecko.com/coins/images/14495/large/Internet_Computer_logo.png?1620703073',
      max_supply: 469213710
    },
    {
      slug: 'filecoin',
      symbol: 'fil',
      name: 'Filecoin',
      image: 'https://assets.coingecko.com/coins/images/12817/large/filecoin.png?1602753933',
      max_supply: 1970496686
    },
    {
      slug: 'vechain',
      symbol: 'vet',
      name: 'VeChain',
      image: 'https://assets.coingecko.com/coins/images/1167/large/VeChain-Logo-768x725.png?1547035194',
      max_supply: nil
    },
    {
      slug: 'elrond-erd-2',
      symbol: 'egld',
      name: 'Elrond',
      image: 'https://assets.coingecko.com/coins/images/12335/large/elrond3_360.png?1626341589',
      max_supply: nil
    },
    {
      slug: 'decentraland',
      symbol: 'mana',
      name: 'Decentraland',
      image: 'https://assets.coingecko.com/coins/images/878/large/decentraland-mana.png?1550108745',
      max_supply: 2193716427
    },
    {
      slug: 'monero',
      symbol: 'xmr',
      name: 'Monero',
      image: 'https://assets.coingecko.com/coins/images/69/large/monero_logo.png?1547033729',
      max_supply: nil
    },
    {
      slug: 'the-sandbox',
      symbol: 'sand',
      name: 'The Sandbox',
      image: 'https://assets.coingecko.com/coins/images/12129/large/sandbox_logo.jpg?1597397942',
      max_supply: 3000000000
    },
    {
      slug: 'theta-token',
      symbol: 'theta',
      name: 'Theta Network',
      image: 'https://assets.coingecko.com/coins/images/2538/large/theta-token-logo.png?1548387191',
      max_supply: nil
    },
    {
      slug: 'compound-ether',
      symbol: 'ceth',
      name: 'cETH',
      image: 'https://assets.coingecko.com/coins/images/10643/large/ceth2.JPG?1581389598',
      max_supply: nil
    },
    {
      slug: 'fantom',
      symbol: 'ftm',
      name: 'Fantom',
      image: 'https://assets.coingecko.com/coins/images/4001/large/Fantom.png?1558015016',
      max_supply: 3175000000
    },
    {
      slug: 'thorchain',
      symbol: 'rune',
      name: 'THORChain',
      image: 'https://assets.coingecko.com/coins/images/6595/large/RUNE.png?1614160507',
      max_supply: 500000000
    },
    {
      slug: 'klay-token',
      symbol: 'klay',
      name: 'Klaytn',
      image: 'https://assets.coingecko.com/coins/images/9672/large/klaytn.jpeg?1642775250',
      max_supply: nil
    },
    {
      slug: 'tezos',
      symbol: 'xtz',
      name: 'Tezos',
      image: 'https://assets.coingecko.com/coins/images/976/large/Tezos-logo.png?1547034862',
      max_supply: nil
    },
    {
      slug: 'the-graph',
      symbol: 'grt',
      name: 'The Graph',
      image: 'https://assets.coingecko.com/coins/images/13397/large/Graph_Token.png?1608145566',
      max_supply: 10000000000
    },
    {
      slug: 'aave',
      symbol: 'aave',
      name: 'Aave',
      image: 'https://assets.coingecko.com/coins/images/12645/large/AAVE.png?1601374110',
      max_supply: 16000000
    },
    {
      slug: 'eos',
      symbol: 'eos',
      name: 'EOS',
      image: 'https://assets.coingecko.com/coins/images/738/large/eos-eos-logo.png?1547034481',
      max_supply: nil
    },
    {
      slug: 'magic-internet-money',
      symbol: 'mim',
      name: 'Magic Internet Money',
      image: 'https://assets.coingecko.com/coins/images/16786/large/mimlogopng.png?1624979612',
      max_supply: nil
    },
    {
      slug: 'osmosis',
      symbol: 'osmo',
      name: 'Osmosis',
      image: 'https://assets.coingecko.com/coins/images/16724/large/osmo.png?1632763885',
      max_supply: 1000000000
    },
    {
      slug: 'frax',
      symbol: 'frax',
      name: 'Frax',
      image: 'https://assets.coingecko.com/coins/images/13422/large/frax_logo.png?1608476506',
      max_supply: 2690095598
    },
    {
      slug: 'flow',
      symbol: 'flow',
      name: 'Flow',
      image: 'https://assets.coingecko.com/coins/images/13446/large/5f6294c0c7a8cda55cb1c936_Flow_Wordmark.png?1631696776',
      max_supply: nil
    },
    {
      slug: 'iota',
      symbol: 'miota',
      name: 'IOTA',
      image: 'https://assets.coingecko.com/coins/images/692/large/IOTA_Swirl.png?1604238557',
      max_supply: nil
    },
    {
      slug: 'helium',
      symbol: 'hnt',
      name: 'Helium',
      image: 'https://assets.coingecko.com/coins/images/4284/large/Helium_HNT.png?1612620071',
      max_supply: 223000000
    },
    {
      slug: 'pancakeswap-token',
      symbol: 'cake',
      name: 'PancakeSwap',
      image: 'https://assets.coingecko.com/coins/images/12632/large/pancakeswap-cake-logo_%281%29.png?1629359065',
      max_supply: nil
    },
    {
      slug: 'defichain',
      symbol: 'dfi',
      name: 'DeFiChain',
      image: 'https://assets.coingecko.com/coins/images/11757/large/symbol-defi-blockchain_200.png?1597306538',
      max_supply: nil
    },
    {
      slug: 'zcash',
      symbol: 'zec',
      name: 'Zcash',
      image: 'https://assets.coingecko.com/coins/images/486/large/circle-zcash-color.png?1547034197',
      max_supply: 21000000
    },
    {
      slug: 'apecoin',
      symbol: 'ape',
      name: 'ApeCoin',
      image: 'https://assets.coingecko.com/coins/images/24383/large/apecoin.jpg?1647476455',
      max_supply: 1000000000
    },
    {
      slug: 'gala',
      symbol: 'gala',
      name: 'Gala',
      image: 'https://assets.coingecko.com/coins/images/12493/large/GALA-COINGECKO.png?1600233435',
      max_supply: 50000000000
    },
    {
      slug: 'compound-usd-coin',
      symbol: 'cusdc',
      name: 'cUSDC',
      image: 'https://assets.coingecko.com/coins/images/9442/large/Compound_USDC.png?1567581577',
      max_supply: nil
    },
    {
      slug: 'bittorrent',
      symbol: 'btt',
      name: 'BitTorrent',
      image: 'https://assets.coingecko.com/coins/images/22457/large/btt_logo.png?1643857231',
      max_supply: 990000000000000
    },
    {
      slug: 'cdai',
      symbol: 'cdai',
      name: 'cDAI',
      image: 'https://assets.coingecko.com/coins/images/9281/large/cDAI.png?1576467585',
      max_supply: nil
    },
    {
      slug: 'quant-network',
      symbol: 'qnt',
      name: 'Quant',
      image: 'https://assets.coingecko.com/coins/images/3370/large/5ZOu7brX_400x400.jpg?1612437252',
      max_supply: 14612493
    },
    {
      slug: 'maker',
      symbol: 'mkr',
      name: 'Maker',
      image: 'https://assets.coingecko.com/coins/images/1364/large/Mark_Maker.png?1585191826',
      max_supply: 1005577
    },
    {
      slug: 'theta-fuel',
      symbol: 'tfuel',
      name: 'Theta Fuel',
      image: 'https://assets.coingecko.com/coins/images/8029/large/1_0YusgngOrriVg4ZYx4wOFQ.png?1553483622',
      max_supply: nil
    },
    {
      slug: 'huobi-btc',
      symbol: 'hbtc',
      name: 'Huobi BTC',
      image: 'https://assets.coingecko.com/coins/images/12407/large/Unknown-5.png?1599624896',
      max_supply: 39884.0822
    },
    {
      slug: 'neo',
      symbol: 'neo',
      name: 'NEO',
      image: 'https://assets.coingecko.com/coins/images/480/large/NEO_512_512.png?1594357361',
      max_supply: nil
    },
    {
      slug: 'arweave',
      symbol: 'ar',
      name: 'Arweave',
      image: 'https://assets.coingecko.com/coins/images/4343/large/oRt6SiEN_400x400.jpg?1591059616',
      max_supply: 66000000
    },
    {
      slug: 'harmony',
      symbol: 'one',
      name: 'Harmony',
      image: 'https://assets.coingecko.com/coins/images/4344/large/Y88JAze.png?1565065793',
      max_supply: 13156044840
    },
    {
      slug: 'bitcoin-cash-sv',
      symbol: 'bsv',
      name: 'Bitcoin SV',
      image: 'https://assets.coingecko.com/coins/images/6799/large/BSV.png?1558947902',
      max_supply: nil
    },
    {
      slug: 'ecash',
      symbol: 'xec',
      name: 'eCash',
      image: 'https://assets.coingecko.com/coins/images/16646/large/Logo_final-22.png?1628239446',
      max_supply: 21000000000000
    },
    {
      slug: 'kusama',
      symbol: 'ksm',
      name: 'Kusama',
      image: 'https://assets.coingecko.com/coins/images/9568/large/m4zRhP5e_400x400.jpg?1576190080',
      max_supply: 10000000
    },
    {
      slug: 'convex-finance',
      symbol: 'cvx',
      name: 'Convex Finance',
      image: 'https://assets.coingecko.com/coins/images/15585/large/convex.png?1621256328',
      max_supply: 100000000
    },
    {
      slug: 'chiliz',
      symbol: 'chz',
      name: 'Chiliz',
      image: 'https://assets.coingecko.com/coins/images/8834/large/Chiliz.png?1561970540',
      max_supply: 8888888888
    },
    {
      slug: 'kucoin-shares',
      symbol: 'kcs',
      name: 'KuCoin Token',
      image: 'https://assets.coingecko.com/coins/images/1047/large/sa9z79.png?1610678720',
      max_supply: nil
    },
    {
      slug: 'enjincoin',
      symbol: 'enj',
      name: 'Enjin Coin',
      image: 'https://assets.coingecko.com/coins/images/1102/large/enjin-coin-logo.png?1547035078',
      max_supply: 1000000000
    },
    {
      slug: 'loopring',
      symbol: 'lrc',
      name: 'Loopring',
      image: 'https://assets.coingecko.com/coins/images/913/large/LRC.png?1572852344',
      max_supply: 1374513896
    },
    {
      slug: 'radix',
      symbol: 'xrd',
      name: 'Radix',
      image: 'https://assets.coingecko.com/coins/images/4374/large/Radix.png?1629701658',
      max_supply: 24000000000
    },
    {
      slug: 'blockstack',
      symbol: 'stx',
      name: 'Stacks',
      image: 'https://assets.coingecko.com/coins/images/2069/large/Stacks_logo_full.png?1604112510',
      max_supply: nil
    },
    {
      slug: 'celo',
      symbol: 'celo',
      name: 'Celo',
      image: 'https://assets.coingecko.com/coins/images/11090/large/icon-celo-CELO-color-500.png?1592293590',
      max_supply: 1000000000
    },
    {
      slug: 'huobi-token',
      symbol: 'ht',
      name: 'Huobi Token',
      image: 'https://assets.coingecko.com/coins/images/2822/large/huobi-token-logo.png?1547036992',
      max_supply: 500000000
    },
    {
      slug: 'zilliqa',
      symbol: 'zil',
      name: 'Zilliqa',
      image: 'https://assets.coingecko.com/coins/images/2687/large/Zilliqa-logo.png?1547036894',
      max_supply: nil
    },
    {
      slug: 'celsius-degree-token',
      symbol: 'cel',
      name: 'Celsius Network',
      image: 'https://assets.coingecko.com/coins/images/3263/large/CEL_logo.png?1609598753',
      max_supply: nil
    },
    {
      slug: 'dash',
      symbol: 'dash',
      name: 'Dash',
      image: 'https://assets.coingecko.com/coins/images/19/large/dash-logo.png?1548385930',
      max_supply: nil
    },
    {
      slug: 'true-usd',
      symbol: 'tusd',
      name: 'TrueUSD',
      image: 'https://assets.coingecko.com/coins/images/3449/large/tusd.png?1618395665',
      max_supply: nil
    },
    {
      slug: 'frax-share',
      symbol: 'fxs',
      name: 'Frax Share',
      image: 'https://assets.coingecko.com/coins/images/13423/large/frax_share.png?1608478989',
      max_supply: 99209822.6
    },
    {
      slug: 'nexo',
      symbol: 'nexo',
      name: 'NEXO',
      image: 'https://assets.coingecko.com/coins/images/3695/large/nexo.png?1548086057',
      max_supply: 1000000000
    },
    {
      slug: 'amp-token',
      symbol: 'amp',
      name: 'Amp',
      image: 'https://assets.coingecko.com/coins/images/12409/large/amp-200x200.png?1599625397',
      max_supply: 99225164239
    },
    {
      slug: 'humans-ai',
      symbol: 'heart',
      name: 'Humans.ai',
      image: 'https://assets.coingecko.com/coins/images/21273/large/h_logo_1x.png?1638858402',
      max_supply: 7800000000
    },
    {
      slug: 'basic-attention-token',
      symbol: 'bat',
      name: 'Basic Attention Token',
      image: 'https://assets.coingecko.com/coins/images/677/large/basic-attention-token.png?1547034427',
      max_supply: 1500000000
    },
    {
      slug: 'havven',
      symbol: 'snx',
      name: 'Synthetix Network Token',
      image: 'https://assets.coingecko.com/coins/images/3406/large/SNX.png?1598631139',
      max_supply: 248691562.7
    },
    {
      slug: 'juno-network',
      symbol: 'juno',
      name: 'JUNO',
      image: 'https://assets.coingecko.com/coins/images/19249/large/juno.png?1642838082',
      max_supply: 185562268
    },
    {
      slug: 'bitdao',
      symbol: 'bit',
      name: 'BitDAO',
      image: 'https://assets.coingecko.com/coins/images/17627/large/bitdao.jpg?1628679607',
      max_supply: 10000000000
    },
    {
      slug: 'kadena',
      symbol: 'kda',
      name: 'Kadena',
      image: 'https://assets.coingecko.com/coins/images/3693/large/djLWD6mR_400x400.jpg?1591080616',
      max_supply: 1000000000
    },
    {
      slug: 'mina-protocol',
      symbol: 'mina',
      name: 'Mina Protocol',
      image: 'https://assets.coingecko.com/coins/images/15628/large/JM4_vQ34_400x400.png?1621394004',
      max_supply: nil
    },
    {
      slug: 'lido-dao',
      symbol: 'ldo',
      name: 'Lido DAO',
      image: 'https://assets.coingecko.com/coins/images/13573/large/Lido_DAO.png?1609873644',
      max_supply: 1000000000
    }
   ])