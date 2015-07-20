# encoding: utf-8
require 'spec_helper'

describe UrlFormatter do
  it 'has a version number' do
    expect(UrlFormatter::VERSION).not_to be nil
  end

  describe ".format_url" do
    it "adds http:// to a URL if not provided" do
      expect(UrlFormatter.format_url("example.com")).to eq("http://example.com")
    end

    it "does not add http:// to a URL if already provided" do
      expect(UrlFormatter.format_url("http://example.com")).to eq("http://example.com")
    end

    it "returns an invalid URL unchanged" do
      expect(UrlFormatter.format_url("foo bar")).to eq("foo bar")
      expect(UrlFormatter.format_url(nil)).to eq(nil)
    end
  end

  describe ".url_regexp" do
    it "matches valid URLs" do
      [
        'http://example.com/',
        'HTTP://E-XAMLE.COM',
        'https://example.co.uk./foo',
        'http://example.com:8080',
        'http://www.example.com/anything/after?slash',
        'http://www.example.com?anything_after=question',
        'http://user123:sEcr3t@example.com',
        'http://user123:@example.com',
        'http://example.com/~user',
        'http://1.2.3.4:8080',
        'http://ütf8.com',
      ].each do |url|
        expect(url).to match(UrlFormatter.url_regexp)
      end
    end

    it "does not match invalid URLs" do
      [
        "www.example.com",
        "http://",
        "http://example..com",
        "http://e xample.com",
        "http://example.com/foo bar",
        "http://example", # technically valid but not what we want from user
        "other://example.com", # we also don't want other protocols
      ].each do |url|
        expect(url).not_to match(UrlFormatter.url_regexp)
      end
    end
  end
end
