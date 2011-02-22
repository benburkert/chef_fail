define :outer do
  _foo = params[:foo] || raise("foo is nil")

  execute 'outer test' do
    command "[[ ! -s #{params[:foo]} ]]"
  end

  inner 'explicit' do
    foo _foo
  end

  inner 'implicit' do
    foo params[:foo]
  end
end
