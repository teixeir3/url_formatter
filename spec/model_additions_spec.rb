require 'spec_helper'

class Comment < SuperModel::Base
  include ActiveModel::Validations::Callbacks
  extend UrlFormatter::ModelAdditions
  format_url :website
end

describe UrlFormatter::ModelAdditions do
  it "adds http:// to URL upon saving" do
    expect(Comment.create!(website: "example.com").website).to eq("http://example.com")
    expect(Comment.create!(website: "http://example.com").website).to eq("http://example.com")
  end

  it "validates URL format" do
    comment = Comment.new(website: "foo bar")
    expect(comment).not_to be_valid
    expect(comment.errors[:website]).to eq(["is not a valid URL"])
    
    comment.website = "example.com"
    expect(comment).to be_valid
  end
end