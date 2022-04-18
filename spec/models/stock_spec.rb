require 'rails_helper'

# indicate type for rspec rails such as model(unit) controller(intergration) view(ui)
RSpec.describe Stock, type: :model do
    context 'name' do
        name_blank = Stock.create(name: nil)
        name_long = Stock.create(name: "I am an invalid stock name because I have too many characters")
        name_short = Stock.create(name:"")

        it 'raise error when empty' do
            expect(name_blank).to_not be_valid
            expect(name_blank.errors).to be_present
            expect(name_blank.errors.to_hash.keys).to include(:name)
            expect(name_blank.errors[:name]).to include("can't be blank")
        end

        it 'raise error if too long' do
            expect(name_long).to_not be_valid
            expect(name_long.errors).to be_present
            expect(name_long.errors.to_hash.keys).to include(:name)
            expect(name_long.errors[:name]).to include("is too long (maximum is 50 characters)")
        end

        it 'raise error if too short' do
            expect(name_short).to_not be_valid
            expect(name_short.errors).to be_present
            expect(name_short.errors.to_hash.keys).to include(:name)
            expect(name_short.errors[:name]).to include("is too short (minimum is 2 characters)")
        end
    end

    context 'image url' do
        image_blank = Stock.create(image: nil)
        image_wrong_format = Stock.create(image: "fakeurl.com")

        it 'raise error when empty' do
            expect(image_blank).to_not be_valid
            expect(image_blank.errors).to be_present
            expect(image_blank.errors.to_hash.keys).to include(:image)
            expect(image_blank.errors[:image]).to include("can't be blank")
        end

        it 'raise error if not formatted as url' do
            expect(image_wrong_format).to_not be_valid
            expect(image_wrong_format.errors).to be_present
            expect(image_wrong_format.errors.to_hash.keys).to include(:image)
            expect(image_wrong_format.errors[:image]).to include("is invalid")
        end
    end

    context 'symbol' do
        symbol_blank = Stock.create(symbol: nil)
        symbol_long = Stock.create(symbol: "VERYLONGSYMBOL")
        symbol_short = Stock.create(symbol:"S")

        it 'raise error when empty' do
            expect(symbol_blank).to_not be_valid
            expect(symbol_blank.errors).to be_present
            expect(symbol_blank.errors.to_hash.keys).to include(:symbol)
            expect(symbol_blank.errors[:symbol]).to include("can't be blank")
        end

        it 'raise error if too long' do
            expect(symbol_long).to_not be_valid
            expect(symbol_long.errors).to be_present
            expect(symbol_long.errors.to_hash.keys).to include(:symbol)
            expect(symbol_long.errors[:symbol]).to include("is too long (maximum is 10 characters)")
        end

        it 'raise error if too short' do
            expect(symbol_short).to_not be_valid
            expect(symbol_short.errors).to be_present
            expect(symbol_short.errors.to_hash.keys).to include(:symbol)
            expect(symbol_short.errors[:symbol]).to include("is too short (minimum is 2 characters)")
        end
    end

    context 'slug' do
        slug_blank = Stock.create(slug: nil)
        slug_long = Stock.create(slug: "I-am-an-invalid-slug-name-because-I-have-too-many-characters")
        symbol_short = Stock.create(slug:"S")
        slug_wrong_format = Stock.create(slug: "$pecial_ch@racters?&!")

        it 'raise error when empty' do
            expect(slug_blank).to_not be_valid
            expect(slug_blank.errors).to be_present
            expect(slug_blank.errors.to_hash.keys).to include(:slug)
            expect(slug_blank.errors[:slug]).to include("can't be blank")
        end

        it 'raise error if too long' do
            expect(slug_long).to_not be_valid
            expect(slug_long.errors).to be_present
            expect(slug_long.errors.to_hash.keys).to include(:slug)
            expect(slug_long.errors[:slug]).to include("is too long (maximum is 50 characters)")
        end

        it 'raise error if too short' do
            expect(symbol_short).to_not be_valid
            expect(symbol_short.errors).to be_present
            expect(symbol_short.errors.to_hash.keys).to include(:slug)
            expect(symbol_short.errors[:slug]).to include("is too short (minimum is 2 characters)")
        end

        it 'raise error if not formatted as slug' do
            expect(slug_wrong_format).to_not be_valid
            expect(slug_wrong_format.errors).to be_present
            expect(slug_wrong_format.errors.to_hash.keys).to include(:slug)
            expect(slug_wrong_format.errors[:slug]).to include("is invalid")
        end
    end

    context 'uniqueness' do
        stock_valid = Stock.create(name: "Stock Test Name", image: "https://correctformat.com", symbol: "UNIQUE", slug: "unique-slug")
        stock_invalid = Stock.create(name: "Stock Test Name", image: "https://correctformat.com", symbol: "UNIQUE", slug: "unique-slug")

        it 'accepts valid and unique entry' do
            expect(stock_valid).to be_valid
        end

        it 'raise error if entry is not unique' do
            expect(stock_invalid).to_not be_valid
            expect(stock_invalid.errors.to_hash.keys).to include(:name, :image, :symbol, :slug)
            expect(stock_invalid.errors[:name]).to include("has already been taken")
            expect(stock_invalid.errors[:image]).to include("has already been taken")
            expect(stock_invalid.errors[:symbol]).to include("has already been taken")
            expect(stock_invalid.errors[:slug]).to include("has already been taken")
        end
    end
end