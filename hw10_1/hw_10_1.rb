class HtmlBuilder
  attr_reader :result
  def initialize(&block)
    @result = ''
    @space = 2
    block.call(self) if block_given?
  end

  def html_doc!
    @result = "<html> \n #{@result}\n</html>" unless result == ''
  end

  def body(&block)
    @result += "<body>\n"
    block.call(self)
    @result += ' </body>'
  end


  private

  def method_missing(method_name, *args, class_name: nil, &block)

    @result += class_name.nil? ? ' '*@space + "<#{method_name}>" : ' '*@space + "<#{method_name} class = \"#{class_name}\">"
    @result += (args.empty? && !block_given?) ? '/>' :"#{args.first}"
    if block_given?
      @space += 1
      block.call(self)
      @space -= 1
    end
    if !args.empty? || block_given?
      @result += block_given? ? ' ' * @space + "</#{method_name}>" : "</#{method_name}>"
    end
    @result += "\n"
  end
end


html_builder = HtmlBuilder.new do |html|
  html.body do |body|
    body.h1('Hello!', class_name: 'h1-formatted margin-10')

    body.p('This is paragraph') do |p|
      p.p('Paragraph inside paragraph')
    end

    body.div('New div element') do |div|
      div.p('Paragraph in div')
    end

    body.div(class_name: 'empty-div')
  end
end

puts html_builder.html_doc!
puts HtmlBuilder.new.html_doc! 
