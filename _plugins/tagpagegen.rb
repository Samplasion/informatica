module Jekyll
  class TagPageGenerator < Generator
    safe true

    def generate(site)
      site.data['langs'].keys.each do |lang|
        site.pages << TagPage.new(site, site.source, lang)
      end
    end
  end

  class TagPage < Page
    def initialize(site, base, tag)
      @site = site
      @base = base
      @dir  = File.join('linguaggio', tag)
      @name = 'index.html'

      lang = site.data['langs']["#{tag}"]

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag.html')
      self.data['tag'] = tag
      self.data['site_data'] = site.data
      self.data['plang'] = lang
      self.data['title'] = "Post relativi a #{lang['name']}"
      self.data['tagged_posts'] = site.documents.filter { |post|
        (post.data['tags'] || []).include? tag
      }.sort { |a, b| a['date'] <=> b['date'] }
    end
  end
end
  