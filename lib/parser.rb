class Parser
  attr_reader :log_info, :entry

  def initialize(path)
    @path = path
    @entry = Hash.new { |h, k| h[k] = [] }
  end

  def parse
    File.open(@path).each_line do |line|
    url, ip = line.split(/\s/)
    @entry[url] << ip
    end
  end

  def page_views
    @page_views ||=
    view_count(unique: false).sort_by { |h, k| k.size }.to_h
    @page_views
  end

  def unique_views
    @unique_views ||=
    view_count(unique: true).sort_by { |h, k| k.size }.to_h
  end

  private

  def view_count(unique:)
    @entry.each_with_object({}) do |(k, v), list|
    list[k] = unique ? v.length : v.uniq.length
    end
  end

  def add_pageview(url, ip)
  if @pages[url].nil?
    @pages[url] = [ip]
  else
    @pages[url] << ip
    end
  end
end
