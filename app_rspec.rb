require './app'

describe "storage" do
  it "should return 1234 when calling storage.score" do
    s = Storage.new
    s.populate()
    expect(s.score()).to eq 1234
  end
end
