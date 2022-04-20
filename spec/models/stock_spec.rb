require 'rails_helper'

# indicate type for rspec rails such as model(unit) controller(intergration) view(ui)
RSpec.describe Stock, type: :model do
    let!(:stock) {Stock.new(id: 100, name: "Stock Test Name", image: "https://correctformat.com", symbol: "UNIQUE", slug: "unique-slug")}
    context 'name' do
        it 'raise error when empty' do
            stock.name = nil
            stock.save
            expect(stock).to_not be_valid
            expect(stock.errors).to be_present
            expect(stock.errors.to_hash.keys).to include(:name)
            expect(stock.errors[:name]).to include("can't be blank")
        end

        it 'raise error if too long' do
            stock.name = "I am an invalid stock name because I have too many characters"
            stock.save
            expect(stock).to_not be_valid
            expect(stock.errors).to be_present
            expect(stock.errors.to_hash.keys).to include(:name)
            expect(stock.errors[:name]).to include("is too long (maximum is 50 characters)")
        end

        it 'raise error if too short' do
            stock.name = ""
            stock.save
            expect(stock).to_not be_valid
            expect(stock.errors).to be_present
            expect(stock.errors.to_hash.keys).to include(:name)
            expect(stock.errors[:name]).to include("is too short (minimum is 2 characters)")
        end
    end

    context 'image url' do
        it 'raise error when empty' do
            stock.image = nil
            stock.save
            expect(stock).to_not be_valid
            expect(stock.errors).to be_present
            expect(stock.errors.to_hash.keys).to include(:image)
            expect(stock.errors[:image]).to include("can't be blank")
        end

        it 'raise error if not formatted as url' do
            stock.image = "fakeurl.com"
            stock.save
            expect(stock).to_not be_valid
            expect(stock.errors).to be_present
            expect(stock.errors.to_hash.keys).to include(:image)
            expect(stock.errors[:image]).to include("is invalid")
        end
    end

    context 'symbol' do
        it 'raise error when empty' do
            stock.symbol = nil
            stock.save
            expect(stock).to_not be_valid
            expect(stock.errors).to be_present
            expect(stock.errors.to_hash.keys).to include(:symbol)
            expect(stock.errors[:symbol]).to include("can't be blank")
        end

        it 'raise error if too long' do
            stock.symbol = "VERYLONGSYMBOL"
            stock.save
            expect(stock).to_not be_valid
            expect(stock.errors).to be_present
            expect(stock.errors.to_hash.keys).to include(:symbol)
            expect(stock.errors[:symbol]).to include("is too long (maximum is 10 characters)")
        end

        it 'raise error if too short' do
            stock.symbol = "S"
            stock.save
            expect(stock).to_not be_valid
            expect(stock.errors).to be_present
            expect(stock.errors.to_hash.keys).to include(:symbol)
            expect(stock.errors[:symbol]).to include("is too short (minimum is 2 characters)")
        end
    end

    context 'slug' do
        slug = Stock.create(slug: nil)
        slug = Stock.create(slug: "I-am-an-invalid-slug-name-because-I-have-too-many-characters")
        slug = Stock.create(slug:"S")
        slug_wrong_format = Stock.create(slug: "$pecial_ch@racters?&!")

        it 'raise error when empty' do
            stock.slug = nil
            stock.save
            expect(stock).to_not be_valid
            expect(stock.errors).to be_present
            expect(stock.errors.to_hash.keys).to include(:slug)
            expect(stock.errors[:slug]).to include("can't be blank")
        end

        it 'raise error if too long' do
            stock.slug = "I-am-an-invalid-slug-name-because-I-have-too-many-characters"
            stock.save
            expect(stock).to_not be_valid
            expect(stock.errors).to be_present
            expect(stock.errors.to_hash.keys).to include(:slug)
            expect(stock.errors[:slug]).to include("is too long (maximum is 50 characters)")
        end

        it 'raise error if too short' do
            stock.slug = "S"
            stock.save
            expect(stock).to_not be_valid
            expect(stock.errors).to be_present
            expect(stock.errors.to_hash.keys).to include(:slug)
            expect(stock.errors[:slug]).to include("is too short (minimum is 2 characters)")
        end

        it 'raise error if not formatted as slug' do
            stock.slug = "$pecial_ch@racters?&!"
            stock.save
            expect(stock).to_not be_valid
            expect(stock.errors).to be_present
            expect(stock.errors.to_hash.keys).to include(:slug)
            expect(stock.errors[:slug]).to include("is invalid")
        end
    end

    context 'uniqueness' do
        it 'accepts valid and unique entry' do
            stock.save
            expect(stock).to be_valid
        end

        it 'raise error if entry is not unique' do
            stock.save
            stock_invalid = Stock.create(name: "Stock Test Name", image: "https://correctformat.com", symbol: "UNIQUE", slug: "unique-slug")

            expect(stock_invalid).to_not be_valid
            expect(stock_invalid.errors.to_hash.keys).to include(:name, :image, :symbol, :slug)
            expect(stock_invalid.errors[:name]).to include("has already been taken")
            expect(stock_invalid.errors[:image]).to include("has already been taken")
            expect(stock_invalid.errors[:symbol]).to include("has already been taken")
            expect(stock_invalid.errors[:slug]).to include("has already been taken")
        end
    end
end