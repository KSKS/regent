

task :parse_menu do

  templates = 
'<div class="sub-menu-entree">
  <div class="sub-menu-entree-price">
    <ul>
      <li><span class="price-value">$</span></li>
    </ul>
  </div>
  <div class="sub-menu-entree-name">
    !!!
  </div>
</div>'


  lines = IO.readlines(ENV['file'])

  lines.each_slice(2) do |e|
    puts templates.sub('$', e[1].strip).sub('!!!', e[0].strip)
  end
    
end
